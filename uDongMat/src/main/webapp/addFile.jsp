<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var count = 0;

   function add_menu(){
      // pre_set 에 있는 내용을 읽어와서 처리..
	if(count < 30){
	
      var htmlStr;
      htmlStr = '<input type="text" name="menuName" style="width: 300px;" placeholder="메뉴 이름을 입력하세요">';
      htmlStr = htmlStr + '<input type="text" name="price" style="width: 150px;" placeholder="메뉴 가격을 입력하세요">';
      htmlStr = htmlStr + '<input type="button"style="width: 50px;" value="삭제" onclick="remove_menu(this);" />';


      
      var div = document.createElement('div');
      div.setAttribute('style', 'margin:10px; width:498px;');
      div.innerHTML = div.innerHTML + htmlStr;
      document.getElementById('field').appendChild(div);
      count++;
	}
   }
   
   function remove_menu(obj){
      // obj.parentNode 를 이용하여 삭제
      document.getElementById('field').removeChild(obj.parentNode);
      count--;
   }
   
   function moveToListFnc(restaurantNo) {
      var url = 'list.do?restaurantNo=' + restaurantNo;
      location.href = url;
   }
</script>
<style type="text/css">
	.restaurantInput{
		width: 300px; 
		height: 40px;
	}
	#field div {
	   float: left;
	}
	#field input {
		height: 40px;
		font-size:0.8em;
		outline:none;
		display:inline;
	}
	
	#field input[type="text"]{
      box-sizing: border-box;
      color:black;

	}
	#field  input[type=button]{
	  padding-bottom: 3px;
      margin-left: -2px;
    }
    
	#field div:nth-child(2n+1) {
	   clear: left;
	}
</style>
</head>
<body>
<div style="margin-left: 450px;">
   <form action="./addCtr.do" method="post">
   	  <div style="width:1050px; height:430px; padding: 20px; border: 1px solid black">
	   	  <div style="width:650px; height:360px; padding: 20px; border: 1px solid black; float: left; margin-right: 15px;" >
	   		이미지 파일
	   	  </div>
	      <div style="width:300px; height:360px; padding: 20px;  border: 1px solid black; float: left;" >
	         <input type="text" class=restaurantInput name='restaurantName' placeholder="가게이름"><br/>
	         <br/>	
			 <select name='category' style="font-size: 15px; width: 304px; height: 46px;">
			   <option value="한식">한식</option>
			   <option value="중식">중식</option>
			   <option value="일식">일식</option>
			   <option value="양식">양식</option>
			   <option value="분식">분식</option>
			 </select>
	         <br/>
	         <br/>
	         <input type="text" class=restaurantInput name='phone' placeholder="전화번호"><br/>
	         <br/>
	         <input type="text" class=restaurantInput name='operatingTime' placeholder="운영시간"><br/>
	         <br/>
	         <textarea style="width: 300px; height: 80px; resize: none;" name="address" placeholder="주소"></textarea>
	      </div>
	     
	      <div>
	      	이미지파일 첨부
	      </div>
	  </div>
	  <br style="clear: left;"/>
      <div style="width:1050px;  padding: 20px; border: 1px solid black;">
      	<div>
         <span style="font-size: 30px; font-weight: bold;">메뉴</span>
         <input type="button" style="width: 45px; height: 40px; margin-left: -5px; margin-bottom: 7px; vertical-align: middle;" value="추가" onclick="add_menu();">
        </div> 
        <div id="field">
        
        </div>

        <h2 style="clear: left;">맛집소개</h2>
        <textarea style="width: 1030px; height: 150px; resize: none;" name="contents" placeholder="맛집소개를 해주세요"></textarea>
      </div>
		<br/>	  
	  <div style="width:1050px; text-align: center;">     
	    <input type="button" value="등록취소" class=restaurantInput onclick="moveToListFnc(${restaurantsVo.restaurantNo});">
	    <input type="submit" value="등록완료" class=restaurantInput style="margin-left: 200px;">
	  </div>
   </form>
</div>
</body>
</html>