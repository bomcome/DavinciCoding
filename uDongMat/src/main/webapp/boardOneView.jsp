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
<title>Insert title here</title>
</head>
<body>
	
<%-- 	<jsp:include page="../Header.jsp"/> --%>
	
	
	
		
			<div>제목</div>
			<input name='title' id='title' type="text" readOnly>
			<div>내용</div>
			<textarea name='content' id='content' rows="30" cols="145" readOnly></textarea>
			<div>
				<button type="button" onclick=''>이전화면</button>
				<button type="button" onclick=''>수정</button>
				<button type="button" onclick=''>수정</button>
				<button type="button" onclick=''>삭제</button>
				<button type="button" onclick=''>답글쓰기</button>
			</div>
		
	
	
	
<%-- 	<jsp:include page="../Tail.jsp"/> --%>
</body>
</html>