<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>

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

<a id="TopButton" class="ScrollButton"><img src="http://www.beotech.com/images/quickmenu/top_button.png" width="50px" height="50px"></a>
<!-- <a id="TopButton" class="ScrollButton"><img src="http://www.sibtower.com/images/top_button.png" width="50px" height="50px"></a> -->
<!-- <a id="BottomButton" class="ScrollButton"><img src="(BottomButton 이미지 주소)"></a> -->
