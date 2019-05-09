<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

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
    
	#field div:nth-child(2n+1) {
	   clear: left;
	}

	ul{
	   list-style:none;
	   padding-left:0px;
   }

</style>
<title>Insert title here</title>
<script type="text/javascript">

	function moveToListFnc(restaurantNo) {
		var url = 'list.do?restaurantNo=' + restaurantNo;
		location.href = url;
	}
	
	function moveToUpdateFnc(restaurantNo) {
		var url = 'update.do?restaurantNo=' + restaurantNo;
		location.href = url;
	}
	
	function moveTodeleteCtrFnc(restaurantNo) {
		var url = 'deleteCtr.do?restaurantNo=' + restaurantNo;
		location.href = url;
	}
	
</script>
</head>
<body>
<div style="width: 1920px;">

	<jsp:include page="/WEB-INF/views/headerTitle.jsp" />
	<jsp:include page="/WEB-INF/views/headerButtons.jsp" />
		
	<div style="margin-left: 450px;">
		<form action="./update.do" method="get">
		<div style="width:1050px; height:430px; padding: 20px; border: 1px solid black">
			<div style="width:650px; height:360px; padding: 20px; border: 1px solid black; float: left; margin-right: 15px;" >
				<div id="fileContent">
					<div>
						<c:forEach var="row" items="${fileList}" varStatus="obj">
							<ul>
								<li><input type="hidden" id="fileIdx_${obj.index}" name="fileIdx" value="${row.IDX}">
								<li><img alt="image not found" style="width: 130px; height: 130px;"
									 src="<c:url value='/img/${row.STORED_FILE_NAME}'/>"/>
							</ul>
						</c:forEach>
					</div>
				</div>
			</div>
			
			<div>
				<div style="width:300px; height:360px; padding: 20px;  border: 1px solid black; float: left;">
					<ul>
						<li><input type="hidden" name='restaurantNo' value='${restaurantsVo.restaurantNo}'>
						<li><input type="text" name='restaurantName' class="restaurantInput" value='${restaurantsVo.restaurantName}' readonly="readonly">
					</ul>
					<ul>
						<li><input type="text" name='category' class="restaurantInput" value='${restaurantsVo.category}' readonly="readonly">
					</ul>
					<ul>
						<li><input type="text" name='phone' class="restaurantInput" value='${restaurantsVo.phone}' readonly="readonly">
					</ul>
					<ul>
						<li><input type="text" name='operatingTime' class="restaurantInput"  value='${restaurantsVo.operatingTime}' readonly="readonly">
					</ul>
					<ul>
						<li><textarea style="width: 300px; height: 80px; resize: none;" 
							readonly="readonly" name="address">${restaurantsVo.address}</textarea>
					</ul>
				</div>
			</div>
		</div>
		
		 <div style="width:1050px;  padding: 20px; border: 1px solid black; margin-top:20px;">
			<span style="font-size: 30px; font-weight: bold;">메뉴</span>
			
			<div id="field">
				<c:forEach var="menusVo" items="${menusList}">
					<input type="text" name='"menuName"' style="width: 300px;" value='${menusVo.menuName}' readonly="readonly">
					<input type="text" name='price' style="width: 150px;" value='${menusVo.price}' readonly="readonly">
				</c:forEach>
			</div>	
				
			<h2 style="clear: left;">맛집소개</h2>
			<textarea style="width: 1030px; height: 150px; resize: none;" 
				name="contents" readonly="readonly">${restaurantsVo.contents}</textarea>
		</div>
			<div style="width:1095px; text-align: center; margin-top:20px;"> 
				<input type="button" value="이전화면" class="restaurantInput" onclick="moveToListFnc(${restaurantsVo.restaurantNo});">
				<input type="button" value="수정" style="margin-left: 91px; margin-right: 91px;" class="restaurantInput" onclick="moveToUpdateFnc(${restaurantsVo.restaurantNo});">
				<input type="button" value="삭제" class="restaurantInput" onclick="moveTodeleteCtrFnc(${restaurantsVo.restaurantNo});">
			</div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
</div>
</body>
</html>