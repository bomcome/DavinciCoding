<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	
	#boardUpdate #contents{
		width: 1109px;
	}
	
	#boardUpdate #buttons {
		width: 1105px;
		text-align: center;
	}
	
	#boardUpdate #fileLetterSpan {
		font-weight: normal;
		font-size: 15px;
	}
	
	#boardUpdate #fileContent div{
		font-weight: normal;
		font-size: 15px;
	}
</style>
<script type="text/javascript" 
	src="/uDongMat/resources/js/jquery-3.3.1.js"></script>
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
		var contentsObj = document.getElementById('ta');
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
	<jsp:include page="../headerLeftButtons.jsp"/>
	<jsp:include page="../headerTitle.jsp"/> 
	<jsp:include page="../headerButtons.jsp"/>
	
		<form id="inputForm" action="./updateCtr.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name='boardNo' value='${boardVo.boardNo}'>
			<div>제목 </div>
			<input name='title' id='title' type="text" value="${boardVo.title}">
			
			<div>내용</div>
			<div id="fileContent">
				<span id="fileLetterSpan">첨부파일)</span>
				<div>
				<c:choose>
					<c:when test="${empty fileList}">
						<input type="hidden" id="fileIdx" name="fileIdx" value="">
						<input type="file" id="file0" name="file0">		
<!-- 						<a href="#this" id="delete0" onclick="addFileFnc();">삭제</a><br> -->
					</c:when>
					<c:otherwise>
						<c:forEach var="row" items="${fileList}" varStatus="obj">
						<input type="hidden" id="fileIdx_${obj.index}" name="fileIdx" value="${row.IDX}">
						<img alt="image not found" style="width: 130px; height: auto;"
							 src="<c:url value='/img/${row.STORED_FILE_NAME}'/>"/><br>
						${row.ORIGINAL_FILE_NAME} (${row.FILE_SIZE}) 
						<a href="#this" id="delete_${obj.index}">삭제</a>
<%-- 						<button onclick="deleteFile(${obj.index})">파일삭제</button> --%>

						</c:forEach>
					</c:otherwise>
				</c:choose>

				</div>
				<div><input type="file" id="file_${obj.index}" name="file_${obj.index}"></div>
			</div>
			
			
			<textarea id="ta" name='contents' style="width:1109px;height:32px;overflow-y:hidden">${boardVo.contents}</textarea>
		<textarea id="xt" style="width:1109px;height:1px;overflow-y:hidden;position:absolute;top:-9px" disabled></textarea>
			
<%-- 			<textarea name='contents' id='contents' rows="30" cols="156" style="resize: none;">${boardVo.contents}</textarea> --%>
			<div id='buttons'>
				<button type="button" onclick='moveListFnc();'>뒤로가기</button>
				<button type="button" onclick='registerFnc();'>수정완료</button>
			</div>
			
		</form>
	
		
	<jsp:include page="../Tail.jsp"/>
	</div>
	

</body>
<script>
    function xSize(e)
    {
        var xe = document.getElementById('xt'),
            t;
        e.onfocus = function()
        {
            t = setInterval(
                function()
                {
                    xe.value = e.value;
                    e.style.height = (xe.scrollHeight + 12) + 'px';
                }, 100);
        }
        e.onblur = function()
        {
            clearInterval(t);
        }
    }
    xSize(document.getElementById('ta'));
</script>
</html>