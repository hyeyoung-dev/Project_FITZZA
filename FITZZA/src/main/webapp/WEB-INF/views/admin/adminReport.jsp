<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <link rel="stylesheet" href="/css/adminReport.css" type="text/css"/>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style>
	header, footer {display:none}
	#adminReport_container {display:none}
</style>
<!-- 카테고리 선택 js-->
 <script>
$(document).ready(function(){
	$('#todayCodi_box').addClass('report_box_show');
});	
</script>

 <div id="adminReport_container">
 	<h1 class="hidden">신고 관리</h1>
 	<div id="adminReport_wrap">
 		<h3>신고 관리</h3>
 		<ul class="ad_report_status">
 			<li>전체 신고&nbsp;&nbsp; : 
 				<span>${reportCount }건</span>
 			</li>
 			<li>미처리 신고&nbsp;&nbsp; : 
 				<span>${reportNoCount }건</span>
 			</li>
 			<li>처리된 신고&nbsp;&nbsp; : 
 				<span>${reportYesCount }건</span>
 			</li>
 		</ul>
 		<form method="get" action="" id="reportSearchFrm">
			<select name="ReportSearchKey">
		    	<option value="category">게시물 타입</option>
		        <option value="userid">아이디</option>
		        <option value="rep_status">처리상태</option>
		        <option value="blackList">회원분류</option>
		    </select>
		    <input type="text" name="searchReport" id="searchReport"/>
		    <input type="submit" value="검색" id="reportSearch"/>
	     </form>
 		
 		<div id="todayCodi_box" class="Report_box">
	 		<ul class="report_box_title">
	 			<li>신고번호</li>
	 			<li>신고분류</li>
	 			<li>신고<br/>게시물 번호</li>
	 			<li>신고<br/>게시물 제목</li>
	 			<li>게시자<br/> 아이디</li>
		 		<li>신고자<br/>아이디</li>
		 		<li>상세내용</li>
		 		<li>신고일</li>
		 		<li>처리상태</li>
	 		</ul>
	 		<ul class="report_list">
	 			<c:forEach var="vo" items="${reportList}">
		 			<li>${vo.report_num}</li>		 			
		 			<li>${vo.category_name}</li>
		 			<li>${vo.board_num }</li>
		 			<li>${vo.title }</li>
			 		<li>${vo.reported_id }</li>
		 			<li>${vo.user_id }</li>
			 		<li>${vo.report_content }</li>
			 		<li>${vo.report_time }</li>
			 		
			 		<c:if test="${vo.state !='Y'}">
			 		<li id="repo_state">${vo.state },<button class="report_off">처리확인</button><input type="hidden" name="${vo.report_num}" value="${vo.report_num}"></li>
			 		</c:if>
			 		<c:if test="${vo.state == 'Y'}">
			 		<li>처리 완료</li>
			 		</c:if>
		 		</c:forEach>
	 		</ul>
 		</div>
 		
 	</div>
 </div>
 <script>
 $(".report_off").click(function(){
		var repo_num = $(this).next().val();
	 	var reportOffOk = confirm("신고 내용을 확인처리 하시겠습니까?");
		
		if(reportOffOk == true){
			document.location.href="/admin/adminReportOff?report_num="+repo_num;
			$.ajax({
				url : "/admin/adminReportOff",
				type : "get",
				data : {"report_num" : repo_num},
				dataType : "json",
				success : function(result){
					alert('신고 처리가 완료되었습니다.');
					$("#repo_state").text('처리 완료');
				}
			})
		}
		
	});
 </script>
 