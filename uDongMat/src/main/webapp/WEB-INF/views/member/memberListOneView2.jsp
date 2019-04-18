<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 조회</title>

<script type="text/javascript" 
	src="/uDongMat/resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	window.onload = function(){
		var membernickNameInputObj = 
			document.getElementById('nickName');
		
		membernickNameInputObj.style.backgroundColor = '#E7E7E7';
	}
	
	function pageMoveListFnc(){
		location.href = "list.do";
	}
		
</script>

</head>
<body>

	<jsp:include page="/WEB-INF/views/headerTitle.jsp" />
	<jsp:include page="/WEB-INF/views/headerButtons.jsp" />

	
	<h1>회원정보</h1>

	<form action="./update.do" method="get">
		<input type="hidden" name='memberNo' value='${memberVo.memberNo}'>
		닉네임: <input type="text" name='nickName' id='nickName' value='${memberVo.nickName}' 
				readonly="readonly"><br>
		이메일: <input type="text" name="email" 
			value='${memberVo.email}' readonly="readonly"><br>
		
		가입일: <fmt:formatDate value="${memberVo.createDate}" 
				pattern="yyyy-MM-dd"/><br>
		<input type="submit" value="수정하기">
		<input type="button" value="이전페이지" 
				onclick="pageMoveListFnc();">
	</form>

	<%-- <form action="../common/fileDownload.do" method="post">
		<input type="hidden" id='filePno' name='filePno' value='${fileList[0].PNO}'>
	</form> --%>

	<jsp:include page="/WEB-INF/views/Tail.jsp"/>

</body>
</html>