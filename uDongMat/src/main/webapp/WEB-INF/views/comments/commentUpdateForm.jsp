<%@page import="com.dc.comments.vo.CommentVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style type="text/css">
	#commentUpdateContainer #commentUpdateForm #contents {
		width: 1020px;
		resize: none;
	}
	#commentUpdateContainer {
		margin-top: 10px;
		margin-left: 80px;
	}
</style>

	<div id="commentUpdateContainer" style="display: none;">
	${commentVoTest}   
		<form id="commentUpdateForm" action="../comment/updateCtr.do" method="post">
			<input type="hidden" id="commentNo" class="commentNo" name="commentNo" value="${commentVoTest.commentNo}">
			<input type="hidden" id="boardNo" class="boardNo" name="boardNo" value="${commentVoTest.boardNo}">
 			<input type="hidden" id="memberNo" class="memberNo" name="memberNo" value="${_memberVo_.memberNo}">
			<textarea id="contents" class="contents" name="contents"  rows="2">${commentVoTest.contents}</textarea>
			<div><input type="submit" value="등록"></div>
		</form>
	</div>
