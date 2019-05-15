<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.restaurantTopInput {
	width: 400px;
	height: 60px;
	font-size: 25px;
}

.restaurantInput {
	width: 300px;
	height: 40px;
}

#field div {
	float: left;
	margin: 10px;
	width: 498px;
}

#field input {
	height: 40px;
	font-size: 0.8em;
	outline: none;
	display: inline;
}

#field input[type="text"] {
	box-sizing: border-box;
	color: black;
}

#field  input[type=button] {
	padding-bottom: 3px;
	margin-left: -2px;
}

#field  div:nth-child(2n+1) {
	clear: left;
}

ul {
	list-style: none;
	padding-left: 0px;
}

input[type=button]:hover, input[type=submit]:hover, button:hover {
	color: #FFD9EC;
	background-color: #5D5D5D;
}
</style>
<title>Insert title here</title>

<script type="text/javascript"
	src="/uDongMat/resources/js/jquery-3.3.1.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
	    $("a[id^='delete']").on("click", function(e){ //삭제 버튼 
	       e.preventDefault();
	       deleteFile($(this));
	    });
	 });
	
	$(function() {
	  var $input = $("#input");
	  $input.on('keyup', function() {
	    // 입력 값 알아내기
	    var _this = this;
	    numberFormat(_this)
	  })

	});
	
	//회원가입 버튼
	function restaurantAddFnc() {
		var addFormObj = document.getElementById('addForm');
		var fileContentVal = document.getElementById('fileContent');
		var restaurantNameVal = document.getElementById('restaurantName');
		var categoryVal = document.getElementById('category');
		var phoneVal = document.getElementById('phone');
		var operatingTimeVal = document.getElementById('operatingTime');
		var closingTimeVal = document.getElementById('closingTime');
		var closedDatesVal = document.getElementById('closedDates');
		var addressVal = document.getElementById('address');
		var contentsVal = document.getElementById('contents');
		var menuNameVal = document.getElementsByClassName("menuName");
		
		if (restaurantNameVal.value == '') {
			alert("맛집명을 입력하세요!");
			restaurantNameVal.focus();
			return;
		}
		else if(fileContentVal == '' ){
			alert("메뉴를 입력하세요!");
			fileContentVal.focus();
			return;
		}
		else if(menuNameVal == null ){
			alert("메뉴를 입력하세요!");
			menuNameVal.focus();
			return;
		}
		else if(categoryVal.value == '' ){
			alert("맛집 분류를 선택하세요!");
			categoryVal.focus();
			return;
		}
		else if(phoneVal.value == '' ){
			alert("연락처를 입력하세요!");
			phoneVal.focus();
			return;
		}
		else if(operatingTimeVal.value == '' ){
			alert("개점 시간을 선택하세요!");
			operatingTimeVal.focus();
			return;
		}
		else if(closingTimeVal.value == '' ){
			alert("폐점 시간을 선택하세요!");
			closingTimeVal.focus();
			return;
		}
		else if(closingTimeVal.value == operatingTimeVal.value ){
			alert("개점 시간과  폐점시간은 같을수 없습니다.!");
			closingTimeVal.focus();
			return;
		}
		else if(closedDatesVal.value == '' ){
			alert("휴점일을 입력하세요!");
			closedDatesVal.focus();
			return;
		}
		else if(addressVal.value == '' ){
			alert("주소를 입력하세요!");
			addressVal.focus();
			return;
		}
		else if(contentsVal.value == '' ){
			alert("맛집 소개를 입력하세요!");
			contentsVal.focus();
			return;
		}
		else{
			alert('맛집등록이 완료되었습니다. 대박나세요!');
			addFormObj.submit();
		}
	}

	// 콤마 찍기
	function comma(str) {
	  str = String(str);
	  return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}

	// 콤마 풀기
	function uncomma(str) {
	  str = String(str);
	  return str.replace(/[^\d]+/g, '');
	}

	function numberFormat(obj) {
	  obj.value = comma(uncomma(obj.value));
	}

   function add_menu(){
      // pre_set 에 있는 내용을 읽어와서 처리..

      var htmlStr;
      htmlStr = '<input type="text" name="menuName" style="width: 280px;" placeholder="메뉴 이름을 입력하세요">';
      htmlStr = htmlStr + '<input type="text" name="price" style="width: 160px;" placeholder="메뉴 가격을 입력하세요">';
      htmlStr = htmlStr + '<input type="button" value="삭제" onclick="remove_menu(this);">';
      
//       var fieldVal = document.getElementById('field');
//       fieldVal.innerHTML = fieldVal.innerHTML + htmlStr;
      
     var div = document.createElement('div');
     div.innerHTML = div.innerHTML + htmlStr;
     document.getElementById('field').appendChild(div);

   }
   
   function remove_menu(obj){
      // obj.parentNode 를 이용하여 삭제
      document.getElementById('field').removeChild(obj.parentNode);
   }
   
   function moveToListFnc(restaurantNo) {
      var url = 'list.do?restaurantNo=' + restaurantNo;
      location.href = url;
   }
   
   function addFileFnc(){
	      var obj = $('#fileContent');
	      
	      var htmlStr = "";
	      
	      htmlStr += '<div>';
	      htmlStr += '<input type="hidden" id="fileIdx" name="fileIdx" value="">';
	      htmlStr += '<input type="file" id="file0" name="file0">';      
	      htmlStr += '<a href="#this" id="delete0">삭제</a><br>';
	      htmlStr += '</div>';
	         
	      obj.html(htmlStr);
	}
   
