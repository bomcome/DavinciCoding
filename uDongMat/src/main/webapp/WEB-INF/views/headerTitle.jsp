<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
	
	#header3 #u {
		color: #DB3A00; 
	}
	#header3 #dong{
		color: #FFBB00;
	}
	#header3 #mat{
		color: #4375DB;
	}
	
	#header3 #titleTag span{
		font-size: 45px;
	}
	#header3 #titleTag{
		font-size: 21px;
		font-weight: bold;
	}
	#header3 a {
		text-decoration: none;
	}

	.header {
		float: left;
	}
	
	#header3 {
  		padding-top: 30px;  
		width: 580px;
		margin-bottom: 40px;
/*  		padding-right: 0px;  */
 		text-align:right;
 		height: 70px;
	} 
/* 	#header3 .shopAdd{ */
/* 		width: 70px; */
/* /* 		margin-left: 352px; */ */
		
/* 	} */
	#header3 #titleTag{
		text-align: center;
/*  		padding-right: 30px;  */
/*  		margin-right: 200px; */
		padding-top: 30px;
 		
	}
	
	#header3 #titleTag >a{
		color: black;
	}
	
/* 	#header3 #goBoard{ */
/* /*  		margin-right: 390px;  */ */
/*  	} */
/* 	#header #right{ */
/* 		margin-left: 370px; */
/* 	} */
	
/* 	#header1 #headerLeftButtons button{ */
/*  		margin-top: 30px;  */
/* 	} */
	
</style>

<div id="header3" class="header">

<!-- 	<span id="headerLeftButtons"> -->
<%-- 	<c:if test='${_memberVo_ != null}'> --%>
<!-- 			<button class="shopAdd" onclick="location.href='../restaurants/add.do'">맛집등록</button> -->
<%-- 	</c:if> --%>
<%-- 	<c:if test='${_memberVo_ == null}'> --%>
<!-- 			<button class="shopAdd" onclick="location.href='../auth/login.do'">맛집등록</button> -->
<%-- 	</c:if> --%>
	
<!-- 	<button id="goBoard" onclick="location.href='../board/list.do'">게시판</button> -->
<!-- 	</span> -->
	
	<div id="titleTag">
		<a href="../restaurants/list.do"><span id="u">우</span>리<span id="dong">동</span>네<span id="mat">맛</span>집</a>
	</div>
	
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