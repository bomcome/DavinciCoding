<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

#field div {
   float: left;
}

#field div:nth-child(2n+1) {
   clear: left;
}

</style>
<title>Insert title here</title>
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
		var url = 'deleteCtr.do?restaurantNo=' + restaurantNo;
		location.href = url;
	}
	
</script>
</head>
<body>
 	<jsp:include page="../headerTitle.jsp"/> 
	<jsp:include page="../headerButtons.jsp"/>
	
	<div>이미지 파일</div>
	<form action="./update.do" method="get">
		<div id="fileContent">

		<div>
			<c:forEach var="row" items="${fileList}" varStatus="obj">
			<input type="hidden" id="fileIdx_${obj.index}" name="fileIdx" value="${row.IDX}">
			<img alt="image not found" style="width: 130px; height: 130px;"
				 src="<c:url value='/img/${row.STORED_FILE_NAME}'/>"/><br>
			</c:forEach>
		</div>

		<div>
			<input type="hidden" name='restaurantNo' value='${restaurantsVo.restaurantNo}'>
			<input type="text" name='restaurantName' value='${restaurantsVo.restaurantName}' readonly="readonly">
			<input type="text" name='category' value='${restaurantsVo.category}' readonly="readonly">
			<input type="text" name='phone' value='${restaurantsVo.phone}' readonly="readonly">
			<input type="text" name='operatingTime' value='${restaurantsVo.operatingTime}' readonly="readonly">
			<input type="text" name='address' value='${restaurantsVo.address}' readonly="readonly">
		</div>

	<div>
		<h2>메 뉴</h2>
		<c:forEach var="menusVo" items="${menusList}">
			<input type="text" name='"menuName"' value='${menusVo.menuName}' readonly="readonly">
			<input type="text" name='price' value='${menusVo.price}' readonly="readonly">
		</c:forEach>
		<h2>맛집소개</h2>
		<input type="text" name='contents' value='${restaurantsVo.contents}' readonly="readonly">
	</div>
	
	<input type="button" value="이전화면" onclick="moveToListFnc(${restaurantsVo.restaurantNo});">
	<input type="button" value="수정" onclick="moveToUpdateFnc(${restaurantsVo.restaurantNo});">
	<input type="button" value="삭제" onclick="moveTodeleteCtrFnc(${restaurantsVo.restaurantNo});">
	
	</form>
	
	<jsp:include page="../Tail.jsp"/>

</body>
</html>