<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
	
<script type="text/javascript" 
	src="/uDongMat/resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	
	function pageMoveDeleteFnc(memberNo){
		var url = 'deleteCtr.do?memberNo=' + memberNo;
		location.href = url;
	}
	
	function pageMoveBeforeFnc(memberNo){
		var url = 'listOne.do?memberNo=' + memberNo;
		location.href = url;
	}
	
	$(document).ready(function() {
		//패스워드 체크
		 $('#password').keyup(function() {
		       var passwordObj = $('#password').val();
		       var passwordChkObj = $('#passwordChk').val();
		       
		       var successMsg = "비밀번호가 일치하지 않습니다.";
		       var failMsg = "";
		          
		       if (passwordObj != passwordChkObj) {
		          $('#passwordChkMsg').css('color', 'red');
		          $('#passwordChkMsg').css('font-size','12px');
		          $('#passwordChkMsg').html(successMsg);
		       } else if(passwordObj == passwordChkObj){
		    
		          $('#passwordChkMsg').html(failMsg);
		       }
		    });//패스워드 end
		
		//패스워드 확인 체크
	    $('#passwordChk').keyup(function() {
	       var passwordObj = $('#password').val();
	       var passwordChkObj = $('#passwordChk').val();
	       
	       var successMsg = "비밀번호가 일치하지 않습니다.";
	       var failMsg = "";
	          
	       if (passwordObj != passwordChkObj) {
	          $('#passwordChkMsg').css('color', 'red');
	          $('#passwordChkMsg').css('font-size','12px');
	          $('#passwordChkMsg').html(successMsg);
	       } else if(passwordObj == passwordChkObj){
	    
	          $('#passwordChkMsg').html(failMsg);
	       }
	    });//패스워드 확인 end
	
	 });
	
	
	function memberUpdateFnc(){
	
		var updateFormObj = document.getElementById("updateForm");
		var nickNameVal = document.getElementById('nickName');
		var passwordVal = document.getElementById('password');
		var passwordChkVal = document.getElementById('passwordChk');
		
		//first if문 start
        if (nickNameVal.value == '') {
			alert('닉네임 입력하세요!');
			nickNameVal.focus();
		
			return;
		}
        else if(${overlapNickName} == 1) {
			alert('닉네임 중복 확인을 해주세요');
			
			return;	
		}
        else if (passwordVal.value == '') {
			alert('비밀번호를 입력하세요!');
			passwordVal.focus();
			
			return;
		}
        else if (passwordChkVal.value == '') {
			alert('비밀번호 확인을 입력하세요!');
			passwordChkVal.focus();
			return;
		}
        else if (passwordVal.value != passwordChkVal.value) {
		alert('비밀번호가 틀립니다.\n다시 확인하세요!!');
		
		return;
		}
        else{
        	
			var r = confirm("정말로 수정하시겠습니다??")
			
			//second if문 start
			if(r == true){
				updateFormObj.submit();
			} 
			else{
				return;
			}//second if문 end
		}//first if문 end
	}
	
	//별명 중복체크
	function nickNameChkMoveFnc(){
		
 		var addNickNameChkFormObj = document.getElementById("nickNameChkForm");
 		var memberNoVal = document.getElementById('memberNo');
 		var emailChkVal = document.getElementById('email');
		var nickNameChkVal = document.getElementById('nickName');

		
		if (nickNameChkVal.value == '') {
			alert("닉네임을 입력하세요!");
			nickNameChkVal.focus();
			
			return;
		}
		else{
			
			var htmlStr = "<input type='hidden' name='email' value=" + emailChkVal.value + ">";
			htmlStr = htmlStr + "<input type='hidden' name='memberNo' value=" + ${memberVo.memberNo} + ">";
			htmlStr = htmlStr + "<input type='hidden' name='nickName' value=" + nickNameChkVal.value + ">";
			htmlStr = htmlStr + "<input type='hidden' name='overlapNickName' value=" + ${overlapNickName} + ">";

			addNickNameChkFormObj.innerHTML = htmlStr;
			addNickNameChkFormObj.submit();
		}
		
	}
	
</script>
<style type="text/css">
	.dateBox{
		width: 171px;
		height: 19px;
	    border: 1px solid black;
	    -webkit-appearance: textfield;
	    font: 400 13.3333px Arial;
	}
	
	#memberUpdateFormDiv{
		height: 622px;
	}
</style>
</head>
<body style="overflow-x:hidden">
<div style="width: 1920px;">
	<jsp:include page="../headerLeftButtons.jsp"/> 
	<jsp:include page="/WEB-INF/views/headerTitle.jsp" />
	<jsp:include page="/WEB-INF/views/headerButtons.jsp" />
	<jsp:include page="/WEB-INF/views/memberCss.jsp" />
<div style="width: 1920px;" id="memberUpdateFormDiv">	
	<c:if test="${sessionScope._memberVo_.memberNo == memberVo.memberNo}">
	
	<div id="member">
		<form action="./updateCtr.do" id="updateForm" method="post" enctype="multipart/form-data">
			<input type="hidden" name='memberNo' value='${memberVo.memberNo}'>
			<input type="hidden" name='memberGrade' value='${memberVo.memberGrade}'>
	
				
			<div style="text-align: left; padding-left: 70px;">
			
				<div>
					<ul>
						<li>이메일
						<li><input type="text" name="email" id="email" value='${memberVo.email}' readonly="readonly" tabindex="-1"
							style="color:#808080; background-color: #ffff;" onfocus="this.blur();">
					</ul>
				</div>
				<div>
					<ul>
						<li>닉네임
						<li>
							<input type="text" name='nickName' id='nickName' 
							value="${memberVo.nickName}">
							<input type="button" id="nickNameChk" value="증복확인" onclick="nickNameChkMoveFnc();">					
					</ul>
				</div>
				<div>
					<ul>
						<li>비밀번호
						<li> <input type="password" name="password" id="password"
								value='' required="required">
						
					</ul>
				</div>
				<div>
					<ul>
						<li>비밀번호 확인
						<li><input type="password" name="passwordChk" id="passwordChk"
							value='' required="required">
						<li><a id="passwordChkMsg"></a>
					</ul>
				</div>	
				<%-- <div>		
					<ul>
						<li>가입일
						<li>
							<span class="dateBox">
								<fmt:formatDate value="${memberVo.createDate}" pattern="yyyy-MM-dd"/>
							</span>
					</ul>
				</div>	 --%>			
			</div>
			
			<div>
				<ul>
					<li><input type="button" class="memberInput" onclick="memberUpdateFnc();" value="수정하기">
				
				</ul>
			</div>
			<div>
				<ul>
					<li><input type="button" class="memberInput" value="수정취소" 
						onclick="pageMoveBeforeFnc(${memberVo.memberNo});">
				</ul>
			</div>

		</form>
	</div>
	
	</c:if>
	
	<c:if test="${sessionScope._memberVo_.memberNo != memberVo.memberNo}">
		해커는 꺼져라
	</c:if>
	
	<form action="./nickNameChkCtr.do" id="nickNameChkForm" method="post">	
	</form>
</div>	
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
</div>
</body>
</html>