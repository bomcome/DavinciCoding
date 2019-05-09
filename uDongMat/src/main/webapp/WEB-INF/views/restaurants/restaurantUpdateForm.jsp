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
	margin-left: -7px;
}

#field input[type=button] {
	padding-bottom: 3px;
	margin-left: -7px;
}

#field div:nth-child(2n+1) {
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

// 	$("#operatingTime > option[value='"+type+"']").attr("selected","true");
// 	$("#operatingTime > option[value='"+(${restaurantsVo.operatingTime})+"']").attr("selected","true");

   $(document).ready(function(){
      $("a[id^='delete']").on("click", function(e){ //삭제 버튼 
         e.preventDefault();
         deleteFile($(this));
      });
   });
   
	$(document).ready(function() {
		var orderInputObj = document.getElementById('operatingTimeVal');

		var orderVal = orderInputObj.value;

		var orderObj = document.getElementById('operatingTime');

		var optionsArr = orderObj.options;

		for (var i = 0; i < optionsArr.length; i++) {
			//        alert(optionsArr[0].value);
			if (optionsArr[i].value == orderVal) {
				optionsArr[i].selected = 'selected';
				break;
			}
		}
	});
	
	$(document).ready(function() {
		var orderInputObj = document.getElementById('closingTimeVal');

		var orderVal = orderInputObj.value;

		var orderObj = document.getElementById('closingTime');

		var optionsArr = orderObj.options;

		for (var i = 0; i < optionsArr.length; i++) {
			//        alert(optionsArr[0].value);
			if (optionsArr[i].value == orderVal) {
				optionsArr[i].selected = 'selected';
				break;
			}
		}
	});
   
   function add_menu(){
       // pre_set 에 있는 내용을 읽어와서 처리..
   
       var htmlStr;
       htmlStr = '<input type="text" name="menuName" style="width: 280px;" placeholder="메뉴 이름을 입력하세요">&nbsp;';
       htmlStr = htmlStr + '<input type="text" name="price" style="width: 160px;" placeholder="메뉴 가격을 입력하세요">&nbsp;';
       htmlStr = htmlStr + '<input type="button" value="삭제" onclick="remove_menu(this);">&nbsp;';
       
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
   
   function deleteFile(obj){
      obj.parent().remove();
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

			<form action="./updateCtr.do" method="post" enctype="multipart/form-data">

				<div style="width: 1050px; height: 500px; padding: 20px; border: 1px solid black">
					<div style="width: 600px; height: 480px; border: 1px solid black; float: left; position: relative;">
						<div id="fileContent">
							<div>
								<c:choose>
									<c:when test="${empty fileList}">
										<input type="hidden" id="fileIdx" name="fileIdx" value="">
										<input type="file" id="file0" name="file0">
										<a href="#this" id="delete0" onclick="addFileFnc();">삭제</a>
										<br>
									</c:when>
									<c:otherwise>
										<c:forEach var="row" items="${fileList}" varStatus="obj">
											<input type="hidden" id="fileIdx_${obj.index}" name="fileIdx"
												value="${row.IDX}">
											<img alt="image not found"
												style="width: 600px; height: 420px;"
												src="<c:url value='/img/${row.STORED_FILE_NAME}'/>" />
											<br>
											<div style="left: 10px; bottom: 10px; font-size: 1.0em; font-weight: bold; position: absolute;">
												${row.ORIGINAL_FILE_NAME}(${row.FILE_SIZE}kb)
												<input type="file" id="file_${obj.index}" name="file_${obj.index}">
												<a href="#this" id="delete0" onclick="addFileFnc();">삭제</a>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>

					<div style="width: 400px; height: 440px; padding: 20px; margin-bottom: 4px; border: 1px solid black; float: left;">
						<ul>
							<li><input type="hidden" name='restaurantNo'
								value='${restaurantsVo.restaurantNo}'>
							<li><input type="text" name='restaurantName'
								class="restaurantTopInput" placeholder="맛집명을 입력하세요"
								id='restaurantName' value='${restaurantsVo.restaurantName}'>
						</ul>
						<ul>
							<li><input type="text" name='category'
								class="restaurantTopInput" placeholder="분류를 선택하세요" id='category'
								value='${restaurantsVo.category}'>
						</ul>
						<ul>
							<li><input type="text" name='phone'
								class="restaurantTopInput" placeholder="연락처를 입력하세요" id='phone'
								value='${restaurantsVo.phone}'>
						</ul>
						<ul>
							<li><select class="" id="operatingTime" name='operatingTime' onchange="orderFnc(this.value)">
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
								<input type="hidden" id="operatingTimeVal" value="${restaurantsVo.operatingTime}" >
							<span class=""> - </span>
							<select class="" id="closingTime" name='closingTime' onchange="orderFnc(this.value)">
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
								<input type="hidden" id="closingTimeVal" value="${restaurantsVo.closingTime}">
						</ul>
						<ul>
							<li><textarea style="width: 400px; height: 100px; resize: none;"
									name="address" placeholder="주소를 입력하세요">${restaurantsVo.address}</textarea>
						</ul>
					</div>


				</div>
				<div style="width: 1050px; padding: 20px; border: 1px solid black; margin-top: 20px;">
					<span style="font-size: 30px; font-weight: bold;">맛집소개</span>
					<textarea style="width: 1030px; height: 200px; resize: none; margin-top: 10px; margin-bottom: 20px;"
						name="contents">${restaurantsVo.contents}</textarea>
					<div>
						<span style="font-size: 30px; font-weight: bold;">메뉴</span>
						<input type="button" style="width: 45px; height: 40px; margin-left: -5px; margin-bottom: 7px;
						 vertical-align: middle;" value="추가" onclick="add_menu();">
					</div>
					<div id="field">
						<c:forEach var="menusVo" items="${menusList}">
							<div>
								<input type="text" name='menuName' value='${menusVo.menuName}'
									style="width: 280px;" placeholder="메뉴 이름을 입력하세요">
								<input type="text" name='price' value='${menusVo.price}' style="width: 160px;"
								 placeholder="메뉴 가격을 입력하세요">
								<input type="button" value="삭제" onclick="remove_menu(this);">&nbsp;
							</div>
						</c:forEach>
					</div>

					<div style="clear: left;"></div>

				</div>
				<div style="width: 1095px; text-align: center; margin-top: 20px;">
					<input type="button" value="수정취소" class="restaurantInput" onclick="moveToListFnc(${restaurantsVo.restaurantNo});">
					<input type="submit" value="수정완료" class="restaurantInput">
				</div>
			</form>
		</div>
	</div>
</body>
</html>