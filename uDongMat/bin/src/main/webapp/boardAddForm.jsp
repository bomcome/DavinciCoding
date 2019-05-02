<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	
	#title{
		width: 1035px;
		height: 25px;
		margin-bottom: 15px;
	}
	
	#inputForm {
		margin-left: 370px;
	}
	
	#inputForm div {
		font-weight: bold;
		font-size: 18px;
	}
</style>
<script type="text/javascript">

	function moveToListFnc() {
		location.href = "list.do";
	}

</script>cript
<title>Insert title here</title>
</head>
<body>
	
<%-- 	<jsp:include page="../Header.jsp"/> --%>
	
	
	
		<form id="inputForm" action="./create" method="post">
			<div>제목</div>
			<input name='title' id='title' type="text">
			<div>내용</div>
			<textarea name='content' id='content' rows="30" cols="145"></textarea>
			<div>
				<button type="button" onclick='moveToListFnc()'>작성취소</button>
				<button type="submit">작성완료</button>
			</div>
			
		</form>
	
	
	
<%-- 	<jsp:include page="../Tail.jsp"/> --%>
</body>
</html>