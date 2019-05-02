<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>

<script type="text/javascript" 
	src="/uDongMat/resources/js/jquery-3.3.1.js"></script>

<script type="text/javascript">
	
	//값을 체크한다
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
	    
	    //이메일 체크
	    $('#email').keyup(function() {
		       var emailObj = $('#email').val();
			   var emailComChkObj = emailObj.toString().substring(emailObj.toString().length-4);
			   
		       var successMsg = "이메일에 @은 필수입니다.";
		       var failMsg = "이메일에 [.com]은 필수입니다.";
		       var aaMsg = "";
		       
		       if (emailObj.toString().indexOf('@') == -1) {
		          $('#emailChkMsg').css('color', 'red');
		          $('#emailChkMsg').css('font-size','12px');
		          $('#emailChkMsg').html(successMsg);
		       } else if(emailComChkObj != '.com'){
		          $('#emailChkMsg').css('color', 'red');
		          $('#emailChkMsg').css('font-size','12px');
		          $('#emailChkMsg').html(failMsg);
		       }else{
		    	   $('#emailChkMsg').html(aaMsg);
		       }
		    });//이메일 end
	 });

	
	//회원가입 버튼
	function memberInsertFnc() {
		var emailVal = document.getElementById('email');
		var emailComChk = emailVal.value.toString().substring(emailVal.value.toString().length-4);

		var nickNameVal = document.getElementById('nickName');
		var passwordVal = document.getElementById('password');
		var passwordChkVal = document.getElementById('passwordChk');
		var addFormObj = document.getElementById("addForm");
		

		
		if (emailVal.value == '') {
			alert("이메일을 입력하세요!");
			emailVal.focus();
			return;
		}
		else if(emailVal.value.toString().indexOf('@') == -1 ){
			alert("이메일에 @은 필수입니다.");
			emailVal.focus();
		
			return;
		}
		else if(emailComChk != '.com' ){
			alert("이메일에 [.com]은 필수입니다.");;
			emailVal.focus();
		
			return;
		}
		else if (nickNameVal.value == '') {
			alert("닉네임을 입력하세요!");
			nickNameVal.focus();
			
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
		else if(${overlapEmail} == 1){
			alert('이메일 중복 확인을 해주세요');

			return;			
		}
		else if(${overlapEmail} == 0 && ${overlapNickName} == 0) {
			alert('별명 중복 확인을 해주세요');
			
			return;	
		}
		else{
			alert('환영 합니다.\n회원가입이 완료되었습니다!!');
			addFormObj.submit();
		}
	}
	
	//로그인 페이지 이동
	function pageLoginFormFnc(){
		location.href = "../auth/login.do"
	}
	
	//이메일 중복체크
	function emailChkMoveFnc(){
		
 		var addEmailChkFormObj = document.getElementById("addEmailChkForm");
		var emailChkVal = document.getElementById('email');
		var emailComChk = emailChkVal.value.toString().substring(emailChkVal.value.toString().length-4)
		
		var nickNameChkVal = document.getElementById('nickName');
		
		if (emailChkVal.value == '') {
			alert("이메일을 입력하세요!");
			emailChkVal.focus();
			return;
		}
		else if(emailChkVal.value.toString().indexOf('@') == -1 ){
			alert("이메일에 @은 필수입니다.");
			emailVal.focus();
		
			return;
		}
		else if(emailComChk != '.com' ){
			alert("이메일에 [.com]은 필수입니다.");;
			emailChkVal.focus();
		
			return;
		}
		else{
			var htmlStr = "<input type='hidden' name='email' value=" + emailChkVal.value + ">";
			htmlStr = htmlStr + "<input type='hidden' name='nickName' value=" + nickNameChkVal.value + ">";
	
			
			addEmailChkFormObj.innerHTML = htmlStr;
			addEmailChkFormObj.submit();	
		}
		
	}
	
	//별명 중복체크
	function nickNameChkMoveFnc(){
		
 		var addNickNameChkFormObj = document.getElementById("addNickNameChkForm");
		var emailChkVal = document.getElementById('email');
		var nickNameChkVal = document.getElementById('nickName');
		
		
		if (nickNameChkVal.value == '') {
			alert("별명을 입력하세요!");
			nickNameChkVal.focus();
			return;
		}else{
			
			var htmlStr = "<input type='hidden' name='email' value=" + emailChkVal.value + ">";
			htmlStr = htmlStr + "<input type='hidden' name='nickName' value=" + nickNameChkVal.value + ">";
	
			addNickNameChkFormObj.innerHTML = htmlStr;
			addNickNameChkFormObj.submit();
		}
		
	}
</script>
<style type="text/css">
	
	#emailChk, #nickNameChk{
	 	width:65px; 
	 	height:22px; 
	 	margin-left: -6.5px; 
	 	padding-bottom: 18px; 
	 	font-size: 0.8em
    }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/headerTitle.jsp" />
	<jsp:include page="/WEB-INF/views/headerButtons.jsp" />
	<jsp:include page="/WEB-INF/views/memberCss.jsp" />
<div>
</div>
	<div id="member">
		<form action="./addCtr.do" id="addForm"method="post" style="font-weight: bold;"
			enctype="multipart/form-data">
			
			<div style="text-align: left; padding-left: 70px;">
				<div>
					<ul>
						<li>이메일 
						<li><input type="email" id="email" name="email" value='${memberVo.email}' placeholder="이메일 확인 ">
						<input type="button" id="emailChk" value="증복확인" onclick="emailChkMoveFnc();">
						<li><a id="emailChkMsg"></a>
					</ul>
				</div>	
				<div>
					<ul>
						<li>닉네임
						<li><input type="text" id="nickName" name='nickName' value='${memberVo.nickName}' placeholder="닉네임 확인">
						<input type="button" id="nickNameChk" value="증복확인" onclick="nickNameChkMoveFnc();">
					</ul>
				</div>
				<div>
					<ul>
						<li>비밀번호
						<li><input type="password" id="password" name='password' placeholder="비밀번호 확인">
					</ul>
				</div>
				<div>
					<ul>
						<li>비밀번호 확인 
						<li><input type="password" id="passwordChk" name="passwordChk" placeholder="비밀번호 재확인">
						<li><a id="passwordChkMsg"></a>
					</ul>
				</div>
			</div>
			<div>
				<ul>
					<li><input type="button" class="memberInput" onclick="memberInsertFnc();" value="회원가입">
				</ul>
				<ul>	
					<li><input type="button" class="memberInput" onclick="pageLoginFormFnc()" value="가입취소">
				</ul>
			</div>
		</form>
	</div>

	<form action="./addEmailChkCtr.do" id="addEmailChkForm" method="post">	
	</form>
	
	<form action="./addNickNameChkCtr.do" id="addNickNameChkForm" method="post">	
	</form>
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
</body>
</html>