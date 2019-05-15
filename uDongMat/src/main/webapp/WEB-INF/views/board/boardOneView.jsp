<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
   
   #boardOne #title{
/*       width: 1105px; */
/*       height: 25px; */
/*       margin-bottom: 15px; */
      
      font-size: 20px;
   }
   
   #boardOne #contents{
      font-size: 16px;
/*       width: 990px;  */
/*       border: none; */
      margin-bottom: 15px;
      
   }
   
   #boardOne #inputForm {
      margin-left: 380px;
      width: 1920px;
   }
   
   #boardOne #inputForm #titleLeft {
      float: left;
      font-weight: bold;
      font-size: 25px;
/*        height: 33px;  */
       width: 1109px;
       
   }
   
   #boardOne #inputForm div {
/*       font-weight: bold; */
      font-size: 15px;
   }
   
   #boardOne #inputForm div span{
      font-weight: normal;
      font-size: 14px;
   }
   
   #boardOne #buttons {
      width: 1105px;
      text-align: center;
      margin-left: 380px;
   }
   
   #boardOne{
      width: 1920px;
   }
   

   
   #boardOne #title {
      border: none;
      font-weight: bold;
      font-size: 25px;
/*       height: 24px; */
      margin-top: 0px;
/*       float: left; */
   }
   #boardOne #inputForm #right{
   clear: both;
   width: 1109px;
   border-bottom: 1px solid #8C8C8C;
   margin-bottom: 10px;
/*    margin-bottom: 15px; */
/*    text-align: right;  */
   
   }
   
   #boardOne #inputForm #right span{
/*    margin-right: 15px;  */
/*    font-weight: bold; */
   
   }
   
   #boardOne #inputForm #right > span > span{
   font-weight: bold;
   }
   
   #recommendButtonsDiv{
   text-align: right;
/*    width: 1920px; */
   }
   
/*    #recommendButtonsDiv #recommendButtonsSpan{ */
/*    margin-right: 430px; */
/*    } */
   
   #boardOne #recommendButtonsDiv .recommendUpdateButton {
/*       margin-right: 430px; */
   }
   
   #boardOne #inputForm textarea{
      resize: none;
      border: none; 
   }

   
   #boardOne #boardContentsLetterDiv{
      clear: both;
   }
   
   #boardOne #inputForm > table{
       border-bottom: 1px solid #8C8C8C;
      width: 1109px;
      margin-bottom: 10px;
   }
   
   #boardOne #inputForm > table tr td{
/*       border-bottom: 1px solid #8C8C8C; */
      
   }
   
   #boardOne #inputForm > table div{
/*       border-bottom: 1px solid #8C8C8C; */
/*       width: 1109px; */
/*       margin-bottom: 10px; */
/*       float: left; */
   }
   
   #boardOne #moreViewButton{
   		width: 1105px;
      	text-align: center;
      	margin-left: 380px;
   }
</style>
<script type="text/javascript" 
   src="/uDongMat/resources/js/jquery-3.3.1.js"></script>


<script type="text/javascript">
var globalCnt = 1;


window.onload = function(){
	
	
	var currentScrollVal = document.getElementById("currentScroll").value;
// 	alert(currentScrollVal);
//		window.scrollY = currentScrollVal;
// 	window.scrollTop = (0, currentScrollVal);
	window.scrollTo(0, currentScrollVal);
	
    var divObj = document.getElementById('commentUpdateContainer');
    var divObj2 = document.getElementById('cocommentAddContainer');
    
//     var textareaArr = document.getElementsByTagName('textarea');
//     textareaArr.focus();
    
    var commentTextareaArr = document.getElementsByClassName('commentContentsTextarea');
    for(var i = 0; i < commentTextareaArr.length; i++){
       var commentTextareaVal = commentTextareaArr[i].value;
       var arr = commentTextareaVal.split("\n");
       var count = arr.length;
       for(var n = 0; n < arr.length; n++){

          count += Math.floor(arr[n].length / commentTextareaArr[i].cols); 
       }
       
       commentTextareaArr[i].style.height = (count * 18) + "px";
       
    }
 
    var boardTextareaObj = document.getElementById('contents');
    var fileObj = document.getElementsByName('fileList')[0];
    var boardTextareaVal = boardTextareaObj.value;
    var splitArr = boardTextareaVal.split("\n");
    var lineCount = splitArr.length;
    for(var n = 0; n < splitArr.length; n++){
//        alert(splitArr[n].length)
       lineCount += Math.floor(splitArr[n].length / boardTextareaObj.cols); 
    }
    
//     boardTextareaObj.style.height = (lineCount * 19) + "px";
//     alert(boardTextareaObj.cols);   
//  		alert(fileObj.value);
 		if(lineCount < 15 && fileObj.value == "[]"){
 		 boardTextareaObj.style.height = "285px";
 		}else{
 		 boardTextareaObj.style.height = (lineCount * 19) + "px";
 		}
 }

function boardUpdateSubmitFnc(){
   var boardFormObj = document.getElementById('inputForm');
   boardFormObj.submit();
}

function boardRecommendSubmitFnc(){
   var boardRecommendFormObj = document.getElementById('boardRecommendForm');
   boardRecommendFormObj.submit();
}
</script>
<title>Insert title here</title>
</head>
<body>
   <div id="boardOne">
   <jsp:include page="../headerTitle.jsp"/> 
   <jsp:include page="../headerButtons.jsp"/>

   <div>
   <form id="inputForm" action="./update.do" method="get" >
      <table>
         <tr>
            <td>
               <hr/>
               <input type="hidden" name='boardNo' value='${boardVo.boardNo}'>
