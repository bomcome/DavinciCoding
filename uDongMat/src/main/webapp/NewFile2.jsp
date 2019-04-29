<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
   function commentUpdateFnc() {
      
      var htmlstr = "<span>";
      var htmlstr = htmlstr + "<jsp:include page='../comments/commentAddForm.jsp'/>";
      var htmlstr = htmlstr + "</span>";
               
      var comentObj = document.getElementById("commentFirstTd");
      comentObj.innerHTML = comentObj.innerHTML + htmlstr;

      
//       var divObj = document.getElementById("includeCommentAddForm");
//       divObj.innerHTML = "<span style='display:none'><jsp:include page='../comments/commentAddForm.jsp'/></span>"
   }
</script>
<meta charset="UTF-8">
<style type="text/css">
   
   #boardOne #commentListContainer #commentLetter {
      font-size: 19px;
      font-weight: bold;
      border-bottom: 1px solid #8C8C8C;
      width: 1105px;
   }
   
   #commentListContainer table tr td {
      font-size: 15px;
      font-weight: bold;
   }
   #commentListContainer table{
      border-bottom: 1px solid #8C8C8C;
      width: 1105px;
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
      margin-left: 380px;
   }
   #commentListContainer #commentTable{
   
   }
   #commentListContainer table #commentCreDate{
      margin-left: 20px;
   }
   
</style>
<title>Insert title here</title>
</head>
<body>


      <div id=commentListContainer>
         
         <div id="commentLetter">댓글(${totalCount})</div>
         
         <c:forEach var="commentVo" items="${commentList}">
            <table>
            
               <tr>
                  <td id="commentFirstTd">
                     <input type="hidden" name="commentNo" value="${commentVo.commentNo}">
                     ${commentVo.nickname}
                     <span id="commentCreDate">${commentVo.createDate}</span>
                     <span id="commentSpan">
                     <button onclick="commentUpdateFnc();">수정</button>
                     <button onclick="">삭제</button></span>
                  </td>
               </tr>   
               <tr>
                  <td class="commentsContents">
                     ${commentVo.contents}
                  </td>
               </tr>   
            </table>   
         </c:forEach>
      </div>
   
</body>
</html>