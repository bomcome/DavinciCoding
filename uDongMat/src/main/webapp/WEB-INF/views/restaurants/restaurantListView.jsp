<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.board div {
	list-style-type: none;
	float: left;
	width: 50px;
	text-align: center;
}

.category div {
	list-style-type: none;
	float: left;
	width: 70px;
	text-align: center;
}

.list div {
	margin: 10px;
	padding: 10px;
	list-style-type: none;
	float: left;
	width: 200px;
	height: 200px;
	text-align: center;
	background: #8c8c8c;
}

.list div:nth-child(5n+1) {
	clear: left;
}
</style>
<title>Insert title here</title>
<script type="text/javascript">
	function moveToAddFnc() {
		location.href = "add.do";
	}
	
	function orderFunction() {
		var x = document.getElementById("orderSelect").value;
		document.getElementByClass("list").innerHTML = "You selected: " + x;
	}
	
	function listAllFnc() {
		var categoryFormObj = document.getElementById("categoryForm")
		var listAllVal = document.getElementById("listAll").value;
		listAllVal.innerHTML = "";
		categoryFormObj.submit();
		
	}
	
</script>
</head>
<body>
<div style="width: 1920px;">
   <jsp:include page="/WEB-INF/views/headerTitle.jsp" />
   <jsp:include page="/WEB-INF/views/headerButtons.jsp" />
 <div style="margin-left: 330px;">

	<div>
		<div class="board">
		</div>
		<div class="category"> 
				<div>
					<input type="button" value="맛집등록" onclick="moveToAddFnc();">
				</div>
				<div>
					<a href="../board/list.do">게시판</a>
				</div>
				
			<div>
				<form action="./orderSelect.do" method="get">
					<select id="orderSelect" onchange="orderFunction()">
						<option value="restaurantNo">최신순</option>
						<option value="restaurantName">이름순</option>
					</select>
				</form>
			</div>	
				
			<form id="categoryForm" action="./listOrder.do" method="get">
				<div>
					<input id="listAll" type="button" name="category" value="전체" onclick="listAllFnc();">
				</div>
				<div>
					<input type="submit" name="category" value="한식">
				</div>
				<div>
					<input type="submit" name="category" value="중식">
				</div>
				<div>
					<input type="submit" name="category" value="일식">
				</div>
				<div>
					<input type="submit" name="category" value="양식">
				</div>
				<div>
				<input type="submit" name="category" value="분식">
				</div>
			</form>
		</div>
	</div>
	
	<div style="text-align: right; margin-right: 400px;">
		<form action="./list.do" method="get">
			<input type="text" name="keyword" value="${keyword}">
			<input type="submit" value="검색">
		</form>
	</div>
	
	
	
	<div class="list">
		<c:forEach var="restaurantsFileVo" items="${restaurantsList}">
			<div><a href='./listOne.do?restaurantNo=${restaurantsFileVo.restaurantNo}'>
					<img alt="${restaurantsFileVo.restaurantName}" style="width: 200px; height: 130px;"
					src="<c:url value='/img/${restaurantsFileVo.storedFileName}'/>"/>
					<h2>(${restaurantsFileVo.category})${restaurantsFileVo.restaurantName}</h2>
			</a></div>
		</c:forEach>
	</div>
</div>
</div>
</body>
</html>