</script>
</head>
<body>
	<div style="width: 1920px;">

		<jsp:include page="/WEB-INF/views/headerTitle.jsp" />
		<jsp:include page="/WEB-INF/views/headerButtons.jsp" />

		<div style="margin-left: 450px;">
			<form action="./addCtr.do" id="addForm" method="post" enctype="multipart/form-data">
				<input type="hidden" name='memberNo' value='${_memberVo_.memberNo}'>
				<div style="width: 1050px; height: 500px; padding: 20px; border: 1px solid black;">
					<div style="width: 600px; height: 480px; border: 1px solid black; float: left; position: relative;">
						<div id="fileContent" style="left: 10px; bottom: 10px; font-size: 1.0em; font-weight: bold; position: absolute;">
							<input type="hidden" id="fileIdx" name="fileIdx" value="">
							<input type="file" id="file0" name="file0"> <a
								href="#this" id="delete0" onclick="addFileFnc();">삭제</a>
						</div>
					</div>

					<div
						style="width: 400px; height: 440px; padding: 20px; margin-bottom: 4px; border: 1px solid black; float: left;">
						<ul>
							<li><input type="text" class="restaurantTopInput" id="restaurantName" name='restaurantName' placeholder="맛집명을 입력하세요">
						</ul>
						<ul>
							<li><select class="restaurantTopInput" id='category' name='category'>
									<option value="">분류를 선택하세요</option>
									<option value="한식">한식</option>
									<option value="중식">중식</option>
									<option value="일식">일식</option>
									<option value="양식">양식</option>
									<option value="분식">분식</option>
							</select>
						</ul>
						<ul>
							<li><input type="text" class="restaurantTopInput" id='phone' name='phone' placeholder="연락처를 입력하세요">
						</ul>
						<ul>
							<li><select class="" id='operatingTime' name='operatingTime'>
									<option value="">개점 시간을 선택하세요</option>
									<option value="오전 12:00">오전 12:00</option>
									<option value="오전 12:30">오전 12:30</option>
									<option value="오전 01:00">오전 01:00</option>
									<option value="오전 01:30">오전 01:30</option>
									<option value="오전 02:00">오전 02:00</option>
									<option value="오전 02:30">오전 02:30</option>
									<option value="오전 03:00">오전 03:00</option>
									<option value="오전 03:30">오전 03:30</option>
									<option value="오전 04:00">오전 04:00</option>
									<option value="오전 04:30">오전 04:30</option>
									<option value="오전 05:00">오전 05:00</option>
									<option value="오전 05:30">오전 05:30</option>
									<option value="오전 06:00">오전 06:00</option>
									<option value="오전 06:30">오전 06:30</option>
									<option value="오전 07:00">오전 07:00</option>
									<option value="오전 07:30">오전 07:30</option>
									<option value="오전 08:00">오전 08:00</option>
									<option value="오전 08:30">오전 08:30</option>
									<option value="오전 09:00">오전 09:00</option>
									<option value="오전 09:30">오전 09:30</option>
									<option value="오전 10:00">오전 10:00</option>
									<option value="오전 10:30">오전 10:30</option>
									<option value="오전 11:00">오전 11:00</option>
									<option value="오전 11:30">오전 11:30</option>
									<option value="오후 12:00">오후 12:00</option>
									<option value="오후 12:30">오후 12:30</option>
									<option value="오후 01:00">오후 01:00</option>
									<option value="오후 01:30">오후 01:30</option>
									<option value="오후 02:00">오후 02:00</option>
									<option value="오후 02:30">오후 02:30</option>
									<option value="오후 03:00">오후 03:00</option>
									<option value="오후 03:30">오후 03:30</option>
									<option value="오후 04:00">오후 04:00</option>
									<option value="오후 04:30">오후 04:30</option>
									<option value="오후 05:00">오후 05:00</option>
									<option value="오후 05:30">오후 05:30</option>
									<option value="오후 06:00">오후 06:00</option>
									<option value="오후 06:30">오후 06:30</option>
									<option value="오후 07:00">오후 07:00</option>
									<option value="오후 07:30">오후 07:30</option>
									<option value="오후 08:00">오후 08:00</option>
									<option value="오후 08:30">오후 08:30</option>
									<option value="오후 09:00">오후 09:00</option>
									<option value="오후 09:30">오후 09:30</option>
									<option value="오후 10:00">오후 10:00</option>
									<option value="오후 10:30">오후 10:30</option>
									<option value="오후 11:00">오후 11:00</option>
									<option value="오후 11:30">오후 11:30</option>
								</select>
								<span class=""> - </span>
								<select class="" id='closingTime' name='closingTime'>
									<option value="">폐점 시간을 선택하세요</option>
									<option value="오전 12:00">오전 12:00</option>
									<option value="오전 12:30">오전 12:30</option>
									<option value="오전 01:00">오전 01:00</option>
									<option value="오전 01:30">오전 01:30</option>
									<option value="오전 02:00">오전 02:00</option>
									<option value="오전 02:30">오전 02:30</option>
									<option value="오전 03:00">오전 03:00</option>
									<option value="오전 03:30">오전 03:30</option>
									<option value="오전 04:00">오전 04:00</option>
									<option value="오전 04:30">오전 04:30</option>
									<option value="오전 05:00">오전 05:00</option>
									<option value="오전 05:30">오전 05:30</option>
									<option value="오전 06:00">오전 06:00</option>
									<option value="오전 06:30">오전 06:30</option>
									<option value="오전 07:00">오전 07:00</option>
									<option value="오전 07:30">오전 07:30</option>
									<option value="오전 08:00">오전 08:00</option>
									<option value="오전 08:30">오전 08:30</option>
									<option value="오전 09:00">오전 09:00</option>
									<option value="오전 09:30">오전 09:30</option>
									<option value="오전 10:00">오전 10:00</option>
									<option value="오전 10:30">오전 10:30</option>
									<option value="오전 11:00">오전 11:00</option>
									<option value="오전 11:30">오전 11:30</option>
									<option value="오후 12:00">오후 12:00</option>
									<option value="오후 12:30">오후 12:30</option>
									<option value="오후 01:00">오후 01:00</option>
									<option value="오후 01:30">오후 01:30</option>
									<option value="오후 02:00">오후 02:00</option>
									<option value="오후 02:30">오후 02:30</option>
									<option value="오후 03:00">오후 03:00</option>
									<option value="오후 03:30">오후 03:30</option>
									<option value="오후 04:00">오후 04:00</option>
									<option value="오후 04:30">오후 04:30</option>
									<option value="오후 05:00">오후 05:00</option>
									<option value="오후 05:30">오후 05:30</option>
									<option value="오후 06:00">오후 06:00</option>
									<option value="오후 06:30">오후 06:30</option>
									<option value="오후 07:00">오후 07:00</option>
									<option value="오후 07:30">오후 07:30</option>
									<option value="오후 08:00">오후 08:00</option>
									<option value="오후 08:30">오후 08:30</option>
									<option value="오후 09:00">오후 09:00</option>
									<option value="오후 09:30">오후 09:30</option>
									<option value="오후 10:00">오후 10:00</option>
									<option value="오후 10:30">오후 10:30</option>
									<option value="오후 11:00">오후 11:00</option>
									<option value="오후 11:30">오후 11:30</option>
							</select>
						</ul>
						<ul>
							<li><input type="text" class="restaurantTopInput" id='closedDates' name='closedDates' placeholder="휴일을 입력하세요">
