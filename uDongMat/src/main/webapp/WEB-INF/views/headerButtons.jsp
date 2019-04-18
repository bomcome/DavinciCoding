<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
	
	#header2 {
		width: 800px;
		margin-bottom: 30px;
/*  		padding-right: 350px;  */
		padding-top:35px;
		text-align: right;
	} 
	
	#header2 #right{
		margin-right: 380px;
		
	}
	
	
	
</style>

<div id="header2" class="header">

	<span id="right">
		<c:if test="${_memberVo_ != null}">
			<button id="memberId" 
			onclick="location.href='../member/listOne.do?memberNo=${_memberVo_.memberNo}'">
					${_memberVo_.nickName}
			</button>
		</c:if>
		<c:if test="${_memberVo_ == null}">
			<button id="login" onclick="location.href='../auth/login.do'">로그인</button>
		</c:if>
		<c:if test="${_memberVo_ != null}">
			<button id="logout" onclick="location.href='../auth/logout.do'">로그아웃</button>
		</c:if>
	</span>

</div>

<div style="clear: both;"></div>