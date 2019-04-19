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
		width: 150px;
	}
	#boardListContainer .title{
		width: 520px;
		
	}
	#boardListContainer #writer{
		width: 230px;
	}
	#boardListContainer #createDate{
		width: 200px;
	}
	#boardListContainer td {
		text-align: center;
		font-size: 14px;
		
	}
	#boardListContainer .title {
		text-align: left;
	}
	#boardListContainer #top td{
		font-weight: bold;
		font-size: 15px;
		
	}
	#boardListContainer #top .title{
		text-align: center;
	}
	
	#boardListContainer #board {
		margin-left: 380px;
		margin-right: 380px;
		border-collapse: collapse;
 		margin-top: 50px;
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
	}
	#boardListContainer {
		width: 1920px;
	}
	
	#boardListContainer #formTag span{
		text-align: right;
	}
	
	#boardListContainer #boardListContainer #before{
		margin-left: 750px;
	}
	
	#center #write{
		margin-left: 300px;
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

 	<jsp:include page="../headerTitle.jsp"/> 
	<jsp:include page="../headerButtons.jsp"/>
	<div id=boardListContainer>
	<table id="board">
		<tr>
			<td id="boardInput" colspan="4">
				<span id="freeBoard">우동맛게시판(${totalCount})</span>
					<form action="./list.do" method="get" id="formTag">	
						<span>
							<input type="text" name="keyword" value="${keyword}">
							<input type="submit" value="검색">
						</span>
					</form>
			</td>
		</tr>
		<tr id="top">
			<td id="no">번호</td>
			<td class="title">제목</td>
			<td id="writer">작성자</td>
			<td id="createDate">작성일</td>
		</tr>
		
		<c:forEach var="boardVo" items="${boardList}">
			<tr>
				<td>${boardVo.boardNo}</td>
				<td class="title">
					<a href='./one.do?boardNo=${boardVo.boardNo}'>${boardVo.title}</a>
				</td>
				<td>${boardVo.nickname}</td>
				<td>${boardVo.createDate}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	
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
	
		<button id="before" onclick="href.location=''">메인화면으로</button>
		<c:if test="${_memberVo_ != null}">
			<button id="write" onclick="location.href='add.do'">글쓰기</button>
		</c:if>
		
	</div>	
	
	
	
	
	<jsp:include page="../Tail.jsp"/>
</body>
</html>