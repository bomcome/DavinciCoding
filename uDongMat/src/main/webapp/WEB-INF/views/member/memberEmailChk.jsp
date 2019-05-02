<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function(){

		var overlapEmailObj = document.getElementById("overlapEmail");
		var memberAddObj = document.getElementById("memberAdd");
		
		if(overlapEmailObj.value == 1){
			alert("증복된 이메일 입니다.");
			
			memberAddObj.submit();
		}
		else if(overlapEmailObj.value == 0){
			alert("사용 가능한 이메일 입니다.");
			
			memberAddObj.submit();
		}
	}
</script>
</head>
<body>
<form action="../member/add.do" method="get" id="memberAdd">
	<input type="hidden" name="email" id="email" value='${memberVo.email}'>
	<input type="hidden" name="nickName" id="nickName" value='${memberVo.nickName}'>
	
	<input type="hidden" name="overlapEmail" id="overlapEmail" value='${overlapEmail}'>
</form>
</body>
</html>