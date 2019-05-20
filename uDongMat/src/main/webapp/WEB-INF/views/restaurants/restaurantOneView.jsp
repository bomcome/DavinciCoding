<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.all {
	width: 1200px;
	margin: 0 auto;
	text-align: center;
/*  	border: 1px solid red; */
}

.imgAndInfo {
	width: 1200px;
	height: 450px;
/*   	border: 1px solid blue; */
}

.img {
	width: 650px;
	height: 450px;
	float: left;
/*  	border: 1px solid yellow; */
}

.info {
	width: 506px;
	height: 430px;
	padding: 10px 20px 10px 20px;
	float: left;
 	vertical-align:middle;
/*  	border: 1px solid green; */
}

.info input, textarea {
	width: 450px;
 	padding: 10px;
	font-size: 20px;
	text-align: justify;
	text-justify:distribute-all-lines;
 	border: 0px;
}

.restaurantContents {
	width: 1200px;
	margin-top: 50px;
}

.restaurantContents div {
	display:table-cell;
	text-align:center;
	vertical-align:middle;
	width: 1200px;
	height: 50px;
	margin-bottom: 20px;
	color: black;
	font-size: 18px;
	font-weight: bold;
	background-color: #ededed;
}

.restaurantContents textarea {
	border: 1px solid gray;
}

.menus {
	width: 1200px;
	margin-top: 50px;
	margin-bottom: 50px;

}

#menusTitle {
	display:table-cell;
	text-align:center;
	vertical-align:middle;
	width: 1200px;
	height: 50px;
	margin-bottom: 20px;
	color: black;
	font-size: 18px;
	font-weight: bold;
	background-color: #ededed;
}

.button {
	width: 1200px;
	text-align: center;
	margin-top: 20px;"
}

#field div {
	float: left;
	padding: 10px 50px 10px 50px;
	margin: 10px 0px 10px 0px;
	width: 500px;
}

#field  div:nth-child(2n-1) {
	clear: left;
}

#field  div:nth-child(2n) {
 	padding-left: 49px;
	border-left: 1px solid gray;
}

#field input {
	width: 200px;
	font-size: 20px;
   	border: 0px;
}

ul {
	list-style: none;
	padding-left: 0px;
}

input[type=button]:hover, input[type=submit]:hover, button:hover {
	color: #FFD9EC;
	background-color: #5D5D5D;
}

.button input{
	width: 300px;
	height: 40px;
	margin-left: 35px;
	margin-right: 35px;
}


</style>
<title>Insert title here</title>

<script type="text/javascript"
	src="/uDongMat/resources/js/jquery-3.3.1.js"></script>

<script type="text/javascript">

   function moveToListFnc(restaurantNo) {
      var url = 'list.do?restaurantNo=' + restaurantNo;
      location.href = url;
   }
   
   function moveToUpdateFnc(restaurantNo) {
      var url = 'update.do?restaurantNo=' + restaurantNo;
      location.href = url;
   }
   
   function moveTodeleteCtrFnc(restaurantNo) {
	   if(confirm("정말로 삭제하시겠습니까?") == true){
	        alert("삭제되었습니다.");
	        var url = 'deleteCtr.do?restaurantNo=' + restaurantNo;
	        location.href = url;
	    }
	    else{
	        return ;
	    }
   }
   
	function commentRegisterFnc() {
		
		var commentContentsObj = document.getElementById('commentContents');
		var commentContentsVal = commentContentsObj.value;
		
		var commentAddFormObj = document.getElementById('commentAddForm');
		
		if(commentContentsVal == ''){
			commentContentsObj.focus();
		}else{
			commentAddFormObj.submit();
		}
	
	}
   
</script>
</head>
<body>
<div style="width: 1920px;">
	<jsp:include page="../headerLeftButtons.jsp"/>
	<jsp:include page="/WEB-INF/views/headerTitle.jsp" />
	<jsp:include page="/WEB-INF/views/headerButtons.jsp" />

	<div class="all">
		<form action="./update.do" method="get">
			<input type="hidden" name='memberNo' value='${_memberVo_.memberNo}'>
			<div class="imgAndInfo">
				<div class="img">
					<div id="fileContent">
						<div>
							<c:forEach var="row" items="${fileList}" varStatus="obj">
								<input type="hidden" id="fileIdx_${obj.index}" name="fileIdx" value="${row.IDX}">
								<img alt="image not found" style="width: 650px; height: 450px;" src="<c:url value='/img/${row.STORED_FILE_NAME}'/>" />
							</c:forEach>
						</div>
					</div>
				</div>

				<input type="hidden" name='restaurantNo' value='${restaurantsVo.restaurantNo}'>

				<div class="info">
					<ul>
						<li><input type="text" name='restaurantName' value='업체명          ${restaurantsVo.restaurantName}' readonly="readonly">
					</ul>    
					<ul>
						<li><input type="text" name='category' value='분류             ${restaurantsVo.category}'
							readonly="readonly">
					</ul>
					<ul>
						<li><input type="text" name='phone' value='연락처          ${restaurantsVo.phone}'
							readonly="readonly">
					</ul>
					<ul>
						<li><input type="text" name='operatingTime' value='영업시간      ${restaurantsVo.operatingTime}~${restaurantsVo.closingTime}'
							readonly="readonly">
					</ul>
					<ul>
						<li><input type="text" name='closedDates' value='휴점일          ${restaurantsVo.closedDates}'
							readonly="readonly">
					</ul>
					<ul>
						<li><textarea style="height: 50px; resize: none;" readonly="readonly" name="address">주소      ${restaurantsVo.address}</textarea>
					</ul>
				</div>
			</div>

			<div class="restaurantContents">
				<div>맛집소개</div>
				<textarea style="width: 1178px; height: 200px; resize: none;"
					name="contents" readonly="readonly">${restaurantsVo.contents}</textarea>
			</div>

			<div class="menus">
				<div id="menusTitle">메 뉴</div>
				<div id="field">
					<c:forEach var="menusVo" items="${menusList}">
						<div>
							<input type="text" name='menuName' value='${menusVo.menuName}' readonly="readonly">
							<input type="text" name='price' style="text-align: right;"
							 value='<fmt:formatNumber pattern="#,###" value="${menusVo.price}"/>' readonly="readonly">원
						</div>
					</c:forEach>
				</div>
				<div style="clear: left;"></div>
			</div>

			<div class="button">
				<input type="button" value="이전화면" onclick="moveToListFnc(${restaurantsVo.restaurantNo});">

				<c:if test="${_memberVo_.memberGrade == 'admin' || _memberVo_.memberNo == restaurantsVo.memberNo}">
					<input type="button" value="수정" onclick="moveToUpdateFnc(${restaurantsVo.restaurantNo});">
					<input type="button" value="삭제" onclick="moveTodeleteCtrFnc(${restaurantsVo.restaurantNo});">
				</c:if>
			</div>
		</form>
		<jsp:include page="/WEB-INF/views/review/reviewAddForm.jsp" />
		<jsp:include page="/WEB-INF/views/review/reviewListView.jsp" />
	</div>
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	</div>
</body>
</html>