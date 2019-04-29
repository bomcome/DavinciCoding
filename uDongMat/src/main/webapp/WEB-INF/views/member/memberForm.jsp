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
		else{
			
			addFormObj.submit();
		}
	}
	
	function pageLoginFormFnc(){
		location.href = "../auth/login.do"
	}
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/headerTitle.jsp" />
	<jsp:include page="/WEB-INF/views/headerButtons.jsp" />
	<jsp:include page="/WEB-INF/views/memberCss.jsp" />


	<br/>
	<div id="member">
		<form action="./addCtr.do" id="addForm"method="post" style="font-weight: bold;"
			enctype="multipart/form-data">
			
			<div style="text-align: left; padding-left: 70px;">
				이메일<br/> 
				<input type="email" required="required" id="email" name="email" placeholder="이메일 확인 "><br/>
				<a id="emailChkMsg"></a>
				<br/>
				
				닉네임<br/>
				<input type="text" id="nickName" name='nickName' placeholder="닉네임 확인"><br/>
				<br/>
				
				비밀번호<br/>
				<input type="password" id="password" name='password' placeholder="비밀번호 확인"><br/>
				<br/>
				
				비밀번호 확인 <br/>
				<input type="password" id="passwordChk" name="passwordChk" placeholder="비밀번호 재확인"><br/>
				<a id="passwordChkMsg"></a>
				<br/>
			</div>
			<br/>
			<input type="button" class="memberInput" onclick="memberInsertFnc();" value="회원가입"><br/>
			<br/>
			<input type="button" class="memberInput" onclick="pageLoginFormFnc()" value="가입취소">
		</form>
	</div>
	<br/>
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>

</body>
</html>