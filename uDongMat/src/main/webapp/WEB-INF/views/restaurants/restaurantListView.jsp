<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#all {
	width: 1200px;
	margin: 0 auto;
	text-align: center;
}

.orderAndsearch div {
    display: inline-block;
	margin-left: 10px;
	float: left;
}

.list div {
	margin: 10px;
	padding: 10px;
	list-style-type: none;
	float: left;
	width: 260px;
	height: 220px;
	background:;
}

.list div:nth-child(4n+1) {
	clear: left;
}

.list a {
	color: black;
	font-size: 18px;
	font-weight: bold;
	text-decoration: none;
}

#moreViewButton {
	width: 1200px;
	height: 50px;
	color: black;
	font-size: 18px;
	font-weight: bold;
	border: 0;
	outline: 0;
	background-color: #ededed;
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

	function moveToLoginFnc() {
		location.href = "../auth/login.do";
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

	function myFunction() {

		var curPageVal = document.getElementById("curPage").value;

		var totalCountVal = document.getElementById('totalCount').value;
		var PAGE_SCALE_Val = document.getElementById('pageScale').value;
		var buttonObj = document.getElementById('moreViewButton');
		var buttonHeight = buttonObj.offsetTop;

		if (PAGE_SCALE_Val * curPageVal < totalCountVal) {

			//	          alert(buttonHeight);
			document.getElementById("currentScroll").value = buttonHeight;

			document.getElementById("curPage").value = Number(document
					.getElementById("curPage").value) + 1;
			document.getElementById("pagingForm").submit();
		}
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/headerTitle.jsp" />
	<jsp:include page="/WEB-INF/views/headerButtons.jsp" />
	<jsp:include page="/WEB-INF/views/slider.jsp" />
	
	<div id="all">
		<div class="orderAndsearch">
			<div>
				<form id="orderForm" action="./listOrder.do" method="get">
					<select id="order" name="order" onchange="orderFnc(this.value);">
						<option value="restaurantNo">최신순</option>
						<option value="restaurantName">이름순</option>
					</select> <input type="hidden" id="orderVal" value="${order}">
				</form>
			</div>
			<div>
				<form id="categoryForm" action="./listCategory.do" method="get">
					<input id="listAll" type="button" name="category" value="전체" onclick="listAllFnc();">
					<input type="submit" name="category" value="한식">
					<input type="submit" name="category" value="중식">
					<input type="submit" name="category" value="일식">
					<input type="submit" name="category" value="양식">
					<input type="submit" name="category" value="분식">
				</form>
			</div>
			<div>
				<form action="./list.do" method="get">
					<input type="text" name="keyword" value="${keyword}">
					<input type="submit" value="검색">
				</form>
			</div>
		</div>

		<div class="list">
			<c:forEach var="restaurantsFileVo" items="${restaurantsList}">
				<div>
					<a href='./listOne.do?restaurantNo=${restaurantsFileVo.restaurantNo}'>
						<img alt="${restaurantsFileVo.restaurantName}" style="width: 260px; height: 180px;"
						src="<c:url value='/img/${restaurantsFileVo.storedFileName}'/>" />
						[${restaurantsFileVo.category}] ${restaurantsFileVo.restaurantName}
					</a>
				</div>
			</c:forEach>
		</div>

		<div class="paging">
			<c:if test="${pageScale * pagingMap.restaurantPaging.curPage < pagingMap.totalCount}">
				<input type="button" id="moreViewButton" value="더보기" onclick="myFunction();">
			</c:if>
			<c:if test="${category == null && order == null}">
				<div>
					<form action="./list.do" id="pagingForm" method="get">
						<input type="hidden" name='restaurantNo' value='${restaurantsFileVo.restaurantNo}'>
						<input type="hidden" name='category' value='${category}'>
						<input type="hidden" id="curPage" name="curPage" value="${pagingMap.restaurantPaging.curPage}">
						<input type="hidden" id="totalCount" name="totalCount" value="${pagingMap.totalCount}">
						<input type="hidden" id="currentScroll" name="currentScroll" value="${currentScroll}">
						<input type="hidden" id="pageScale" name="pageScale" value="${pageScale}">
					</form>
				</div>
			</c:if>
			<c:if test="${category != null}">
				<div>
					<form action="./listCategory.do" id="pagingForm" method="get">
						<input type="hidden" name='restaurantNo' value='${restaurantsFileVo.restaurantNo}'>
						<input type="hidden" name='category' value='${category}'>
						<input type="hidden" id="curPage" name="curPage" value="${pagingMap.restaurantPaging.curPage}">
						<input type="hidden" id="totalCount" name="totalCount" value="${pagingMap.totalCount}">
						<input type="hidden" id="currentScroll" name="currentScroll" value="${currentScroll}">
						<input type="hidden" id="pageScale" name="pageScale" value="${pageScale}">
					</form>
				</div>
			</c:if>
			<c:if test="${order != null}">
				<div>
					<form action="./listOrder.do" id="pagingForm" method="get">
						<input type="hidden" name='restaurantNo' value='${restaurantsFileVo.restaurantNo}'>
						<input type="hidden" name='order' value='${order}'>
						<input type="hidden" id="curPage" name="curPage" value="${pagingMap.restaurantPaging.curPage}">
						<input type="hidden" id="totalCount" name="totalCount" value="${pagingMap.totalCount}">
						<input type="hidden" id="currentScroll" name="currentScroll" value="${currentScroll}">
						<input type="hidden" id="pageScale" name="pageScale" value="${pageScale}">
					</form>
				</div>
			</c:if>
		</div>
	</div>
	<div style="clear: left;"></div>

	<jsp:include page="/WEB-INF/views/scrollBtn.jsp" />
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
		<!-- 	<a id="footer"></a> -->
</body>
</html>