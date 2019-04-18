<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
	
	#header #u {
		color: #DB3A00; 
	}
	#header #dong{
		color: #FFBB00;
	}
	#header #mat{
		color: #4375DB;
	}
	
	#header #title span{
		font-size: 45px;
	}
	#header #title{
		font-size: 21px;
		font-weight: bold;
	}
	#header a {
		text-decoration: none;
		text-align: center;
	}

	
	#header {
		width: 1046px;
		margin-bottom: 30px;
 		padding-right: 0px; 
	} 
	#header #shopAdd{
 		margin-left: 380px; 
		width: 70px; 
	}
	#header #title{
 		margin-left: 390px; 
	}
	
/* 	#header #right{ */
/* 		margin-left: 370px; */
/* 	} */
	
	
	
</style>

<div id="header" class="header">

	
	<button id="shopAdd" onclick="/restaurants/add.do">맛집등록</button>
	
	<span id="title">
		<a href=""><span id="u">우</span>리<span id="dong">동</span>네<span id="mat">맛</span>집</a>
	</span>
	
<!-- 	<span id="right"> -->
<%-- 		<button id="member" onclick="">${memberVo.nickname}</button> --%>
<%-- 		<c:if test="${memberVo == null}"> --%>
<!-- 			<button id="login" onclick="location.href='/auth/login.do'">로그인</button> -->
<%-- 		</c:if> --%>
<%-- 		<c:if test="${memberVo != null}"> --%>
<!-- 			<button id="logout" onclick="location.href='/auth/logout.do'">로그아웃</button> -->
<%-- 		</c:if> --%>
<!-- 	</span> -->

</div>