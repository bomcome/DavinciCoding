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
	
	
	.commentUpdateContainer .commentUpdateForm #commentContentsUpdate {
		width: 1020px;
		resize: none;
	}
	.commentUpdateContainer {
		margin-left: 80px;
	}
	.commentContentsTextarea{
		width:300px;overflow:visible;
	}
	
</style>
<script type="text/javascript">
	window.onload = function(){
		var divObj = document.getElementById('commentUpdateContainer');
		
	}	
	
	function commentUpdateFnc(rowNum) {
		var rowNum = rowNum - 1;
		
		var commentDivObj = document.getElementsByClassName("commentUpdateContainer")[rowNum];
		commentDivObj.style.display = 'inline';
		
		var commentSpanObj = document.getElementsByClassName("commentContentsSpan")[rowNum];
		commentSpanObj.style.display = 'none';
// 		$('.commentUpdateContainer').show();
		
		var commentButtonObj = document.getElementsByClassName("updateButton")[rowNum];
		commentButtonObj.style.display = 'none';
	}
	
	function commentCancelFnc(rowNum) {
		var rowNum = rowNum - 1;
		
		var commentDivObj = document.getElementsByClassName("commentUpdateContainer")[rowNum];
		commentDivObj.style.display = 'none';
		
		var commentSpanObj = document.getElementsByClassName("commentContentsSpan")[rowNum];
		commentSpanObj.style.display = 'inline';
// 		$('.commentUpdateContainer').show();
		var commentButtonObj = document.getElementsByClassName("updateButton")[rowNum];
		commentButtonObj.style.display = 'inline';
	}

	function commentUpdateRegisterFnc(rowNum) {
		
		var rowNum = rowNum - 1;
		
		var commentContentsUpdateObj = document.getElementsByClassName("commentContentsUpdate")[rowNum];
		var commentContentsUpdateVal = commentContentsUpdate.value;
		
		var commentUpdateFormObj = document.getElementsByClassName("commentUpdateForm")[rowNum];
		
		if(commentContentsUpdateVal == ''){
			commentContentsUpdateObj.focus();
		}else{
			commentUpdateFormObj.submit();
		}
	
	}
	
// 	window.onload = function()
// 	{
// 	    var tarArr = document.getElementsByClassName("commentContentsSpan").document.getElementsByTagName('textarea');
// 	    for(var i=0; i<tarArr.length; i++) {
// 	    	tarArr[i].style.height = tarArr[i].scrollHeight; 
// 	    }
// 	}
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
								<input class="updateButton" type="button" value="수정" onclick="commentUpdateFnc(${commentVo.rowNum});">
								<button type="button" onclick="location.href='../comment/delete.do?commentNo=${commentVo.commentNo}&boardNo=${commentVo.boardNo}'">삭제</button>
							</c:if>
							</span>
						</td>
					</tr>	
					<tr>
						<td class="commentsContents">
							<span class="commentContentsSpan">
								<textarea class="commentContentsTextarea" id="contents" style="border: none; height: 50px;" class="contents" name="contents" readonly="readonly" onkeyup='this.style.height = this.scrollHeight'>
									${commentVo.contents}
								</textarea></span>
							<div class="commentUpdateContainer" style="display: none;">
								<form class="commentUpdateForm" action="../comment/updateCtr.do" method="post">
									<input type="hidden" id="commentNo" class="commentNo" name="commentNo" value="${commentVo.commentNo}">
									<input type="hidden" id="boardNo" class="boardNo" name="boardNo" value="${commentVo.boardNo}">
						 			<input type="hidden" id="memberNo" class="memberNo" name="memberNo" value="${_memberVo_.memberNo}">
									<textarea id="commentContentsUpdate" class="commentContentsUpdate" name="contents"  rows="3">${commentVo.contents}</textarea>
									<div><input type="button" onclick="commentUpdateRegisterFnc(${commentVo.rowNum})" value="등록">
										<input type="button" onclick="commentCancelFnc(${commentVo.rowNum});" value="취소">
									</div>
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
