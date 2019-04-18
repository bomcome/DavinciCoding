<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="checkPwdFnc()">
	<label class="block clearfix">
		비밀번호 입력
		<span class="block input-icon input-icon-right">
			<input type="password" id="passwd" name="passwd"/>
		</span>
	</label>
	<label class="block clearfix">
		비밀번호 확인
		<span class="block input-icon input-icon-right">
			<input type="password" id="rptPasswd"/>
		</span>
	</label>
	<button type="submit"></button>
</form>	
</body>
<script type="text/javascript">

	
	
	function checkPwdFnc(){
		
		passwdObj = document.getElementById("passwd");
		rptPasswdObj = document.getElementById("rptPasswd");
		
		passwdVal = passwdObj.value;
		rptPasswdVal = rptPasswdObj.value;
		
		if(passwdVal != rptPasswdVal){
			alert("비밀번호가 다름");
		}
		
	}
</script>
</html>