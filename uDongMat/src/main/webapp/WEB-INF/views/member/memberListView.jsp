<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
   table{
      width: 1200px;;
      margin: auto;
      text-align: center;
      border-collapse: collapse;
   }
   
   tr, th ,td {
     padding: 8px;
     text-align: left;
     border-bottom: 1px solid #ddd;
   }
   
   th{
     border-bottom: 3px solid black;
   }

   tr:nth-child(even){
      background-color: #f2f2f2
   }
   
   #text{
      padding-left : 730px;
      text-align: left;
      border-collapse: collapse;
   }
   
   #memberListViewDiv{
         height: 622px;
   }
   

</style>
<title>회원 목록</title>

<script type="text/javascript" 
   src="/uDongMat/resources/js/jquery-3.3.1.js"></script>
   
<script type="text/javascript">

   $(document).ready(function(){
      
      var searchOptionInputObj = document.getElementById('searchOptionVal');
      
      var searchOptionVal = searchOptionInputObj.value; 
      
      var selectObj = document.getElementById('searchOption');
      
      var optionsArr = selectObj.options;
      
      for (var i = 0; i < optionsArr.length; i++) {
//          alert(optionsArr[0].value);
         if(optionsArr[i].value == searchOptionVal){
            optionsArr[i].selected = 'selected';
            break;
         }
      }
   });
</script>

</head>
<body>

<div style="width: 1920px;">
   <jsp:include page="../headerLeftButtons.jsp"/>
   <jsp:include page="/WEB-INF/views/headerTitle.jsp" />
   <jsp:include page="/WEB-INF/views/headerButtons.jsp" />
<div style="width: 1920px;" id="memberListViewDiv">

<c:if test="${sessionScope._memberVo_.memberGrade == 'admin'}">


<!--  var=변수명  items=목록데이터 begin=시작인덱스 end=종료인덱스 -->
   <div style="margin-left: 1270px;">
      <form action="./list.do" method="get">
         <select name="searchOption" id="searchOption">
            <option value="email">이메일</option>  <!-- 이메일 -->
            <option value="nickName">닉네임</option>  <!-- 닉네임 -->
         </select>
         <input type="text" name="keyword" value="${keyword}">
         <input type="hidden" id="searchOptionVal" name="searchOption" value="${searchOption}">
         <input type="submit" value="검색">
      </form>
   </div>

	<table>
		<tr>
			<th>번호</th><th>회원이름</th>
			<th>이메일</th><th>가입일</th>
			<th>삭제</th>
		</tr>
	<c:forEach var="memberVo" items="${memberList}">
		<tr>
			<td>${memberVo.rownum}</td>
			<td>
				<a href='./listOne.do?memberNo=${memberVo.memberNo}'>${memberVo.nickName}</a>
			</td>
			<td>${memberVo.email}</td>
			<td>
				<fmt:formatDate value="${memberVo.createDate}"
					pattern="yyyy년 MM월 dd일 hh시 mm분"/>
			</td>
			<td>
				<a href='./deleteCtr.do?memberNo=${memberVo.memberNo}'>[삭제]</a>
			</td>
		</tr>
	</c:forEach>
	</table>
	
	<jsp:include page="/WEB-INF/views/common/memberPaging.jsp">
		<jsp:param value="${pagingMap}" name="pagingMap"/>
	</jsp:include>
	
	<form action="./list.do" id="pagingForm" method="post">
			<input type="hidden" id="curPage" name="curPage" 
				value="${pagingMap.memberPaging.curPage}">
			<input type="hidden" id="keyword" name="keyword" 
				value="${keyword}">
	</form>
	
	
	

</c:if>
<c:if test="${sessionScope._memberVo_.memberGrade != 'admin'}">
   해커는꺼져라
</c:if>
   
   
</div>
   <jsp:include page="/WEB-INF/views/Tail.jsp" />
</div>
</body>
</html>