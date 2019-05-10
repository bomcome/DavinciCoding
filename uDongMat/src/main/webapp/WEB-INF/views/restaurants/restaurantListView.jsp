<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

* { margin: 0; padding: 0; }
body { font: 17px 'Nanum Gothic', sans-serif; }
#slider { width: 1200px; margin: 0 auto; }
.bxslider li { list-style: none;}


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

<!-- <link rel="stylesheet" href="css/style.css"> -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script type="text/javascript" src="/uDongMat/resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    

<script type="text/javascript">
	$(document).ready(function() {
		$('.bxslider').bxSlider({
			auto : true, // 자동으로 애니메이션 시작
			speed : 1000, // 애니메이션 속도
			pause : 2000, // 애니메이션 유지 시간 (1000은 1초)
			mode : 'fade', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
			autoControls : true, // 시작 및 중지버튼 보여짐
			pager : true, // 페이지 표시 보여짐
			captions : true, // 이미지 위에 텍스트를 넣을 수 있음
		});
	});
</script>

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

		<div id="slider">
			<ul class="bxslider">
				<li><a href="#"><img
						src="http://img1.daumcdn.net/thumb/R1920x0/?fname=http%3A%2F%2Fcfile4.uf.tistory.com%2Fimage%2F99C7143A5BEE75FB3092D4"
						alt="" title="이미지1"></a></li>
				<li><a href="#"><img
						src="http://img1.daumcdn.net/thumb/R1920x0/?fname=http%3A%2F%2Fcfile10.uf.tistory.com%2Fimage%2F99C7223A5BEE75FB303A8E"
						alt="" title="이미지2"></a></li>
				<li><a href="#"><img
						src="http://img1.daumcdn.net/thumb/R1920x0/?fname=http%3A%2F%2Fcfile7.uf.tistory.com%2Fimage%2F9982093A5BEE75FC259992"
						alt="" title="이미지3"></a></li>
			</ul>
		</div>

		<div style="margin-left: 330px;">
			<div>
				<div class="board"></div>
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
					<div>
						<a href='./listOne.do?restaurantNo=${restaurantsFileVo.restaurantNo}'>
							<img alt="${restaurantsFileVo.restaurantName}" style="width: 200px; height: 130px;"
							src="<c:url value='/img/${restaurantsFileVo.storedFileName}'/>" />
							<h2>(${restaurantsFileVo.category})${restaurantsFileVo.restaurantName}</h2>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<div style="clear: left;">
		
			<a id="TopButton" class="ScrollButton"><img src="http://www.sibtower.com/images/top_button.png" width="50px" height="50px"></a>
<!-- 			<a id="BottomButton" class="ScrollButton"><img src="(BottomButton 이미지 주소)"></a> -->
			<jsp:include page="/WEB-INF/views/Tail.jsp" />
		</div>
	</div>
<!-- 	<a id="footer"></a> -->
</body>
</html>