<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style type="text/css">
	#commentAddContainer #commentAddForm #contents {
		width: 1100px;
		resize: none;
	}
	#commentAddContainer {
		margin-top: 10px;
		margin-left: 380px;
	}
</style>

	<div id="commentAddContainer">
		<form id="commentAddForm" action="../comment/addCtr.do" method="post">
			<input type="hidden" id="boardNo" class="boardNo" name="boardNo" value="${boardVo.boardNo}">
			<input type="hidden" id="memberNo" class="memberNo" name="memberNo" value="${_memberVo_.memberNo}">
			<textarea id="contents" class="contents" name="contents"  rows="2"></textarea>
			<div>
				<c:if test="${_memberVo_ != null}">
					<input type="submit" value="등록">
				</c:if>
				<c:if test="${_memberVo_ == null}">
					<button type="button" onclick="location.href='../auth/login.do'">등록</button>
				</c:if>
			</div>
		</form>
	</div>
 