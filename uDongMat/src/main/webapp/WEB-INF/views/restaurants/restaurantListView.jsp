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

/* .list { */
/* 	width: 300px; */
/* 	height: 260px; */
/* 	text-align: center; */
/* } */

.list div {
	margin: 10px;
	padding: 10px;
	list-style-type: none;
	float: left;
	width: 260px;
	height: 220px;
	text-align: center;
	background: ;
}

.list div:nth-child(4n+1) {
	clear: left;
}

.ScrollButton {
  position: fixed;   /* 버튼의 위치 고정 */
  right: 10px;       /* x 위치 입력 */
  cursor: pointer;   /* 호버링 했을 때 커서 모양 변경 */
  z-index: 10;       /* 다른 태그에 가려지지 않게 우선순위 변경 */
  display: none;     /* 스크롤 위치에 상관없이 보이게 하려면 생략 */
}
/* 두 태그에 각각 y 위치 입력 */
#TopButton {
  bottom: 100px;        
}
#BottomButton {
  bottom: 70px;
}


</style>
<title>Insert title here</title>

<script type="text/javascript" src="/uDongMat/resources/js/jquery-3.3.1.js"></script>

<script type="text/javascript">
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 100) {
				$('.ScrollButton').fadeIn();
			} else {
				$('.ScrollButton').fadeOut();
			}
		});

		$("#TopButton").click(function() {
			$('html').animate({
				scrollTop : 0
			}, 600);
		});

		$("#BottomButton").click(function() {
			$('html').animate({
				scrollTop : ($('#footer').offset().top)
			}, 600);
		});
	});
</script>

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
	<div style="width: 1920px;">
		<jsp:include page="/WEB-INF/views/headerTitle.jsp" />
		<jsp:include page="/WEB-INF/views/headerButtons.jsp" />
		<jsp:include page="/WEB-INF/views/slider.jsp" />

		<div style="margin-left: 330px;">
			<div>
				<div class="board"></div>
				<div class="category">
<%-- 					<div>
					<c:if test="${_memberVo_ != null}">
						<input type="button" value="맛집등록" onclick="moveToAddFnc();">
					</c:if>
					<c:if test="${_memberVo_ == null}">
						<input type="button" value="맛집등록" onclick="moveToLoginFnc();">
					</c:if>
					</div>
					<div>
						<a href="../board/list.do">게시판</a>
					</div>
 --%>
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
			<div>
				<a href='./listOne.do?restaurantNo=${restaurantsFileVo.restaurantNo}'>
					<img alt="${restaurantsFileVo.restaurantName}" style="width: 260px; height: 180px;"
					src="<c:url value='/img/${restaurantsFileVo.storedFileName}'/>" />
					<h2>(${restaurantsFileVo.category})${restaurantsFileVo.restaurantName}</h2>
				</a>
			</div>
		</c:forEach>
	</div>
		</div>

		<div style="clear: left;">
			<c:if test="${pageScale * pagingMap.restaurantPaging.curPage < pagingMap.totalCount}">
				<input type="button" value="더보기" onclick=myFunction(); id="moreViewButton">
			</c:if>
		</div>
		<c:if test="${category == null && order == null}">
		<div>
			<form action="./list.do" id="pagingForm" method="get">
				<input type="hidden" name='restaurantNo' value='${restaurantsFileVo.restaurantNo}'>
				<input type="hidden" name='category' value='${category}'>
				<input type="hidden" id="curPage" name="curPage"
					value="${pagingMap.restaurantPaging.curPage}"> <input
					type="hidden" id="totalCount" name="totalCount"
					value="${pagingMap.totalCount}"> <input type="hidden"
					id="currentScroll" name="currentScroll" value="${currentScroll}">
				<input type="hidden" id="pageScale" name="pageScale"
					value="${pageScale}">
			</form>
		</div>
		</c:if>
		<c:if test="${category != null}">
		<div>
			<form action="./listCategory.do" id="pagingForm" method="get">
				<input type="hidden" name='restaurantNo' value='${restaurantsFileVo.restaurantNo}'>
				<input type="hidden" name='category' value='${category}'>
				<input type="hidden" id="curPage" name="curPage"
					value="${pagingMap.restaurantPaging.curPage}"> <input
					type="hidden" id="totalCount" name="totalCount"
					value="${pagingMap.totalCount}"> <input type="hidden"
					id="currentScroll" name="currentScroll" value="${currentScroll}">
				<input type="hidden" id="pageScale" name="pageScale"
					value="${pageScale}">
			</form>
		</div>
		</c:if>
		<c:if test="${order != null}">
		<div>
			<form action="./listOrder.do" id="pagingForm" method="get">
				<input type="hidden" name='restaurantNo' value='${restaurantsFileVo.restaurantNo}'>
				<input type="hidden" name='order' value='${order}'>
				<input type="hidden" id="curPage" name="curPage"
					value="${pagingMap.restaurantPaging.curPage}"> <input
					type="hidden" id="totalCount" name="totalCount"
					value="${pagingMap.totalCount}"> <input type="hidden"
					id="currentScroll" name="currentScroll" value="${currentScroll}">
				<input type="hidden" id="pageScale" name="pageScale"
					value="${pageScale}">
			</form>
		</div>
		</c:if>
		<div>		
			<a id="TopButton" class="ScrollButton"><img src="http://www.sibtower.com/images/top_button.png" width="50px" height="50px"></a>
<!-- 			<a id="BottomButton" class="ScrollButton"><img src="(BottomButton 이미지 주소)"></a> -->
			<jsp:include page="/WEB-INF/views/Tail.jsp" />
		</div>
	</div>
<!-- 	<a id="footer"></a> -->
</body>
</html>