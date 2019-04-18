<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	
	#title{
		width: 1105px;
		height: 25px;
		margin-bottom: 15px;
	}
	
	#inputForm {
		margin-left: 380px;
		width: 1920px;
	}
	
	#inputForm div {
		font-weight: bold;
		font-size: 20px;
	}
	
	#inputForm div span{
		font-weight: normal;
		font-size: 16px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	
	<jsp:include page="../headerTitle.jsp"/> 
	<jsp:include page="../headerButtons.jsp"/>
	
	
		<form id="inputForm" action="./update.do" method="get">
			<input type="hidden" name='boardNo' value='${boardVo.boardNo}'>
			<div>제목 <span>작성자: ${boardVo.nickname}</span><span>작성일: ${boardVo.createDate}</span></div>
			<input name='title' id='title' type="text" value='${boardVo.title}' readOnly="readonly">
			<div>내용</div>
			<textarea name='contents' id='contents' rows="30" cols="155" readOnly="readonly">${boardVo.contents}</textarea>
			<div>
				<input type="button" onclick='location.href="list.do"' value="목록">
				<c:if test="${_memberVo_.memberNo eq boardVo.memberNo}">
					<input type="submit" onclick="location.href='update.do'" value="수정">
					<input type="button" onclick="location.href='delete.do?boardNo=${boardVo.boardNo}'" value="삭제">
				</c:if>
				
				
<!-- 				<button type="button" onclick="">답글쓰기</button> -->
			</div>
			
		</form>
	
	
	
	<jsp:include page="../Tail.jsp"/>
</body>
</html>