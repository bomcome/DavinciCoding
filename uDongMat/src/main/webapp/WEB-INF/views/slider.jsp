<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>

* { margin: 0; padding: 0; }
body { font: 17px 'Nanum Gothic', sans-serif; }
#slider { width: 1200px; margin: 0 auto; }
.bxslider li { list-style: none;}

</style>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
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

<div id="slider">
	<ul class="bxslider">
		<li><a href="#"><img
				src="https://www.outback.co.kr/cmmn/imageView.do?filePath=/upload/mainVisual/20190320/20190320170640073009.jpg"
				alt="" title="이달의 최고 맛집"></a></li>
		<li><a href="#"><img
				src="https://www.outback.co.kr/cmmn/imageView.do?filePath=/upload/mainVisual/20190320/20190320170604808007.jpg"
				alt="" title="이달의 최고 맛집"></a></li>
		<li><a href="#"><img
				src="https://www.outback.co.kr/cmmn/imageView.do?filePath=/upload/mainVisual/20190430/20190430095353312027.jpg"
				alt="" title="이달의 최고 맛집"></a></li>
	</ul>
</div>