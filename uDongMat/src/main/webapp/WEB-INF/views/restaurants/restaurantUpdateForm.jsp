<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.all {
	width: 1200px;
	margin: 0 auto;
	text-align: center;
/*   	border: 1px solid red; */
}

.imgAndInfo {
	width: 1200px;
	height: 450px;
/*    	border: 1px solid blue; */
}

.img {
	width: 650px;
	height: 450px;
	float: left;
  	border: 1px solid black;
}

.info {
	width: 506px;
	height: 430px;
	padding: 10px 20px 10px 20px;
	float: left;
 	vertical-align:middle;
  	border: 1px solid black;
}

.info input, textarea {
	width: 450px;
 	padding: 10px;
	font-size: 20px;
	text-align: justify;
	text-justify:distribute-all-lines;
/*  	border: 0px; */
}

.selectCategory {
	width: 474px;
 	padding: 10px;
	font-size: 20px;
	text-align: justify;
	text-justify:distribute-all-lines;
}

.selectTime {
	width: 228px;
 	padding: 10px;
	font-size: 20px;
	text-align: justify;
	text-justify:distribute-all-lines;
}

.restaurantContents {
	width: 1200px;
	margin-top: 50px;
}

.restaurantContents div {
	display:table-cell;
	text-align:center;
	vertical-align:middle;
	width: 1200px;
	height: 50px;
	margin-bottom: 20px;
	color: black;
	font-size: 18px;
	font-weight: bold;
	background-color: #ededed;
}

.restaurantContents textarea {
	border: 1px solid gray;
}

.menus {
	width: 1200px;
	margin-top: 50px;
	margin-bottom: 50px;
}

#menusTitle {
	display:table-cell;
	text-align:center;
	vertical-align:middle;
	width: 1200px;
	height: 50px;
	margin-bottom: 20px;
	color: black;
	font-size: 18px;
	font-weight: bold;
	background-color: #ededed;
}

.button {
	width: 1200px;
	text-align: center;
	margin-top: 20px;"
}

#field div {
	float: left;
	padding: 10px 50px 10px 50px;
	margin: 10px 0px 10px 0px;
	width: 500px;
}

#field  div:nth-child(2n-1) {
	clear: left;
}

#field  div:nth-child(2n) {
 	padding-left: 49px;
	border-left: 1px solid gray;
}

#field input {
	width: 40px;
	height: 25px;
	font-size: 50x;
/*    	border: 0px; */
}

ul {
	list-style: none;
	padding-left: 0px;
}

input[type=button]:hover, input[type=submit]:hover, button:hover {
	color: #FFD9EC;
	background-color: #5D5D5D;
}

.button input{
	width: 300px;
	height: 40px;
	margin-left: 35px;
	margin-right: 35px;
}

</style>

<title>Insert title here</title>

<script type="text/javascript"
   src="/uDongMat/resources/js/jquery-3.3.1.js"></script>

<script type="text/javascript">

//    $("#operatingTime > option[value='"+type+"']").attr("selected","true");
//    $("#operatingTime > option[value='"+(${restaurantsVo.operatingTime})+"']").attr("selected","true");

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
   
	//회원가입 버튼
	function restaurantAddFnc(restaurantNo) {
		var addFormObj = document.getElementById('addForm');
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
			alert('맛집수정이 완료되었습니다. 대박나세요!');
			addFormObj.submit();
// 			alert('sdfdsffsdsdf');
// 		    var url = 'listOne.do?restaurantNo=' + restaurantNo;
// 		    location.href = url;
		}
	}
   
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

   function moveToListOneFnc(restaurantNo) {
      var url = 'listOne.do?restaurantNo=' + restaurantNo;
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
	  <jsp:include page="../headerLeftButtons.jsp"/>
      <jsp:include page="/WEB-INF/views/headerTitle.jsp" />
      <jsp:include page="/WEB-INF/views/headerButtons.jsp" />

      <div class="all">

         <form action="./updateCtr.do" id="addForm" method="post" enctype="multipart/form-data">
			<input type="hidden" name='memberNo' value='${_memberVo_.memberNo}'>
            <div class="imgAndInfo">
               <div class="img">
                  <div id="fileContent">
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
                                 <div style="left: 10px; bottom: 10px; font-size: 1.0em; font-weight: bold;">
                                    ${row.ORIGINAL_FILE_NAME}(${row.FILE_SIZE}kb)
                                    <input type="file" id="file_${obj.index}" name="file_${obj.index}">
                                    <a href="#this" id="delete0" onclick="addFileFnc();">삭제</a>
                                 </div>
                              </c:forEach>
                           </c:otherwise>
                        </c:choose>
                  </div>
               </div>

               <div class="info">
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
                     <li><select class="selectTime" id="operatingTime" name='operatingTime' onchange="orderFnc(this.value)">
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
                     <select class="selectTime" id="closingTime" name='closingTime' onchange="orderFnc(this.value)">
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
					<li><input type="text" class="restaurantTopInput" id='closedDates' name='closedDates'
					 value='${restaurantsVo.closedDates}' placeholder="휴일을 입력하세요">
                  </ul>
                  <ul>
					<li><textarea style="height: 50px; resize: none;" 
					id="address" name="address" placeholder="주소를 입력하세요">${restaurantsVo.address}</textarea>
                  </ul>
               </div>

            </div>
            <div class="restaurantContents">
               <div>맛집소개</div>
               <textarea style="width: 1178px; height: 200px; resize: none;"
                  id="contents" name="contents">${restaurantsVo.contents}</textarea>
            </div>
            
            <div class="menus">
               <div id="menusTitle">메 뉴
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
            </div>

               <div style="clear: left;"></div>

            <div class="button">
               <input type="button" value="수정취소" class="restaurantInput" onclick="moveToListOneFnc(${restaurantsVo.restaurantNo});">
               <input type="button" value="수정완료" class="restaurantInput" onclick="restaurantAddFnc(${restaurantsVo.restaurantNo});">
            </div>
         </form>
		</div>
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
	</div>
</body>
</html>