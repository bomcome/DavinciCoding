<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript">
	function pageMemberInsertFnc(){
// 		alert(${memberVo.memberNo});
		
		location.href = "../member/add.do";
	}
</script>
<style type="text/css">
	#loginForm{
		width:300px;
		text-align: center;
		margin:auto;
		font-weight: bold;
	}
</style>
</head>
<body>


	<jsp:include page="/WEB-INF/views/headerTitle.jsp" />
	<jsp:include page="/WEB-INF/views/headerButtons.jsp" />
	<jsp:include page="/WEB-INF/views/memberCss.jsp" />

	
	<br/>

	<div id="loginForm">
		<form style="margin: auto;" action="loginCtr.do" method="post">
			
			<div style="text-align: left; padding-left: 70px;">
			
				<input type="text" name="email" placeholder="이메일"><br/>
				<br/>	
	
				<input type="password" name='password' id='password' placeholder="비밀번호"><br/>
				<br/>
					
				<input type="submit" class="memberInput" style="margin-left: 0px;" value="로그인"><br/>
				<br/>
				
				<input type="button" class="memberInput" style="margin-left: 0px;" value="이전화면"  onclick="pageMoveListFnc();"><br/>
				<br/>
				
			</div>
			
			<hr>
			
			<br/>
			
			<input type="button" class="memberInput" value="회원가입"  onclick="pageMemberInsertFnc();">
		</form>
	</div>
	<br/>
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>

</body>
</html>