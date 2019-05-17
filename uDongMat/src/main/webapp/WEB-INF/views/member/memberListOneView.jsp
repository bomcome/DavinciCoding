<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>회원정보 조회</title>


<script type="text/javascript" 
	src="/uDongMat/resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	
	function pageMoveListFnc(){
		location.href = "../restaurants/list.do";
	}
	
	function pageMoveDeleteFnc(){
			
		//first if문
		if(${memberVo.memberGrade == 'admin'}){
			alert("관리자는 탈퇴를 못합니다!!");
			return;
		}
		else{
			var r = confirm("정말로 탈퇴하시겟습니까?")
			
			//second if문
			if(r == true){
				var url = 'deleteCtr.do?memberNo=' + ${memberVo.memberNo};
				location.href = url;
			} 
			else{
				return;
			}//second if문 end
		}//first if문 end
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
	
	#member{
		height: 622px;
	}
	
	
</style>
</head>
<body  style="overflow-x:hidden">
<div style="width: 1920px;">
	<jsp:include page="../headerLeftButtons.jsp"/>
	<jsp:include page="/WEB-INF/views/headerTitle.jsp" />
	<jsp:include page="/WEB-INF/views/headerButtons.jsp" />
	<jsp:include page="/WEB-INF/views/memberCss.jsp" />
	

	
	<div id="member">
		<form action="./update.do" method="get" >
			<input type="hidden" name='memberNo' value='${memberVo.memberNo}'>
							
			<div style="text-align: left; padding-left: 70px;">
				<div>
					<ul>
						<li>이메일
						<li><input type="text" name="email" value='${memberVo.email}' readonly="readonly">
					</ul>
				</div>
				
			
			
				<div>
					<ul>
						<li>닉네임
						<li><input type="text" name='nickName' id='nickName' 
								value='${memberVo.nickName}' readonly="readonly">
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
				</div>		 --%>
		
		

			</div>
		
			<c:if test="${sessionScope._memberVo_.memberNo == memberVo.memberNo}">
				<div>
					<ul>
						<li><input type="submit" class="memberInput" value="정보수정">
					</ul>
				</div>
			</c:if>	
		
			<div>
				<ul>
					<li><input type="button" class="memberInput" value="메인화면"  onclick="pageMoveListFnc();">
				</ul>
			</div>

			<c:if test="${sessionScope._memberVo_.memberNo == memberVo.memberNo}">	
			<hr>
				<div>
					<ul>
						<li><input type="button" class="memberInput" value="회원탈퇴"  onclick="pageMoveDeleteFnc();">
					</ul>
				</div>
			</c:if>	
		</form>
	</div>
	
	<%-- <form action="../common/fileDownload.do" method="post">
		<input type="hidden" id='filePno' name='filePno' value='${fileList[0].PNO}'>
	</form> --%>

	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
</div>
</body>
</html>