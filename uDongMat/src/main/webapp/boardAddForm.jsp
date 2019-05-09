``<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
   .restaurantTopInput{
      width: 400px; 
      height: 60px;
      font-size: 25px;
   }

   .restaurantInput{
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
    
   #field  div:nth-child(2n+1) {
      clear: left;
   }

   ul{
      list-style:none;
      padding-left:0px;
   }
   input[type=button]:hover, input[type=submit]:hover, button:hover{
      color: #FFD9EC;
      background-color: #5D5D5D;
   }

</style>
<title>Insert title here</title>
<script type="text/javascript">

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
   
</script>
</head>
<body>
<div style="width: 1920px;">

   <jsp:include page="/WEB-INF/views/headerTitle.jsp" />
   <jsp:include page="/WEB-INF/views/headerButtons.jsp" />
   
   <div style="margin-left: 450px;">
      <form action="./addCtr.do" method="post" enctype="multipart/form-data">
      <div style="width:1050px; height:500px; padding: 20px; border: 1px solid black">
      
         <div style="width:600px; height:480px; border: 1px solid black; float: left;" >
            
         </div>
      
         <div style="width:400px; height:440px; padding: 20px; margin-bottom: 4px; 
             border: 1px solid black; float: left;">
            <ul>
               <li><input type="text" class="restaurantTopInput" name='restaurantName' placeholder="맛집명을 입력하세요">
            </ul>
            <ul>
               <li><input type="text" class="restaurantTopInput" name='category' placeholder="분류를 선택하세요">
            </ul>
            <ul>
               <li><input type="text" class="restaurantTopInput" name='phone' placeholder="연락처를 입력하세요">
            </ul>
            <ul>
               <li><input type="text" class="restaurantTopInput" name='operatingTime' placeholder="운영시간을 입력하세요">
            </ul>
            <ul>
               <li><textarea style="width: 400px; height: 100px; resize: none;" name="address" placeholder="주소를 입력하세요"></textarea>
            </ul>
         </div>
         <ul>
            <li><input type="file" name="file" placeholder="첨부파일을 선택하세요">
         </ul>
      </div>

      <div style="width:1050px;  padding: 20px; border: 1px solid black; margin-top:20px;">
         <div>
            <span style="font-size: 30px; font-weight: bold;">메뉴</span>
            <input type="button" style="width: 45px; height: 40px; margin-left: -5px; margin-bottom: 7px; vertical-align: middle;" value="추가" onclick="add_menu();">
         </div>
         <div id="field"></div>
   
         <h2 style="clear: left;">맛집소개</h2>
         <textarea style="width: 1030px; height: 200px; resize: none;" name="contents" placeholder="맛집소개를 해주세요"></textarea>
   
      </div>    
         <div style="width:1095px; text-align: center; margin-top:20px;">  
            <input type="button" value="등록취소" class="restaurantInput" onclick="moveToListFnc(${restaurantsVo.restaurantNo});">
            <input type="submit" value="등록완료" class="restaurantInput" style="margin-left: 200px;">
         </div>   
      </form>
   </div>
   <jsp:include page="/WEB-INF/views/Tail.jsp"/>
</div>
</body>
</html>