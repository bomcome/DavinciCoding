<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	
	#boardUpdate #title{
		width: 1105px;
		height: 25px;
		margin-bottom: 15px;
	}
	
	#boardUpdate #inputForm {
		margin-left: 380px;
	}
	
	#boardUpdate #inputForm div {
		font-weight: bold;
		font-size: 18px;
	}
	
	#boardUpdate{
		width: 1920px;
	}
	
	#boardUpdate #buttons {
		width: 1105px;
		text-align: center;
	}
</style>
<script type="text/javascript">

	$(document).ready(function(){
		$("a[id^='delete']").on("click", function(e){ //삭제 버튼 
			e.preventDefault();
			deleteFile($(this));
		});
	});
	
	function moveListFnc() {
		location.href = "list.do";
	}

	
	function registerFnc() {
		var titleObj = document.getElementById('title');
		var titleVal = titleObj.value;
		var contentsObj = document.getElementById('contents');
		var contentsVal = contentsObj.value;
		
		var formObj = document.getElementById('inputForm');
		
		if(titleVal == ''){	
			titleObj.focus();
		}else if(contentsVal == ''){
			contentsObj.focus();
		}else{
			formObj.submit();
		}
	
	}
	
	function deleteFile(obj){
		obj.parent().remove();
	}
	
	function addFileFnc(){
		var obj = $('#fileContent');
		
		var htmlStr = "";
		
		htmlStr += '<div>';
		htmlStr += '<input type="hidden" id="fileIdx" name="fileIdx" value="">';
		htmlStr += '<input type="file" id="file0" name="file0">';		
		htmlStr += '<a href="#this" id="delete0">삭제</a><br>';
		htmlStr += '</div>';
			
		obj.html(htmlStr);
		
		$("a[id^='delete']").on("click", function(e){ //삭제 버튼 
			e.preventDefault();
			deleteFile($(this));
		});
	}
</script>
<title>Insert title here</title>
</head>
<body>
	
	<div id="boardUpdate">
	
	<jsp:include page="../headerTitle.jsp"/> 
	<jsp:include page="../headerButtons.jsp"/>
	
		<form id="inputForm" action="./updateCtr.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name='boardNo' value='${boardVo.boardNo}'>
			<div>제목 </div>
			<input name='title' id='title' type="text" value="${boardVo.title}">
			첨부파일:
			<div id="fileContent">
				<div>
				<c:choose>
					<c:when test="${empty fileList}">
						<input type="hidden" id="fileIdx" name="fileIdx" value="">
						<input type="file" id="file0" name="file0">		
						<a href="#this" id="delete0" onclick="addFileFnc();">삭제</a><br>
					</c:when>
					<c:otherwise>
						<c:forEach var="row" items="${fileList}" varStatus="obj">
						<input type="hidden" id="fileIdx_${obj.index}" name="fileIdx" value="${row.IDX}">
						<img alt="image not found" style="width: 130px; height: 130px;"
							 src="<c:url value='/img/${row.STORED_FILE_NAME}'/>"/><br>
						${row.ORIGINAL_FILE_NAME} <input type="file" id="file_${obj.index}" name="file_${obj.index}">
						(${row.FILE_SIZE}kb) <a href="#this" id="delete_${obj.index}">삭제</a><br>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
			
			<input type="button" value="파일추가" onclick="addFileFnc();">
			<div>내용</div>
			<textarea name='contents' id='contents' rows="30" cols="156" style="resize: none;">${boardVo.contents}</textarea>
			<div id='buttons'>
				<button type="button" onclick='moveListFnc();'>작성취소</button>
				<button type="button" onclick='registerFnc();'>작성완료</button>
			</div>
			
		</form>
	
		
	<jsp:include page="../Tail.jsp"/>
	</div>
	

</body>
</html>