<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style type="text/css">
	#commentContents {
		width: 1178px;
 		border: 1px solid gray;
	}
	
	#commentAddContainer {
		width: 1200px;
		margin-top: 50px;
/* 		border: 1px solid red; */
	}
	
	#commentAddLetter {
		display:table-cell;
		text-align:center;
		vertical-align:middle;
		width: 1200px;
		height: 50px;
		color: black;
		font-size: 18px;
		font-weight: bold;
		background-color: #ededed;
	}

	.button input .button button{
		width: 300px;
		height: 40px;
		margin-left: 35px;
		margin-right: 35px;
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
			<div id="commentAddLetter">리 뷰</div>
			<form id="commentAddForm" action="../review/addCtr.do" method="post">
				<input type="hidden" id="boardNo" class="boardNo"
					name="restaurantNo" value="${restaurantsVo.restaurantNo}"> <input
					type="hidden" id="memberNo" class="memberNo" name="memberNo"
					value="${_memberVo_.memberNo}">
				<textarea id="commentContents" class="contents" name="contents"
					rows="5"></textarea>
				<div class="button">
					<c:if test="${_memberVo_ != null}">
						<input type="button" onclick="commentRegisterFnc();" value="등록">
					</c:if>
					<c:if test="${_memberVo_ == null}">
						<input type="button" onclick="location.href='../auth/login.do'" value="등록">
<!-- 						<button type="button" onclick="location.href='../auth/login.do'">등록</button> -->
					</c:if>
				</div>
			</form>
		</div>
 