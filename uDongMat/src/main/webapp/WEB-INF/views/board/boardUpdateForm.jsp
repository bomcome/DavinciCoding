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
		margin-left: 380px;
	}
	
	#inputForm div {
		font-weight: bold;
		font-size: 18px;
	}
</style>
<script type="text/javascript">

	function moveListFnc() {
		location.href = "list.do";
	}

</script>
<title>Insert title here</title>
</head>
<body>
	
<%-- 	<jsp:include page="../header.jsp"/> --%>
	
		<form id="inputForm" action="./updateCtr.do" method="post">
			<input type="hidden" name='boardNo' value='${boardVo.boardNo}'>
			<div>제목 </div>
			<input name='title' id='title' type="text" value="${boardVo.title}">
			<div>내용</div>
			<textarea name='contents' id='contents' rows="30" cols="145">${boardVo.contents}</textarea>
			<div>
				<button type="button" onclick='moveListFnc()'>작성취소</button>
				<button type="submit">작성완료</button>
			</div>
			
		</form>
	
	
	
	<jsp:include page="../Tail.jsp"/>
</body>
</html>