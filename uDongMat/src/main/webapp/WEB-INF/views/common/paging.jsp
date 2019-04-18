<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style type="text/css">

nav{
	text-align: center;
}
nav > ul {
	list-style-type: none;
	padding: 0px;
	overflow: hidden;
/*  	background-color: #333333;  */
	display: table;
	margin-left: auto;
	margin-right: auto;
}

nav > ul > li{
	float: left;
	font-size: 15px;
}

nav > ul > li > a{
/*  	display: block;  */
 	color: black; 
	text-align: center;
	padding: 10px;
	text-decoration: none;
}

nav > ul > li > a:hover{
	color: black;
/* 	background-color: #5D5D5D; */
	font-weight: bold;
}

.active{
	color: #FFD9EC;
/* 	background-color: #5D5D5D; */
	font-weight: bold;
}
</style>

<script type="text/javascript">

	function goPage(pageNumber){
// 		var curPage = document.getElementById('curPage');
		var curPage = $("#curPage");

// 		curPage.value = dsfsdf;
		curPage.val(pageNumber);

		$("#pagingForm").submit();
	}
	
	$(document).ready(function(){
		var curPageDoc = $('#curPage');
		var id = '#pageButton' + curPageDoc.val();
		
		$(id).addClass('active');
	});
	
</script>

	<nav>
		<ul>
		<!--ㄷ 한자 적용  -->
			<li>
				<a href="#" 
				onclick="goPage(${pagingMap.boardPaging.prevPage});">
				<span>이전</span>
				</a>
			</li>
			
			<c:forEach var="num" begin="${pagingMap.boardPaging.blockBegin}"
				end="${pagingMap.boardPaging.blockEnd}">
				
				<li id="pageButton${num}">
					<a href="#" onclick="goPage(${num});">
						<c:out value="${num}"/>
					</a>
				</li>
				
			</c:forEach>

			<li><a href="#" 
				onclick="goPage(${pagingMap.boardPaging.nextPage});">
				<span>다음</span></a>
			</li>
		</ul>
	</nav>
