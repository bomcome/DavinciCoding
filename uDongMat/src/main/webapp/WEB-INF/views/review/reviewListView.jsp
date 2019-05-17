<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<style type="text/css">
   
   #commentListContainer #commentLetter {
      font-size: 19px;
      font-weight: bold;
      border-bottom: 1px solid #8C8C8C;
      width: 1200px;
      text-align: left;
   }
   
   #commentListContainer table tr td {
      font-size: 15px;
      font-weight: bold;
   }
   #commentListContainer table{
      border-bottom: 1px solid #8C8C8C;
      width: 1200px;
   }
   #commentListContainer table{
      border-bottom: 1px solid #8C8C8C;
      
   }
   #commentListContainer table .commentsContents{
      font-size: 15px;
      font-weight: normal;
      
   }
   #commentListContainer{
      margin-top: 20px;
   }
   #commentListContainer #commentTable{
      
   }
   #commentListContainer table .commentCreDate{
      margin-left: 20px;
   }
   
   
   #commentListContainer .commentUpdateContainer .commentUpdateForm #commentContentsUpdate {
      width: 1200px;
      resize: none;
   }
   #commentListContainer .commentUpdateContainer {
      margin-left: 80px;
   }
   #commentListContainer .commentContentsTextarea{
/*       width:800px; */
      text-align: left;
      resize: none;
   }
   #commentListContainer #commentListContainer .commentReceiver{
      font-weight: bold;
      color: gray;
      font-size: 14px;
   }
   
   #commentListContainer .cocommentContents{
      width: 1200px;
   }
   
   #commentListContainer #commentRecommendButtonsdiv{
/*       width: 1109px; */
      text-align: right;
      
   }
   
   .commentInfo, .commentSpan, .commentRecommendButtonsSpan{
   		float:left;
   }
   
   .commentRecommendButtonsSpan{
   	margin-left: 4px;
   }
</style>

<script type="text/javascript" 
   src="/uDongMat/resources/js/jquery-3.3.1.js"></script> 
