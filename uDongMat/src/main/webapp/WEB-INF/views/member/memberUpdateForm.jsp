<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style type="text/css">
	#member{
		width:300px;
		text-align: center;
		margin:auto;
		font-weight: bold;
	}
	
	.memberInput{
		width: 160px;
	}
	
</style>
	
<script type="text/javascript" 
	src="/uDongMat/resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	
	function pageMoveDeleteFnc(memberNo){
		var url = 'deleteCtr.do?memberNo=' + memberNo;
		location.href = url;
	}
	
	function pageMoveBeforeFnc(memberNo){
		var url = 'listOne.do?memberNo=' + memberNo;
		location.href = url;
	}
	
	
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	
	<br/>
	
	<div id="member">
		<form action="./updateCtr.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name='no' value='${memberVo.memberNo}'>
			
			<div style="text-align: left; padding-left: 70px;">
			
				이메일<br/>
				<input type="text" name="email" 
					value='${memberVo.email}' readonly="readonly"><br/>
				<br/>	
				
				닉네임 <br/>
				<input type="text" name='nickname' id='nickname' 
					value='${memberVo.nickName}'><br/>
				<br/>	
				
				비밀번호<br/>
				 <input type="password" name="password" id="password"
					value='' required="required"><br/>
				<br/>
					
				비밀번호 확인<br/>
				 <input type="password" name="passwordChk" id="passwordChk"
					value='' required="required"><br/>
				<br/>
				
			</div>
				
			<input type="submit" class="memberInput" value="수정하기"><br/>
			
			<br/>
			
			<input type="button" class="memberInput" value="수정취소" 
				onclick="pageMoveBeforeFnc(${memberVo.memberNo});"><br/>
		</form>
	</div>
	
	<br/>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>

</body>
</html>