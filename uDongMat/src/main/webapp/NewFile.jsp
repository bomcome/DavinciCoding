<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#field div {
   float: left;
}

#field div:nth-child(2n+1) {
   clear: left;
}
</style>
<title>Insert title here</title>
<script type="text/javascript">
var count = 1;
function newDiv(){
	var newDiv = '<div class="newDivTag">';
	newDiv = newDiv + '<span>'+ count +'<span>';
	newDiv = newDiv + '</div><br />';
	
	var newbody = document.getElementsByTagName('body')[0];
	
	newbody.innerHTML = newbody.innerHTML + newDiv;
	document.
	count++
}   

	

   function add_menu(){
      // pre_set 에 있는 내용을 읽어와서 처리..
    	  
		var htmlStr;
		htmlStr = '<input type="text" name="menuName" value="" style="width: 200px;" placeholder="메뉴 이름을 입력하세요">';
		htmlStr = htmlStr + '<input type="text" name="price" value="" style="width: 150px;" placeholder="메뉴 가격을 입력하세요">';
		htmlStr = htmlStr + '<input type="button" value="삭제" onclick="remove_menu(this);" />';

		

		var div = document.createElement('div');
	    div.innerHTML = div.innerHTML + htmlStr;
	    document.getElementById('field').appendChild(div);
	    
// 	    var fieldVal = document.getElementById('field');
// 		fieldVal.innerHTML = fieldVal.innerHTML + htmlStr;
// 		document.getElementById('field').appendChild(htmlStr);
   }
   
   function remove_menu(obj){
      // obj.parentNode 를 이용하여 삭제
      document.getElementById('field').removeChild(obj.parentNode);

   }
   
   function moveToListFnc(restaurantNo) {
      var url = 'list.do?restaurantNo=' + restaurantNo;
      location.href = url;
   }
   
</script>
</head>
<body>

   <div>이미지 파일</div>
   <form action="./addCtr.do" method="post">
      <div>
         <span><input type="text" name='restaurantName'></span>
         <span><input type="text" name='category'></span>
         <span><input type="text" name='phone'></span>
         <span><input type="text" name='operatingTime'></span>
         <span><input type="text" name='address'></span>
         <span><input type="button" value="등록취소" onclick="moveToListFnc(${restaurantsVo.restaurantNo});"></span>
         <span><input type="submit" value="등록완료"></span>

      </div>

      <div>
         <h2>메 뉴</h2>
         <input type="button" value="추가 " onclick="add_menu();">
         <div id="field">
    
         </div>
         <h2 style="clear: left;">맛집소개</h2>
         <span><input type="text" name='contents'></span>
      </div>
   </form>

</body>
</html>