<script type="text/javascript">
     
   function commentUpdateFnc(rowNum) {
      var rowNum = rowNum - 1;
      
      var commentDivObj = document.getElementsByClassName("commentUpdateContainer")[rowNum];
      commentDivObj.style.display = 'inline';
      
      var commentSpanObj = document.getElementsByClassName("commentContentsSpan")[rowNum];
      commentSpanObj.style.display = 'none';
//       $('.commentUpdateContainer').show();
      
      var commentButtonObj = document.getElementsByClassName("updateButton")[rowNum];
      commentButtonObj.style.display = 'none';
   }
   
   function commentCancelFnc(rowNum) {
      var rowNum = rowNum - 1;
      
      var commentDivObj = document.getElementsByClassName("commentUpdateContainer")[rowNum];
      commentDivObj.style.display = 'none';
      
      var commentSpanObj = document.getElementsByClassName("commentContentsSpan")[rowNum];
      commentSpanObj.style.display = 'inline';
//       $('.commentUpdateContainer').show();
      var commentButtonObj = document.getElementsByClassName("updateButton")[rowNum];
      commentButtonObj.style.display = 'inline';
   }

   function commentUpdateRegisterFnc(rowNum) {
      
      var rowNum = rowNum - 1;
      
      var commentContentsUpdateObj = document.getElementsByClassName("commentContentsUpdate")[rowNum];
      var commentContentsUpdateVal = commentContentsUpdate.value;
      
      var commentUpdateFormObj = document.getElementsByClassName("commentUpdateForm")[rowNum];
      
      if(commentContentsUpdateVal == ''){
         commentContentsUpdateObj.focus();
      }else{
         commentUpdateFormObj.submit();
      }
   
   }
   
   
   
   function cocommentAddFnc(rowNum) {
      var rowNum = rowNum - 1;
      
      var commentDivObj = document.getElementsByClassName("cocommentAddContainer")[rowNum];
      commentDivObj.style.display = 'inline';
      
//       var commentSpanObj = document.getElementsByClassName("cocommentContentsSpan")[rowNum];
//       commentSpanObj.style.display = 'none';
//       $('.commentUpdateContainer').show();
      
      var commentButtonObj = document.getElementsByClassName("cocommentButton")[rowNum];
      commentButtonObj.style.display = 'none';
   }
   
   function cocommentAddCancelFnc(rowNum) {
      var rowNum = rowNum - 1;
      
      var commentDivObj = document.getElementsByClassName("cocommentAddContainer")[rowNum];
      commentDivObj.style.display = 'none';
      
//       var commentSpanObj = document.getElementsByClassName("cocommentContentsSpan")[rowNum];
//       commentSpanObj.style.display = 'inline';
//       $('.commentUpdateContainer').show();
      var commentButtonObj = document.getElementsByClassName("cocommentButton")[rowNum];
      commentButtonObj.style.display = 'inline';
   }
   
   function cocommentRegisterFnc(rowNum) {
      var rowNum = rowNum - 1;
      var cocommentContentsObj = document.getElementsByClassName('cocommentContents')[rowNum];
      var cocommentContentsVal = cocommentContentsObj.value;
      
      var cocommentAddFormObj = document.getElementsByClassName('cocommentAddForm')[rowNum];
      
      if(cocommentContentsVal == ''){
         cocommentContentsObj.focus();
      }else{
         cocommentAddFormObj.submit();
      }
   
   }
   
   var button = true;
   function showParentContentsFnc(rowNum) {
      var rowNum = rowNum - 1;
      button = !button;
      
      var commentContentsDivObj = document.getElementsByClassName("commentsContents")[rowNum];
      if(button == false){
         var parentCommentContentsDivObj = commentContentsDivObj.getElementsByClassName("parentCommentContentsDiv")[0];
         parentCommentContentsDivObj.style.display = 'inline';
      }else{
         var parentCommentContentsDivObj = commentContentsDivObj.getElementsByClassName("parentCommentContentsDiv")[0];
         parentCommentContentsDivObj.style.display = 'none';
      }
//       var commentSpanObj = document.getElementsByClassName("cocommentContentsSpan")[rowNum];
//       commentSpanObj.style.display = 'none';
//       $('.commentUpdateContainer').show();
      
//       var commentButtonObj = document.getElementsByClassName("cocommentButton")[rowNum];
//       commentButtonObj.style.display = 'none';
      
   }
   
   
   function fnMove(seq){
       var offset = $("#div" + seq).offset();
       $('html, body').animate({scrollTop : offset.top}, 400);
   }
   
   
   
//    function fnMove(seq){
//        var offset = $("#div" + seq).offset();
//        $('html, body').animate({scrollTop : offset.top}, 400);
//    }

// <BODY>
//    <button onclick="fnMove('1')">div1로 이동</button>
//    <button onclick="fnMove('2')">div2로 이동</button>
//    <button onclick="fnMove('3')">div3로 이동</button>
//    <div id="div1">div1</div>
//    <div id="div2">div2</div>
//    <div id="div3">div3</div>
// </BODY>
// </HTML>


   

   
   
