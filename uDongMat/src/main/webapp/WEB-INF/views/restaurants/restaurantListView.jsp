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

<script type="text/javascript" 
	src="/uDongMat/resources/js/jquery-3.3.1.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		var orderInputObj = document.getElementById('orderVal');

		var orderVal = orderInputObj.value;

		var orderObj = document.getElementById('order');

		var optionsArr = orderObj.options;

		for (var i = 0; i < optionsArr.length; i++) {
			//        alert(optionsArr[0].value);
			if (optionsArr[i].value == orderVal) {
				optionsArr[i].selected = 'selected';
				break;
			}
		}
	});

	function moveToAddFnc() {
		location.href = "add.do";
	}

	function orderFnc(value) {
		var orderForm = document.getElementById("orderForm");
		orderForm.submit();
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
				<form id="orderForm" action="./listOrder.do" method="get">
					<select id="order" name="order" onchange="orderFnc(this.value);">
						<option value="restaurantNo">최신순</option>
						<option value="restaurantName">이름순</option>
					</select>
						<input type="hidden" id="orderVal" value="${order}">
				</form>
			</div>	
				
			<form id="categoryForm" action="./listCategory.do" method="get">
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