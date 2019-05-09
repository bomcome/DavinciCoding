<%@ page language="java" contentType="text/html; charset=UTF-8"
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
      margin-left: -7px;

	}
	#field  input[type=button]{
	  padding-bottom: 3px;
      margin-left: -7px;
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

	$(document).ready(function(){
		$("a[id^='delete']").on("click", function(e){ //삭제 버튼 
			e.preventDefault();
			deleteFile($(this));
		});
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
		
		$("a[id^='delete']").on("click", function(e){ //삭제 버튼 
			e.preventDefault();
			deleteFile($(this));
		});
	}
   
</script>
</head>
<body>
<div style="width: 1920px;">
   
	<jsp:include page="/WEB-INF/views/headerTitle.jsp" />
	<jsp:include page="/WEB-INF/views/headerButtons.jsp" />	
	
	<div style="margin-left: 450px;">
   
	<form action="./updateCtr.do" method="post" enctype="multipart/form-data">
	
   	<div style="width:1050px; height:500px; padding: 20px; border: 1px solid black">
	   		<div style="width:600px; height:480px; border: 1px solid black; float: left;" >
	
			</div>
			
			<div style="width:400px; height:440px; padding: 20px; margin-bottom: 4px; 
					 border: 1px solid black; float: left;">
				<ul>
					<li><input type="hidden" name='restaurantNo' value='${restaurantsVo.restaurantNo}'>
					<li><input type="text" name='restaurantName' class="restaurantTopInput" placeholder="맛집명을 입력하세요"
						 id='restaurantName' value='${restaurantsVo.restaurantName}'>
				</ul>
				<ul>
					<li><input type="text" name='category' class="restaurantTopInput" placeholder="분류를 선택하세요"
						 id='category' value='${restaurantsVo.category}'>
				</ul>
				<ul>
					<li><input type="text" name='phone' class="restaurantTopInput" placeholder="연락처를 입력하세요"
						id='phone' value='${restaurantsVo.phone}'>
				</ul>
				<ul>
					<li><input type="text" name='operatingTime' class="restaurantTopInput" placeholder="운영시간을 입력하세요" 
						 id='operatingTime' value='${restaurantsVo.operatingTime}'>
				</ul>
				<ul>
					<li><textarea style="width: 400px; height: 100px; resize: none;" name="address" 
						placeholder="주소를 입력하세요">${restaurantsVo.address}</textarea>
				</ul>
			</div>
			
			<div id="fileContent">
				<div>
				<c:choose>
					<c:when test="${empty fileList}">
						<input type="hidden" id="fileIdx" name="fileIdx" value="">
						<input type="file" id="file0" name="file0">
						<a href="#this" id="delete0" onclick="addFileFnc();">삭제</a><br>
					</c:when>
					<c:otherwise>
						<c:forEach var="row" items="${fileList}" varStatus="obj">
							<input type="hidden" id="fileIdx_${obj.index}" name="fileIdx"
								value="${row.IDX}">
							<img alt="image not found" style="width: 130px; height: 130px;"
								src="<c:url value='/img/${row.STORED_FILE_NAME}'/>" />
							<br>
							${row.ORIGINAL_FILE_NAME} <input type="file" id="file_${obj.index}" name="file_${obj.index}">
							(${row.FILE_SIZE}kb) <br>
						</c:forEach>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
		
	</div>
	<div style="width:1050px;  padding: 20px; border: 1px solid black; margin-top:20px;">
		<div>
			<span style="font-size: 30px; font-weight: bold;">메뉴</span>
			<input type="button" style="width: 45px; height: 40px; margin-left: -5px; margin-bottom: 7px; vertical-align: middle;" value="추가" onclick="add_menu();">
		</div>
		<div id="field">
			<c:forEach var="menusVo" items="${menusList}">
				<div>
					<input type="text" name='menuName' value='${menusVo.menuName}' style="width: 280px;" placeholder="메뉴 이름을 입력하세요">
					<input type="text" name='price' value='${menusVo.price}' style="width: 160px;" placeholder="메뉴 가격을 입력하세요">
					<input type="button" value="삭제" onclick="remove_menu(this);">&nbsp;
				</div>
			</c:forEach>
		</div>
	
	<h2 style="clear: left;">맛집소개</h2>
	<textarea style="width: 1030px; height: 200px; resize: none;" name="contents">${restaurantsVo.contents}</textarea>
	
	</div>      
		<div style="width:1095px; text-align: center; margin-top:20px;">
	      <input type="button" value="수정취소" class="restaurantInput"
	       onclick="moveToListFnc(${restaurantsVo.restaurantNo});">
	      <input type="submit" value="수정완료" class="restaurantInput">
		</div>
	</form>
   
	</div>
</div>
</body>
</html>