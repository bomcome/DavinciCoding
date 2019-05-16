<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript">
	function pageMemberInsertFnc(){
// 		alert(${memberVo.memberNo});
		
		location.href = "../member/add.do";
	}
	function pageMoveListFnc(){
		location.href = "../restaurants/list.do"
	}
</script>
<style type="text/css">
	#loginForm{
		width:300px;
		text-align: center;
		margin:auto;
		font-weight: bold;
	}
	
	#loginForm{
		height: 601px;
	}
	#loginHeaderDiv {
		width:1000px;
		margin-left: 465px;
	}
	
	
</style>
</head>
<body>

<div id="loginHeaderDiv">
	<jsp:include page="/WEB-INF/views/headerTitle.jsp" />
</div>
	<jsp:include page="/WEB-INF/views/memberCss.jsp" />
<div style="clear:both;"></div>
	
	<br/>

	<div id="loginForm">
		<form style="margin: auto;" action="loginCtr.do" method="post">
			
			<div style="text-align: left; padding-left: 65px;">
				<div>
					<ul>
						<li><input type="text" name="email" placeholder="이메일">
					</ul>
				</div>
				<div>
					<ul>
						<li><input type="password" name='password' id='password' placeholder="비밀번호">
					</ul>
				</div>	
				<div>
					<ul>		
						<li><input type="submit" class="memberInput" 
								style="margin-left: 0px;" value="로그인">
					</ul>	
				</div>
				<div>
					<ul>	
						<li><input type="button" class="memberInput" style="margin-left: 0px;" 
								value="메인화면"  onclick="pageMoveListFnc();">
					</ul>
				</div>
			</div>
			
			<hr>
			
			<div>	
				<ul>
					<li><input type="button" class="memberInput" value="회원가입" 
							onclick="pageMemberInsertFnc();">
				</ul>
			</div>
		</form>
	</div>

	<jsp:include page="/WEB-INF/views/Tail.jsp"/>

</body>
</html>