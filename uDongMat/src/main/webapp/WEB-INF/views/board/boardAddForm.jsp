<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	
	#boardAdd #title{
		width: 1105px;
		height: 25px;
		margin-bottom: 15px;
	}
	
	#boardAdd #inputForm {
		margin-left: 380px;
	}
	
	#boardAdd #inputForm div {
		font-weight: bold;
		font-size: 18px;
	}
	
	#boardAdd{
		width: 1920px;
	}
	
	#boardAdd #buttons {
		width: 1105px;
		text-align: center;
	}
	#boardAdd #fileLetterSpan {
		font-weight: normal;
		font-size: 15px;
	}
</style>
<script type="text/javascript" 
	src="/springHome/resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript">

	
	function registerFnc() {
		var titleObj = document.getElementById('title');
		var titleVal = titleObj.value;
		var contentsObj = document.getElementById('contents');
		var contentsVal = contentsObj.value;
		
		var formObj = document.getElementById('inputForm');

		if(titleVal == ''){	
			alert("제목을 입력하세요.");
			titleObj.focus();
		}else if(contentsVal == ''){
			alert("내용을 입력하세요.");
			contentsObj.focus();
		}else if(titleVal.length > 20){
			alert("제목은 20글자 이하로 입력하세요.");
		}
		else{
			formObj.submit();
		}
	
	}
</script>
<title>Insert title here</title>
</head>
<body>

	<div id="boardAdd">	
	<jsp:include page="../headerLeftButtons.jsp"/>
	<jsp:include page="../headerTitle.jsp"/> 
	<jsp:include page="../headerButtons.jsp"/>
	
		<form id="inputForm" action="./addCtr.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name='memberNo' value='${_memberVo_.memberNo}'>
			<div>제목</div>
			<input name='title' id='title' type="text">
			<div>내용</div>
			<div><span id="fileLetterSpan">첨부파일)</span> <input type="file" name="file"></div>
			<textarea name='contents' id='contents' rows="30" cols="155" style="resize: none;"></textarea>
			<div id='buttons'>
				<button type="button" onclick="location.href='list.do'">작성취소</button>
				<button type="button" onclick='registerFnc();'>작성완료</button>
			</div>		
		</form>
	
	<jsp:include page="../Tail.jsp"/>
	
	</div>
	
	
</body>
</html>