<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 조회</title>
<style type="text/css">
	#member{
		width:300px;
		text-align: center;
		margin:auto;
		font-weight: bold;
	}
	
	.memberInput{
		width: 160px;
	}
	
</style>
<script type="text/javascript" 
	src="/uDongMat/resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	
	function pageMoveListFnc(){
		location.href = "list.do";
	}
	
	function pageMoveDeleteFnc(){
		
		
		var r = confirm("정말로 탈퇴하시겟습니까?")
		if(r == true){
			var url = 'deleteCtr.do?memberNo=' + ${memberVo.memberNo};
			location.href = url;
		} 
		else{
			return;
		}

	}
		
</script>

</head>
<body>
<%-- 	<jsp:include page="/WEB-INF/views/Header.jsp" /> --%>
	
	<br/>
	
	<div id="member">
		<form action="./update.do" method="get" >
			<input type="hidden" name='memberNo' value='${memberVo.memberNo}'>
			
			<div style="text-align: left; padding-left: 70px;">
				이메일<br/>
				<input type="text" name="email" 
					value='${memberVo.email}' readonly="readonly"><br/>
				<br/>	
			
			
				닉네임 <br/>
				<input type="text" name='nickName' id='nickName' value='${memberVo.nickName}' 
						readonly="readonly"><br/>
				<br/>
			</div>
					
			<input type="submit" class="memberInput" value="정보수정"><br/>
			<br/>
			
			<input type="button" class="memberInput" value="이전화면"  onclick="pageMoveListFnc();"><br/>
			<br/>
			<hr>
			<br/>
			<input type="button" class="memberInput" value="회원탈퇴"  onclick="pageMoveDeleteFnc();">
		</form>
	</div>
	
	<br/>
	<%-- <form action="../common/fileDownload.do" method="post">
		<input type="hidden" id='filePno' name='filePno' value='${fileList[0].PNO}'>
	</form> --%>

	<jsp:include page="/WEB-INF/views/Tail.jsp"/>

</body>
</html>