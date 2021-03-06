<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	
	#boardOne #title{
		width: 1105px;
		height: 25px;
		margin-bottom: 15px;
		clear: both;
		font-size: 16px;
	}
	
	#boardOne #contents{
		font-size: 16px;
		width: 1105px;
		resize: none;
	}
	
	#boardOne #inputForm {
		margin-left: 380px;
		width: 1920px;
	}
	
	#boardOne #inputForm div {
		font-weight: bold;
		font-size: 20px;
	}
	
	#boardOne #inputForm div span{
		font-weight: normal;
		font-size: 16px;
	}
	
	#boardOne #buttons {
		width: 1105px;
		text-align: center;
	}
	
	#boardOne{
		width: 1920px;
	}
	
	
	
	#boardOne #titleLeft{
	float: left;
	width: 300px;
	}
	
	#boardOne #inputForm #right{
	float: left;
	width: 805px;
	text-align: right;
	}
	
	#boardOne #inputForm #right span{
	margin-left: 15px;
	}
	
	#boardOne #inputForm #right > span > span{
	font-weight: bold;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="boardOne">
	<jsp:include page="../headerTitle.jsp"/> 
	<jsp:include page="../headerButtons.jsp"/>
	
	
	<form id="inputForm" action="./update.do" method="get">
		<input type="hidden" name='boardNo' value='${boardVo.boardNo}'>
		<div id="titleLeft">제목</div><div id="right"><span><span>작성자:</span> ${boardVo.nickname}</span><span><span>작성일:</span> ${boardVo.createDate}</span></div>
		<input name='title' id='title' type="text" value='${boardVo.title}' readOnly="readonly">
		<div>내용</div>
		<textarea name='contents' id='contents' rows="30" cols="155" readOnly="readonly">${boardVo.contents}</textarea>
		
		
		
		<div id='buttons'>		
			<input type="button" onclick='location.href="list.do"' value="목록보기">
			<c:if test="${_memberVo_.memberNo eq boardVo.memberNo}">
				<input type="submit" onclick="location.href='update.do'" value="수정">
				<input type="button" onclick="location.href='delete.do?boardNo=${boardVo.boardNo}'" value="삭제">
			</c:if>	
	<!-- 		<button type="button" onclick="">답글쓰기</button> -->
		</div>
		
		
	</form>
	
	<jsp:include page="../comments/commentListView.jsp"/>
	<jsp:include page="../comments/commentAddForm.jsp"/>
	
	
	
	
	<jsp:include page="../Tail.jsp"/>
	</div>
</body>
</html>