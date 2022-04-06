<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<div id="login_container">
<section id="wrapper" class="layoutLogin">
       <div class="loginheader">
   		 <img src="${url}/img/LOgo.png" style="width:250px;"/>
   		 <div>─── Sign In ───</div>
  	   </div>
     <form method="post" action="#" id="form1">
  		 <div id="contents">
   			 <div class="loginSection">
    			 <div class="userlogin" id="userlogin">
  					<fieldset>
     				   <legend class="accounthidden">login ID</legend>
       					 <div class="id">
        					 <input type="text" class="input01" name="user_id" id="user_id" placeholder="UserID" style="margin-bottom:20px;"/>
       					 </div>
    				     <div class="password">
      					     <input type="password" class="input01" name="user_pwd" id="user_pwd" placeholder="Password" style="margin-bottom:20px;"/>
     				     </div>
       					 <div class="loginbtn">
        					 <input type="submit" class="button01" value="Login" style="margin-bottom:20px;"/>
       					 </div>
    				 </fieldset>
    			 </div>
   			  <input type="checkbox" value="idremem" style="margin-bottom:100px;"/> 아이디 기억
   			 </div>
   			 <hr/>
   		 <div style="width:400px; margin:0 auto;">
      		   <p class="loginmenu" style="font-size:0.8em; text-align: center;">
    				  아이디가 없으시다면? <a href="#" class="join" onclick="">회원가입</a>
    		   </p>
 	    </div>
   		</div>
     </form>
</section>
</div>