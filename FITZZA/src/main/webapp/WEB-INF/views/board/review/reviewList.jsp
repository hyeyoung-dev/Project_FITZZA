<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/reviewList.css" type="text/css">
<!DOCTYPE html>
<div id="review-wrapper"><!-- 전체 틀 -->
  <div id="sub-title">
	<h1> 구매후기</h1>
	<p>구매 후, 개인적인 평가를 적는 곳입니다.</p>
  </div>
  <div id="list-menu">
	<div>글쓰기</div>
  </div>
	<hr/>
	<div id="review_container"><!--  리뷰 글 들어갈곳 -->
	  <ul>
	  	<li>
	  		<div class="post_area">
	  		   <div class="sum-img">
	  		     <a href="#"><img src="/img/exampleimg.png" width="130" width="130"/></a> <!--  이미지 들어갈곳 -->
	  		   </div>
	  		   <div class="post">
	  		     <div class="post_top">
	  		       <div class="title_area">여기는 제목 들어가고</div><!--  제목 -->
	  		       <div class="txt">여기는 글의 일부분이 들어감</div><!-- 글 내용 일부분 -->
	  		     </div>
	  		     <div class="post_bottom"> <!--  작성자 작성일 조회수 등 들어갈곳 -->
	  		       <span>작성자</span><!--  닉네임 -->
	  		       <span>작성날짜</span><!--  작성일자 -->
	  		       <span>조회수</span><!--  조회수 -->
	  		     </div>
	  		   </div>
	  		</div>
	  	</li>
	  	
	  	<li>
	  		<div class="post_area">
	  		   <div class="sum-img">
	  		     <a href="#"><img src="/img/exampleimg.png" width="130" width="130"/></a> <!--  이미지 들어갈곳 -->
	  		   </div>
	  		   <div class="post">
	  		     <div class="post_top">
	  		       <div class="title_area">여기는 제목 들어가고</div><!--  제목 -->
	  		       <div class="txt">여기는 글의 일부분이 들어감</div><!-- 글 내용 일부분 -->
	  		     </div>
	  		     <div class="post_bottom"> <!--  작성자 작성일 조회수 등 들어갈곳 -->
	  		       <span>작성자</span><!--  닉네임 -->
	  		       <span>작성날짜</span><!--  작성일자 -->
	  		       <span>조회수</span><!--  조회수 -->
	  		     </div>
	  		   </div>
	  		</div>
	  	</li>
	  	
	  	<li>
	  		<div class="post_area">
	  		   <div class="sum-img">
	  		     <a href="#"><img src="/img/exampleimg.png" width="130" width="130"/></a> <!--  이미지 들어갈곳 -->
	  		   </div>
	  		   <div class="post">
	  		     <div class="post_top">
	  		       <div class="title_area">여기는 제목 들어가고</div><!--  제목 -->
	  		       <div class="txt">여기는 글의 일부분이 들어감</div><!-- 글 내용 일부분 -->
	  		     </div>
	  		     <div class="post_bottom"> <!--  작성자 작성일 조회수 등 들어갈곳 -->
	  		       <span>작성자</span><!--  닉네임 -->
	  		       <span>작성날짜</span><!--  작성일자 -->
	  		       <span>조회수</span><!--  조회수 -->
	  		     </div>
	  		   </div>
	  		</div>
	  	</li>
	  	
	  	<li>
	  		<div class="post_area">
	  		   <div class="sum-img">
	  		     <a href="#"><img src="/img/exampleimg.png" width="130" width="130"/></a> <!--  이미지 들어갈곳 -->
	  		   </div>
	  		   <div class="post">
	  		     <div class="post_top">
	  		       <div class="title_area">여기는 제목 들어가고</div><!--  제목 -->
	  		       <div class="txt">여기는 글의 일부분이 들어감</div><!-- 글 내용 일부분 -->
	  		     </div>
	  		     <div class="post_bottom"> <!--  작성자 작성일 조회수 등 들어갈곳 -->
	  		       <span>작성자</span><!--  닉네임 -->
	  		       <span>작성날짜</span><!--  작성일자 -->
	  		       <span>조회수</span><!--  조회수 -->
	  		     </div>
	  		   </div>
	  		</div>
	  	</li>
	  	
	  	<li>
	  		<div class="post_area">
	  		   <div class="sum-img">
	  		     <a href="#"><img src="/img/exampleimg.png" width="130" width="130"/></a> <!--  이미지 들어갈곳 -->
	  		   </div>
	  		   <div class="post">
	  		     <div class="post_top">
	  		       <div class="title_area">여기는 제목 들어가고</div><!--  제목 -->
	  		       <div class="txt">여기는 글의 일부분이 들어감</div><!-- 글 내용 일부분 -->
	  		     </div>
	  		     <div class="post_bottom"> <!--  작성자 작성일 조회수 등 들어갈곳 -->
	  		       <span>작성자</span><!--  닉네임 -->
	  		       <span>작성날짜</span><!--  작성일자 -->
	  		       <span>조회수</span><!--  조회수 -->
	  		     </div>
	  		   </div>
	  		</div>
	  	</li>
	  	
	  </ul>
	</div>
	 <!-- 게시물 리스트 페이징 -->
        <ul class="paging">
            <!-- <c:if test="">
                <li>이전</li>
            </c:if>
            <c:if test="">
                <li><a href="">이전</a></li>
            </c:if> -->
            <!-- <c:forEach var="" begin="" end="">
                <c:if test="">
                    <c:if test="">
                        <li style="background-color:#fff58c; border-radius:360px; font-weight:bold;">
                    </c:if>
                    <c:if test="">
                        <li>
                    </c:if>
                    <a href="">${p}</a></li>
                </c:if>
            </c:forEach> -->
            
            <!-- 삭제 -->
            <li><a href="">이전</a></li>
            <li style="background-color:#fff58c; border-radius:360px; font-weight:bold;">1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
            <li>5</li>
            <li><a href="">다음</a></li> <!-- 삭제 -->

<!--             <c:if test="">
                <li>다음</li>
            </c:if>
            <c:if test="">
                <li><a href="">다음</a></li>
            </c:if> -->
        </ul>
    
        <form action="" id="searchFrm">
            <select name="searchKey">
                <option value="subject">제목</option>
                <option value="content">내용</option>
                <option value="userid">작성자</option>
            </select>
            <input type="text" name="searchWord" id="searchWord"/>
            <input type="submit" value="Search"/>
        </form>
</div>