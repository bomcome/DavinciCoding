<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
	
	#boardOne #commentListContainer #commentLetter {
		font-size: 19px;
		font-weight: bold;
		border-bottom: 1px solid #8C8C8C;
		width: 1105px;
	}
	
	#commentListContainer table tr td {
		font-size: 15px;
		font-weight: bold;
	}
	#commentListContainer table{
		border-bottom: 1px solid #8C8C8C;
		width: 1105px;
	}
	#commentListContainer table{
		border-bottom: 1px solid #8C8C8C;
		
	}
	#commentListContainer table .commentsContents{
		font-size: 15px;
		font-weight: normal;
	}
	#commentListContainer{
		margin-top: 20px;
		margin-left: 380px;
	}
	#commentListContainer #commentTable{
	
	}
	#commentListContainer table .commentCreDate{
		margin-left: 20px;
	}
	
	
	.commentUpdateContainer .commentUpdateForm #contents {
		width: 1020px;
		resize: none;
	}
	.commentUpdateContainer {
		margin-top: 10px;
		margin-left: 80px;
	}
	
</style>
<script type="text/javascript">
	window.onload = function(){
		var divObj = document.getElementById('commentUpdateContainer');
		
	}	
	
	function commentUpdateFnc() {
		$('.commentUpdateContainer').show();
	}
</script>

		<div id=commentListContainer>
			
			<div id="commentLetter">댓글(${totalCount})</div>
			
			<c:forEach var="commentVo" items="${commentList}">
				<table>
				
					<tr>
						<td class="commentFirstTd">
							<input type="hidden" name="commentNo" value="${commentVo.commentNo}">
							<input type="hidden" name="boardNo" value="${commentVo.boardNo}">
							${commentVo.nickname}
							<span class="commentCreDate">${commentVo.createDate}</span>
							<span class="commentSpan">
							
							<c:if test="${_memberVo_.memberNo eq commentVo.memberNo}">
								<input type="button" value="수정" onclick="commentUpdateFnc();">
								<button type="button" onclick="location.href='../comment/delete.do?commentNo=${commentVo.commentNo}&boardNo=${commentVo.boardNo}'">삭제</button>
							</c:if>
							</span>
						</td>
					</tr>	
					<tr>
						<td class="commentsContents">
							<span>${commentVo.contents}</span>
							<div class="commentUpdateContainer" style="display: none;">
								${commentVo.boardNo}여긴 commentListView
								<form class="commentUpdateForm" action="../comment/updateCtr.do" method="post">
									<input type="hidden" id="commentNo" class="commentNo" name="commentNo" value="${commentVo.commentNo}">
									<input type="hidden" id="boardNo" class="boardNo" name="boardNo" value="${commentVo.boardNo}">
						 			<input type="hidden" id="memberNo" class="memberNo" name="memberNo" value="${_memberVo_.memberNo}">
									<textarea id="contents" class="contents" name="contents"  rows="2">${commentVo.contents}</textarea>
									<div><input type="submit" value="등록"></div>
								</form>
							</div>
<%-- 							<jsp:include page="../comments/commentUpdateForm.jsp"> --%>
<%-- 								<jsp:param value="${commentVo}" name="commentVoTest"/> --%>
<%-- 							</jsp:include> --%>
						</td>
						
					</tr>	
				</table>
			</c:forEach>
			
<%-- 				<jsp:include page="../comments/commentListView.jsp"/> --%>
		</div>
