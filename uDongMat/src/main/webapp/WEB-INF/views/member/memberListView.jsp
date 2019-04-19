<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	table{
		width: auto;
		margin: auto;
		text-align: center;
		border-collapse: collapse;
	}
	
	table, tr, td{
		border: 1px solid black;
	}
	#text{
		padding-left : 730px;
		text-align: left;
		border-collapse: collapse;
	}
</style>
<title>회원 목록</title>

<script type="text/javascript" 
	src="/uDongMat/resources/js/jquery-3.3.1.js"></script>

</head>
<body>


	<jsp:include page="/WEB-INF/views/headerTitle.jsp" />
	<jsp:include page="/WEB-INF/views/headerButtons.jsp" />


<c:if test="${sessionScope._memberVo_.memberGrade == 'admin'}">
	<div id="text">
	<h1>회원목록</h1>
		<a href="add.do">신규 회원</a>
	</div>
	<br />

<!--  var=변수명  items=목록데이터 begin=시작인덱스 end=종료인덱스 -->

	<table>
		<tr>
			<td>번호</td><td>회원이름</td>
			<td>이메일</td><td>가입일</td>
			<td>삭제</td>
		</tr>
	<c:forEach var="memberVo" items="${memberList}">
		<tr>
			<td>${memberVo.memberNo}</td>
			<td>
				<a href='./listOne.do?memberNo=${memberVo.memberNo}'>${memberVo.nickName}</a>
			</td>
			<td>${memberVo.email}</td>
			<td>
				<fmt:formatDate value="${memberVo.createDate}"
					pattern="yyyy년MM월dd일 hh시mm분"/>
			</td>
			<td>
				<a href='./deleteCtr.do?memberNo=${memberVo.memberNo}'>[삭제]</a>
			</td>
		</tr>
	</c:forEach>
	</table>
</c:if>
<c:if test="${sessionScope._memberVo_.memberGrade != 'admin'}">
	해커는꺼져라
</c:if>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />

</body>
</html>