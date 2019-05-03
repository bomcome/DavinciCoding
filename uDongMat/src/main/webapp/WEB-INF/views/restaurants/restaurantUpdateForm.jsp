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
<script type="text/javascript" 
	src="/springHome/resources/js/jquery-3.3.1.js"></script>
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
	    htmlStr = '<input type="text" name="menuName" style="width: 200px;" placeholder="메뉴 이름을 입력하세요">&nbsp;';
	    htmlStr = htmlStr + '<input type="text" name="price" style="width: 150px;" placeholder="메뉴 가격을 입력하세요">&nbsp;';
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

   <div>이미지 파일</div>
   <form action="./updateCtr.do" method="post" enctype="multipart/form-data">
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
							(${row.FILE_SIZE}kb) <a href="#this" id="delete_${obj.index}">삭제</a><br>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div>
		 <input type="hidden" name='restaurantNo' value='${restaurantsVo.restaurantNo}'>
         <input type="text" name='restaurantName' id='restaurantName' value='${restaurantsVo.restaurantName}'>
         <input type="text" name='category' id='category' value='${restaurantsVo.category}'>
         <input type="text" name='phone' id='phone' value='${restaurantsVo.phone}'>
         <input type="text" name='operatingTime' id='operatingTime' value='${restaurantsVo.operatingTime}'>
         <input type="text" name='address' id='address' value='${restaurantsVo.address}'>
      </div>

      <div>
         <h2>메 뉴</h2>
         <input type="button" value="추가 " onclick="add_menu();">

         <div id="field">
			<c:forEach var="menusVo" items="${menusList}">
				<div>
				<input type="text" name='menuName' value='${menusVo.menuName}' style="width: 200px;" placeholder="메뉴 이름을 입력하세요">
				<input type="text" name='price' value='${menusVo.price}' style="width: 150px;" placeholder="메뉴 가격을 입력하세요">
				<input type="button" value="삭제" onclick="remove_menu(this);">&nbsp;
				</div>
			</c:forEach>
		</div>

         <h2 style="clear: left;">맛집소개</h2>
         <input type="text" name='contents' value='${restaurantsVo.contents}'>
      </div>
      
      <input type="button" value="수정취소" onclick="moveToListFnc(${restaurantsVo.restaurantNo});">
      <input type="submit" value="수정완료">
   </form>
   
   <jsp:include page="/WEB-INF/views/Tail.jsp"/>

</body>
</html>