<%--                <div id="nicknameLetterDiv">${boardVo.nickname}</div> --%>
               <div id="titleLeft"><input name='title' id='title' type="text" value='${boardVo.title}' readOnly="readonly"></div>
               <div id="right">작성자: ${boardVo.nickname} | <span>작성일: <fmt:formatDate value="${boardVo.createDate}" pattern="yyyy/MM/dd HH:mm"/></span>
                  <span> | 조회수: ${boardVo.hits}</span>
               </div>
               
               
            </td>
         </tr>
<!--       <div id="boardContentsLetterDiv">내용</div> -->
       

      
         <tr>
            <td>
            	<input type="hidden" name='fileList' value='${fileList}'>
               <c:forEach var="row" items="${fileList}">
         <%--             <input type="hidden" class="files" value="${row.IDX}"> --%>
         <%--             ${row.ORIGINAL_FILE_NAME} (${row.FILE_SIZE}kb)<br> --%>
                     <img alt="image not found" style="width: 600px; height: auto;"
                         src="<c:url value='/img/${row.STORED_FILE_NAME}'/>"/><br>
                     </c:forEach>
               
         
         
         
         <!--       <textarea class="commentContentsTextarea" id="commentContentsTextarea"  -->
         <%--       style="border: none;" cols="82" name="contents" readonly="readonly"><c:out value="${commentVo.contents}" /></textarea> --%>
        
               <div></div><textarea name='contents' id='contents' readOnly="readonly"  cols="115"><c:out value="${boardVo.contents}" /></textarea>
               <div id="recommendButtonsDiv">
                  <span id="recommendButtonsSpan">
                  <c:if test="${_memberVo_ != null && recommendVo == null}">
                     <button type="button"  onclick="boardRecommendSubmitFnc()" id="recommendAddButton" class= "recommendUpdateButton">추천${boardVo.recommendCount}</button>
                  </c:if>
                  <c:if test="${_memberVo_ != null && recommendVo != null}">
                     
                     <input type="button" id="recommendDeleteButton" class= "recommendUpdateButton" onclick="location.href='../recommend/deleteBoard.do?boardNo=${boardVo.boardNo}&memberNo=${_memberVo_.memberNo}'" value="추천${boardVo.recommendCount}">
                  </c:if>
                  <c:if test="${_memberVo_ == null}">
                     <input type="button" onclick="location.href='../auth/login.do'" class= "recommendUpdateButton" value="추천${boardVo.recommendCount}">
                  </c:if>
                  </span>
               </div>
            </td>
         </tr>
      
      </table>
   </form>
   </div>
   
<!--    <div> -->
<!--    <span> -->
   
<%--       <c:if test="${_memberVo_ == null}"> --%>
<%--          <button type="button" class= "recommendUpdateButton" onclick="location.href='../auth/login.do'">추천${boardVo.recommendCount}</button> --%>
<%--       </c:if> --%>
      
<%--       <c:if test="${_memberVo_ != null}"> --%>
         
         <form action="../recommend/addBoardCtr.do"  method="post" id="boardRecommendForm">
            <input type="hidden" name='boardNo' value='${boardVo.boardNo}'>
            <input type="hidden" name='memberNo' value='${_memberVo_.memberNo}'>            
         </form>
         
<%--       </c:if> --%>
      
<!--    </span>    -->
<!--    </div> -->

   <div id='buttons'>      
         <input type="button" onclick='location.href="list.do?curPage=${boardListCurPage}"' value="목록보기">
         <c:if test="${_memberVo_.memberNo eq boardVo.memberNo}">
<%--          	<input type="hidden" name='boardListCurPage' value='${curPage}'> --%>
            <input type="button" onclick="boardUpdateSubmitFnc()" value="수정">
            <input type="button" onclick="location.href='delete.do?boardNo=${boardVo.boardNo}'" value="삭제">
         </c:if>   
   <!--       <button type="button" onclick="">답글쓰기</button> -->
      </div>
   
   <jsp:include page="../comments/commentAddForm.jsp"/>
   <jsp:include page="../comments/commentListView.jsp"/>
   <div>
   		<c:if test="${pageScale * pagingMap.commentPaging.curPage < pagingMap.totalCount}">
			<input type="button" value="더보기" onclick=myFunction(); id="moreViewButton">
   		</c:if>
   </div>
   <div>
		<form action="../board/one.do" id="pagingForm" method="get">
			<input type="hidden" name='boardNo' value='${boardVo.boardNo}'>
			<input type="hidden" id="curPage" name="curPage" 
				value="${pagingMap.commentPaging.curPage}">
			<input type="hidden" id="totalCount" name="totalCount" 
				value="${pagingMap.totalCount}">
			<input type="hidden" id="currentScroll" name="currentScroll" 
				value="${currentScroll}">
			<input type="hidden" id="pageScale" name="pageScale"
				value="${pageScale}">
		</form>
	</div>	

   <jsp:include page="../Tail.jsp"/>
   </div>
   
</body>
<script>


	function myFunction() {
	

		var curPageVal = document.getElementById("curPage").value;

		var totalCountVal = document.getElementById('totalCount').value;
		var PAGE_SCALE_Val = document.getElementById('pageScale').value;
		var buttonObj = document.getElementById('moreViewButton');
		var buttonHeight = buttonObj.offsetTop;
		
		if(PAGE_SCALE_Val * curPageVal < totalCountVal){

// 			alert(buttonHeight);
			document.getElementById("currentScroll").value = buttonHeight;
			
			document.getElementById("curPage").value = Number(document.getElementById("curPage").value) + 1;
			document.getElementById("pagingForm").submit();
		}

	}
	
	
</script>

</html>