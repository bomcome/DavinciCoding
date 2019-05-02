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
	width: 50px;
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
</script>
</head>
<body>

	<input type="button" value="맛집등록" onclick="moveToAddFnc();">

	<div>
		<div class="board">
			<div>
				<a href="board.do">게시판</a>
			</div>
		</div>
		<div class="category">
			<form action="./listOrder.do" method="get">
				<div>
					<input type="submit" name="category" value="">
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

	<form action="./list.do" method="get">
		<input type="text" name="keyword" value="${keyword}">
		<input type="submit" value="검색">
	</form>

	<form action="./orderSelect.do" method="get">
		<select id="orderSelect" onchange="orderFunction()">
			<option value="restaurantNo">최신순</option>
			<option value="restaurantName">이름순</option>
		</select>
	</form>

	<div class="list">
		<c:forEach var="restaurantsFileVo" items="${restaurantsList}">
			<div><a href='./listOne.do?restaurantNo=${restaurantsFileVo.restaurantNo}'>
					<img alt="${restaurantsFileVo.restaurantName}" style="width: 200px; height: 130px;"
					src="<c:url value='/img/${restaurantsFileVo.storedFileName}'/>"/>
					<h2>(${restaurantsFileVo.category})${restaurantsFileVo.restaurantName}</h2>
			</a></div>
		</c:forEach>
	</div>

</body>

</html>