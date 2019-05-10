<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style type="text/css">
	#commentAddContainer #commentAddForm #commentContents {
		width: 1108px;
		resize: none;
	}
	#commentAddContainer {
		margin-top: 0px;
		margin-left: 380px;
	}
	#commentAddLetter {
		margin-top: 15px;
		font-size: 20px;
		font-weight: bold;
	}
</style>
<script type="text/javascript">

	function commentRegisterFnc() {
		
		var commentContentsObj = document.getElementById('commentContents');
		var commentContentsVal = commentContentsObj.value;
		
		var commentAddFormObj = document.getElementById('commentAddForm');
		
		if(commentContentsVal == ''){
			commentContentsObj.focus();
		}else{
			commentAddFormObj.submit();
		}
	
	}
</script>


		<div id="commentAddContainer">
			<div id="commentAddLetter">댓글쓰기</div>
			<form id="commentAddForm" action="../review/addCtr.do" method="post">
				<input type="hidden" id="boardNo" class="boardNo"
					name="restaurantNo" value="${restaurantsVo.restaurantNo}"> <input
					type="hidden" id="memberNo" class="memberNo" name="memberNo"
					value="${_memberVo_.memberNo}">
				<textarea id="commentContents" class="contents" name="contents"
					rows="5"></textarea>
				<div>
					<c:if test="${_memberVo_ != null}">
						<input type="button" onclick="commentRegisterFnc();" value="등록">
					</c:if>
					<c:if test="${_memberVo_ == null}">
						<button type="button" onclick="location.href='../auth/login.do'">등록</button>
					</c:if>
				</div>
			</form>
		</div>
 