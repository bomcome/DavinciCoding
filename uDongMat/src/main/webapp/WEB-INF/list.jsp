<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
 	tr, td {
 		border-bottom: 1px solid #8C8C8C;
 		height: 35px; 
 	}
 	
	#no {
		width: 150px;
	}
	.title{
		width: 500px;
		
	}
	#writer{
		width: 230px;
	}
	#createDate{
		width: 200px;
	}
	td {
		text-align: center;
		font-size: 14px;
		
	}
	.title {
		text-align: left;
	}
	#top td{
		font-weight: bold;
		font-size: 15px;
		
	}
	#top .title{
		text-align: center;
	}
	
	#board {
		margin-left: 340px;
		border-collapse: collapse;
 		margin-top: 50px;
	}
	
	#freeBoard {
		float: left;
		font-weight: bold;
		font-size: 30px;
		color: #8C8C8C;
	}
	
	#boardInput #formTag{
		text-align: left;
	}
	input {
		margin-top: 8px;
	}
	#boardListContainer {
		width: 1900px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<%-- 	<jsp:include page="../header.jsp"/> --%>
<div id=boardListContainer>
<table id="board">
	<tr>
		<td id="boardInput" colspan="4">
			<span id="freeBoard">우동맛게시판&nbsp;&nbsp;&nbsp;</span>
				<form action="./list.do" method="get" id="formTag">	
					<input type="text" name="keyword" value="${keyword}">
					<input type="submit" value="검색">
				</form>
		</td>
	</tr>
	<tr id="top">
		<td id="no">번호</td>
		<td class="title">제목</td>
		<td id="writer">작성자</td>
		<td id="createDate">작성일</td>
	</tr>
	<tr>
		<td>1</td>
		<td class="title">웃긴일ㅋㅋㅋㅋㅋㅋㅋㅋㅋ</td>
		<td>짱구dddddddddd</td>
		<td>2019/04/11</td>
	</tr>
	<c:forEach var="boardVo" items="${boardList}">
		<tr>
			<td>${boardVo.no}</td>
			<td class="title">${boardVo.title}</td>
			<td>${boardVo.writer}</td>
			<td>${boardVo.createDate}</td>
		</tr>
	</c:forEach>
</table>
</div>

<%-- <jsp:include page="../tail.jsp"/> --%>
</body>
</html>