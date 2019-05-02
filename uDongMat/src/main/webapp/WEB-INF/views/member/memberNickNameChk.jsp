<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function(){

		var overlapNickNameObj = document.getElementById("overlapNickName");
		var memberAddObj = document.getElementById("memberAdd");
		
		if(overlapNickNameObj.value == 1){
			alert("증복된 별명 입니다.");
			
			memberAddObj.submit();
		}
		else if(overlapNickNameObj.value == 0){
			alert("사용 가능한 별명 입니다.");
			
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
	<input type="hidden" name="overlapNickName" id="overlapNickName" value='${overlapNickName}'>
</form>
</body>
</html>