<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style type="text/css">
	#commentAddContainer #commentAddForm #commentContents {
		width: 1200px;
		resize: none;
	}
	#commentAddContainer {
		margin-top: 0px;
		margin-left: 352px;
	}
	#commentAddLetter {
		margin-top: 15px;
		font-size: 20px;
		font-weight: bold;
	}
</style>
<script type="text/javascript">

	
	function commentRegisterFnc() {
		if(${_memberVo_ != null}){
			
			var commentContentsObj = document.getElementById('commentContents');
			var commentContentsVal = commentContentsObj.value;
			
			var commentAddFormObj = document.getElementById('commentAddForm');
			
			if(commentContentsVal == ''){
				commentContentsObj.focus();
			}else{
				commentAddFormObj.submit();
			}
		}else if(${_memberVo_ == null}){
			var r = confirm("댓글은 회원만 입력 가능합니다. \n로그인 하시겠습니까?")
			
			if(r == true){
				location.href='../auth/login.do';
			} 
			else{
				return;
			}
		}
	
	}
</script>


	<div id="commentAddContainer">
		<div id="commentAddLetter">댓글쓰기</div>
		<form id="commentAddForm" action="../comment/addCtr.do" method="post">
			<input type="hidden" id="boardNo" class="boardNo" name="boardNo" value="${boardVo.boardNo}">
			<input type="hidden" id="memberNo" class="memberNo" name="memberNo" value="${_memberVo_.memberNo}">
			<textarea id="commentContents" class="contents" name="contents"  rows="5"></textarea>
			<div>
					<input  type="button" onclick="commentRegisterFnc();" value="등록">
			</div>
		</form>
	</div>
 