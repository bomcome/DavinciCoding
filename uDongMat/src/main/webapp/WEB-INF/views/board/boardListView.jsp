<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
 	#boardListContainer tr, td {
 		border-bottom: 1px solid #C6C6C6;
 		height: 35px; 
 	}
 	
	#boardListContainer #no {
		width: 100px;
	}
	#boardListContainer .boardTitle{
		width: 470px;
		
	}
	#boardListContainer #writer{
		width: 175px;
	}
	#boardListContainer #createDate{
		width: 170px;
	}
	
	#boardListContainer #hitsTd{
		width: 90px;
	}
	
	#boardListContainer #resommendCountTd{
		width: 90px;
	}
	
	#boardListContainer td {
		text-align: center;
		font-size: 14px;
		
	}
	#boardListContainer .boardTitle {
		text-align: left;
	}
	#boardListContainer #top td{
		font-weight: bold;
		font-size: 15px;
		
	}
	#boardListContainer #top .boardTitle{
		text-align: center;
	}
	
	#boardListContainer #board {
		margin-left: 380px;
		margin-right: 380px;
		border-collapse: collapse;
 		
	}
	
	#boardListContainer #freeBoard {
		float: left;
		font-weight: bold;
		font-size: 30px;
		color: #8C8C8C;
	}
	
	#boardListContainer #freeBoard a{
		text-decoration:none;
		color: #8C8C8C;
	}
	
	#boardListContainer #boardInput #formTag{
		text-align: left;
	}
	#boardListContainer input[type="text"] {
		margin-top: 8px;
		width: 250px;
	}
	#boardListContainer {
		width: 1920px;
	}
	
	#boardListContainer #formTag div{
		text-align: right;
	}
	
	#boardListContainer #boardListContainer #before{
		margin-left: 750px;
	}
	
	#center .write{
		
	}
	
	#boardListContainer > button{
		width: 100px;
		height: 40px;
		font-weight: bold;
	}
	
	#pagingForm {
/* 		margin-bottom: 50px; */
	}
	#center{
		text-align: center;
	}
	
	#boardListContainer #writeButtonsDiv{
		text-align: right;
	}
	
	#boardListContainer #writeButtonsDiv span{
		margin-right: 435px;
	}
	#boardListContainer .boardTitle a{
		text-decoration: none;
	}
	#boardListContainer #searchDiv input[type="text"]{
 		height: 17px;
 		margin-bottom: 0px;
	}
	
	#boardListContainer #searchDiv #searchOption{
		height: 23px;
/* 		border-bottom: 2px; */
	}
	#boardListContainer #searchDiv{
		height: 23px;
	}
	
	#boardListContainer #boardListViewDivForHeight{
		height: 648px;
	}
	#boardListContainer #boardTableDiv {
		height: 500px;
	}
</style>

<script type="text/javascript" 
	src="/uDongMat/resources/js/jquery-3.3.1.js"></script> 
<script type="text/javascript">
	$(document).ready(function(){
		var searchOptionInputObj = document.getElementById('searchOptionVal');
		
		var searchOptionVal = searchOptionInputObj.value; 
		
		var selectObj = document.getElementById('searchOption');
		
		var optionsArr = selectObj.options;
		
		for (var i = 0; i < optionsArr.length; i++) {
// 			alert(optionsArr[0].value);
			if(optionsArr[i].value == searchOptionVal){
				optionsArr[i].selected = 'selected';
				break;
			}
		}
	});
</script>
<title>Insert title here</title>

</head>
<body>
	<div id=boardListContainer>
	
 	<jsp:include page="../headerTitle.jsp"/> 
	<jsp:include page="../headerButtons.jsp"/>
	
	<div id="boardListViewDivForHeight">
	<div id="boardTableDiv">
	<table id="board">
		<tr>
			<td id="boardInput" colspan="6">
				<span id="freeBoard"><a href="./list.do">우동맛게시판(${totalCount})</a></span>
					<form action="./list.do" method="get" id="formTag">	
						<div id="searchDiv">
							<select name="searchOption" id="searchOption">
								<option value="all">제목+내용</option>
								<option value="title">제목</option>  
								<option value="writer">작성자</option>
							</select>
							<input type="text" name="keyword" value="${keyword}">
							<input type="submit" value="검색">
							
							<input type="hidden" id="searchOptionVal" value="${searchOption}">
						</div>
					</form>
			</td>
		</tr>
		<tr id="top">
			<td id="no">번호</td>
			<td class="boardTitle">제목</td>
			<td id="writer">작성자</td>
			<td id="createDate">작성일</td>
			<td id="hitsTd">조회수</td>
			<td id="resommendCountTd">추천수</td>
		</tr>
		
		<c:forEach var="boardVo" items="${boardList}">
			<tr>
				<td>${boardVo.rownum}</td>
				<td class="boardTitle">
					<a href='./one.do?boardNo=${boardVo.boardNo}&boardListCurPage=${curPage}'>${boardVo.title} [${boardVo.commentCount}]</a>
				</td>
				<td>${boardVo.nickname}</td>
				<td><fmt:formatDate value="${boardVo.createDate}" 
				pattern="yyyy/MM/dd HH:mm"/></td>
				<td>${boardVo.hits}</td>
				<td>${boardVo.recommendCount}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<div id="writeButtonsDiv">
		<span>
		<c:if test="${_memberVo_ != null}">
			<button class="write" onclick="location.href='add.do'">글쓰기</button>
		</c:if>
		<c:if test="${_memberVo_ == null}">
			<button class="write" type="button" onclick="location.href='../auth/login.do'">글쓰기</button>
		</c:if>
		</span>
	</div>
		
	
	<jsp:include page="/WEB-INF/views/common/paging.jsp">
		<jsp:param value="${pagingMap}" name="pagingMap"/>
	</jsp:include>
	<div id= "center">
		<form action="./list.do" id="pagingForm" method="post">
			<input type="hidden" id="curPage" name="curPage" 
				value="${pagingMap.boardPaging.curPage}">
			<input type="hidden" id="keyword" name="keyword" 
				value="${keyword}">
		</form>
	</div>
	</div>
	
	<jsp:include page="../Tail.jsp"/>
		
		
	</div>
	
	
	
</body>
</html>