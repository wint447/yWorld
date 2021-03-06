<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
	<!-- HEAD 태그 공통 부분  -->
	<%@ include file="include/commons/head.jsp"%>
	<!-- 추가 태그 공통 부분  -->
	<link rel="stylesheet" type="text/css" href="resources/css/pageHome.css" />

<style>
	#regist-area {
		position: relative;
		transform: translateX(33%);
	}
	#loginBtn{
		margin-top: 20px;    
	}

</style>
</head>
<body>
	<!-- Header Area -->
	<header class="header">
	<div id="homeCover">
		<div><h1><span>Y</span><span>E</span><span>L</span><span>L</span><span>O</span><span>W</span>
				 <span> </span><span>W</span><span>O</span><span>R</span><span>L</span><span>D</span><span>&nbsp </span><span>!</span></h1><br>
		<div class="page">
 		 <button class="fun-btn" onclick="move_scroll('loginPage')" style="text-decoration:none;color: white; font-size: large; padding-bottom: 55px;"> Let's go </button>
		</div></div><br></div><br>
	</header>
	<!-- /Header Area -->

	<!-- Registration Area -->
	<section id="loginPage">
	<h2 class="block_title">Join Us!!!</h2> <!-- 줄 긋기 -->
         <div id="regist-area" class="container">
            <div class="row">

               <!-- 로그인 입력 창 -->
               <div class="col-sm-6">
                  <form id="insert-form" role="form" action="user/register" method="post">
                     <!-- 이메일 -->
	                     <div class="form-group">
	                        <div class="col-8" style="padding-right: 0; padding-left: 0;">
	                         	 ＊ e-mail <input type="email" class="form-control" id="your_email"
	                              name="id" placeholder="Enter your email">
		                        <!--경고문 -->
		                        <div id="idCheck1"></div>
	                        </div>
	                     </div>
	                     
                     <!-- 비밀번호 -->
	                     <div class="form-group row">
	                        <div class="col-6" style="padding-right: 0">
	                           	＊ password <input type="password" class="form-control" id="user_password"
	                              name="password" placeholder="Enter password">
		                        <!--경고문 -->
		                        <div id="pwCheck1"></div>
	                        </div>
	                     </div>
                     
                     <!-- 회원가입 동적 생성 -->
                     <div id="change" style="display: none">
                        <!-- 비밀번호 확인 -->
                        <div class="form-group row">
                           <div class="col-6" style="padding-right: 0">
                            	 ＊ password again <input type="password" class="form-control" id="user_password_again"
                                 placeholder="Enter password again">
	                            <!--경고문 -->
	                           <div id="pwCheckAgain"></div>
                           </div>                 
                        </div>
                      

                        <!-- 닉네임 -->
                        <div class="form-group row">
                           <div class="col-6" style="padding-right: 0">
                             	＊ nickname <input type="text" class="form-control" id="user_name"
                                 name="nickName" placeholder="Enter your name">
	                           <!--경고문 -->
	                           <div id="nickCheck"></div>
                           </div>
                        </div>
                     </div>
 
                     <!--  form 태그 내의 button 태그의 default 동작은 submit이다 -->
                     <div class="form-group row">
	                        <div class="col-4" style="padding-right: 0;">
	                           <button type="button" class="btn btn-success" id="signin-select-button" style="width:100%;" onclick="goToLogin()">Login</button>
	                        </div>
	                        <div class="col-4" style="padding-right: 0">
	                        <button type="button" class="btn btn-info" id="login-select-button" style="width:100%;" onclick="goToSignIn()"> SignIn</button>
	                      	</div>
                       		<div id="loginBtn" class="col-8" style="text-align: center;"><button id="login-button" class="btn btn-warning" > 로그인 !!</button></div>
                     </div>
                     
                  </form>
                 </div>
               </div>
            </div>
            
   </section>  
	<!-- /Registration Area -->

	<!-- Footer Area -->
	<footer>
		<div id="footer-area" class="container">
			<div class="row">
				<div class="col-sm-8">
					<p id="copyright">
						© Copyright 2019 
						<a href="#" target="_blank">Your Website Link</a>
					</p>
				</div>
				<div class="col-sm-4">
					<p id="designed">
						Theme by 이상욱 라병채 범현선 채은지
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- /Footer Area -->

	<%@ include file="include/index/index_plugin_js.jsp"%>
</body>
</body>
</html>