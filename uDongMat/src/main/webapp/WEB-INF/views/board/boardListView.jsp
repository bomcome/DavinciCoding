<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
 	#boardListContainer tr, td {
 		border-bottom: 1px solid #8C8C8C;
 		height: 35px; 
 	}
 	
	#boardListContainer #no {
		width: 100px;
	}
	#boardListContainer .boardTitle{
		width: 470px;
		
	}
	#boardListContainer #writer{
		width: 170px;
	}
	#boardListContainer #createDate{
		width: 200px;
	}
	
	#boardListContainer #hitsTd{
		width: 90px;
	}
	
	#boardListContainer #resommendCountTd{
		width: 90px;
	}
	
	#boardListContainer td {
		text-align: center;
		font-size: 14px;
		
	}
	#boardListContainer .boardTitle {
		text-align: left;
	}
	#boardListContainer #top td{
		font-weight: bold;
		font-size: 15px;
		
	}
	#boardListContainer #top .boardTitle{
		text-align: center;
	}
	
	#boardListContainer #board {
		margin-left: 380px;
		margin-right: 380px;
		border-collapse: collapse;
 		
	}
	
	#boardListContainer #freeBoard {
		float: left;
		font-weight: bold;
		font-size: 30px;
		color: #8C8C8C;
	}
	
	#boardListContainer #boardInput #formTag{
		text-align: left;
	}
	#boardListContainer input {
		margin-top: 8px;
		width: 250px;
	}
	#boardListContainer {
		width: 1920px;
	}
	
	#boardListContainer #formTag div{
		text-align: right;
	}
	
	#boardListContainer #boardListContainer #before{
		margin-left: 750px;
	}
	
	#center .write{
		
	}
	
	#boardListContainer > button{
		width: 100px;
		height: 40px;
		font-weight: bold;
	}
	
	#pagingForm {
		margin-bottom: 50px;
	}
	#center{
		text-align: center;
	}
</style>

<script type="text/javascript" 
	src="/uDongMat/resources/js/jquery-3.3.1.js"></script> 

<title>Insert title here</title>

</head>
<body>
	<div id=boardListContainer>
	
 	<jsp:include page="../headerTitle.jsp"/> 
	<jsp:include page="../headerButtons.jsp"/>
	
	<table id="board">
		<tr>
			<td id="boardInput" colspan="6">
				<span id="freeBoard">우동맛게시판(${totalCount})</span>
					<form action="./list.do" method="get" id="formTag">	
						<div>
							<input type="text" name="keyword" value="${keyword}">
							<input type="submit" value="검색" style="display: none;">
						</div>
					</form>
			</td>
		</tr>
		<tr id="top">
			<td id="no">번호</td>
			<td class="boardTitle">제목</td>
			<td id="writer">작성자</td>
			<td id="createDate">작성일</td>
			<td id="hitsTd">조회수</td>
			<td id="resommendCountTd">추천수</td>
		</tr>
		
		<c:forEach var="boardVo" items="${boardList}">
			<tr>
				<td>${boardVo.boardNo}</td>
				<td class="title">
					<a href='./one.do?boardNo=${boardVo.boardNo}'>${boardVo.title}</a>
				</td>
				<td>${boardVo.nickname}</td>
				<td>${boardVo.createDate}</td>
				<td>${boardVo.hits}</td>
				<td>${boardVo.recommendCount}</td>
			</tr>
		</c:forEach>
	</table>
	
	
	<jsp:include page="/WEB-INF/views/common/paging.jsp">
		<jsp:param value="${pagingMap}" name="pagingMap"/>
	</jsp:include>
	<div id= "center">
		<form action="./list.do" id="pagingForm" method="post">
			<input type="hidden" id="curPage" name="curPage" 
				value="${pagingMap.boardPaging.curPage}">
			<input type="hidden" id="keyword" name="keyword" 
				value="${keyword}">
		</form>
	
		<c:if test="${_memberVo_ != null}">
			<button class="write" onclick="location.href='add.do'">글쓰기</button>
		</c:if>
		<c:if test="${_memberVo_ == null}">
			<button class="write" type="button" onclick="location.href='../auth/login.do'">글쓰기</button>
		</c:if>
		
	<jsp:include page="../Tail.jsp"/>
		
	</div>	
	</div>
	
</body>
</html>