<!-- 							<div class="cont"> -->
<!-- 								<div class="_frequency_select  selectbox13"> -->
<!-- 									<select class="selectbox-source" style=""> -->
<!-- 										<option value="everyWeek">매주</option> -->
<!-- 										<option value="firstWeek">매월 첫째주</option> -->
<!-- 										<option value="secondWeek">매월 둘째주</option> -->
<!-- 										<option value="thirdWeek">매월 셋째주</option> -->
<!-- 										<option value="fourthWeek">매월 넷째주</option> -->
<!-- 										<option value="firstThirdWeek">매월 첫째주,셋째주</option> -->
<!-- 										<option value="secondFourthWeek">매월 둘째주,넷째주</option> -->
<!-- 									</select> -->
<!-- 								</div> -->

<!-- 								<p class="_repeat_week repeat_day" style="display: block;"> -->
<!-- 									<input type="checkbox" id="ch1_5" value="sun" class="input_chk"> -->
<!-- 									<label for="ch1_5">일</label> <input type="checkbox" id="ch1_6" -->
<!-- 										value="mon" class="input_chk"> <label for="ch1_6">월</label> -->
<!-- 									<input type="checkbox" id="ch1_7" value="tue" class="input_chk"> -->
<!-- 									<label for="ch1_7">화</label> <input type="checkbox" id="ch1_8" -->
<!-- 										value="wed" class="input_chk"> <label for="ch1_8">수</label> -->
<!-- 									<input type="checkbox" id="ch1_9" value="thu" class="input_chk"> -->
<!-- 									<label for="ch1_9">목</label> <input type="checkbox" id="ch1_10" -->
<!-- 										value="fri" class="input_chk"> <label for="ch1_10">금</label> -->
<!-- 									<input type="checkbox" id="ch1_11" value="sat" -->
<!-- 										class="input_chk"> <label for="ch1_11">토</label> -->
<!-- 								</p> -->
<!-- 							</div> -->
						</ul>
						<ul>
							<li><textarea style="width: 400px; height: 100px; resize: none;"
									id="address" name="address" placeholder="주소를 입력하세요"></textarea>
						</ul>
					</div>
					<ul>

					</ul>
				</div>

				<div
					style="width: 1050px; padding: 20px; border: 1px solid black; margin-top: 20px;">
					<span style="font-size: 30px; font-weight: bold;">맛집소개</span>
					<textarea
						style="width: 1030px; height: 200px; resize: none; margin-top: 10px; margin-bottom: 20px;"
						id="contents" name="contents" placeholder="맛집소개를 해주세요"></textarea>

					<div>
						<span style="font-size: 30px; font-weight: bold;">메뉴</span>
						<input type="button" style="width: 45px; height: 40px; margin-left: -5px; margin-bottom: 7px; vertical-align: middle;"
							value="추가" onclick="add_menu();">
					</div>
					<div id="field" style=""></div>

					<div style="clear: left;"></div>

				</div>
				<div style="width: 1095px; text-align: center; margin-top: 20px;">
					<input type="button" value="등록취소" class="restaurantInput"
						onclick="moveToListFnc(${restaurantsVo.restaurantNo});">
					<input type="button" value="등록완료" class="restaurantInput"
						onclick="restaurantAddFnc();" style="margin-left: 200px;">
				</div>
			</form>
		</div>
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
	</div>
</body>
</html>