//    window.onload = function()
//    {
//        var tarArr = document.getElementsByClassName("commentContentsSpan").document.getElementsByTagName('textarea');
//        for(var i=0; i<tarArr.length; i++) {
//           tarArr[i].style.height = tarArr[i].scrollHeight; 
//        }
//    }
</script>

      <div id=commentListContainer>
         
         <div id="commentLetter">댓글(${totalCount})</div>
         
         <c:forEach var="reviewVo" items="${reviewList}">
            <table>
            
                <tr>
                  <td class="commentFirstTd">
                     <input type="hidden" name="reviewNo" value="${reviewVo.reviewNo}">
                     <input type="hidden" name="boardNo" value="${reviewVo.restaurantNo}">
                     <span class="commentInfo">${reviewVo.nickname}
                     <span class="commentCreDate"><fmt:formatDate value="${commentVo.createDate}" pattern="yyyy/MM/dd HH:mm:ss"/></span>
                     <span class="commentSpan">
                     </span>
	                     <c:if test="${_memberVo_.memberNo eq reviewVo.memberNo}">
	                        <input class="updateButton" type="button" value="수정" onclick="commentUpdateFnc(${reviewVo.rowNum});">
	                        <button type="button" onclick="location.href='../review/delete.do?reviewNo=${reviewVo.reviewNo}&restaurantNo=${reviewVo.restaurantNo}'">삭제</button>
	                     </c:if>
	                     <c:if test="${_memberVo_ != null}">
	                        <input class="cocommentButton" type="button" value="답글" onclick="cocommentAddFnc(${reviewVo.rowNum});">
	                     </c:if>
	                     <c:if test="${_memberVo_ == null}">
	                        <button type="button" onclick="location.href='../auth/login.do'">답글</button>
	                     </c:if>
                     </span>
                     
                  </td>
               </tr>   
               <tr>
                  <td class="commentsContents">
                     <span class="commentReceiver">
                     <c:if test="${reviewVo.parentReviewNo != 0 && reviewVo.parentReviewNo != null}">
                        TO. <button type="button" onclick="showParentContentsFnc(${reviewVo.rowNum})" style="border: none;">${reviewVo.parentNickname}</button>
                        <div class="parentCommentContentsDiv" style="display: none;">
                           ${reviewVo.parentContents}
                        </div>
                     </c:if>
                     
                     </span>
                     
                     
                     
                     <div>
                     	<span class="commentContentsSpan">
                        	<textarea class="commentContentsTextarea" id="commentContentsTextarea" 
                        		style="border: none;" cols="130" name="contents" readonly="readonly"><c:out value="${reviewVo.contents}" /></textarea>
                        </span>
                     
                     </div>
                     
                     <div class="commentUpdateContainer" style="display: none;">
                        <form class="commentUpdateForm" action="../review/updateCtr.do" method="post">
                           <input type="hidden" id="commentNo" class="commentNo" name="reviewNo" value="${reviewVo.reviewNo}">
                           <input type="hidden" id="boardNo" class="boardNo" name="restaurantNo" value="${reviewVo.restaurantNo}">
                            <input type="hidden" id="memberNo" class="memberNo" name="memberNo" value="${_memberVo_.memberNo}">
                           <textarea id="commentContentsUpdate" class="commentContentsUpdate" name="contents"  rows="3">${reviewVo.contents}</textarea>
                           <div>
                              <input type="button" onclick="commentUpdateRegisterFnc(${reviewVo.rowNum})" value="등록">
                              <input type="button" onclick="commentCancelFnc(${reviewVo.rowNum});" value="취소">
                           </div>
                        </form>
                     </div>
                     
                     
                     
                     <div class="cocommentAddContainer" style="display: none;">
                        <div class="cocommentAddLetter">답글쓰기</div>
                        <form class="cocommentAddForm" action="../review/addCtr.do" method="post">
                           <input type="hidden" id="boardNo" class="boardNo" name="restaurantNo" value="${restaurantsVo.restaurantNo}">
                           <input type="hidden" id="memberNo" class="memberNo" name="memberNo" value="${_memberVo_.memberNo}">
                           <input type="hidden" id="parentCommentNo" class="parentCommentNo" 
                              name="parentReviewNo" value="${reviewVo.reviewNo}">
                           <textarea id="cocommentContents" class="cocommentContents" name="contents"></textarea>
                           <div>
                              <input  type="button" onclick="cocommentRegisterFnc(${reviewVo.rowNum});" value="등록">
                              <input type="button" onclick="cocommentAddCancelFnc(${reviewVo.rowNum});" value="취소">
                              
                           </div>
                        </form>
                  </div>

                  </td>
                  
               </tr>   
            </table>
         </c:forEach>
         

      </div>