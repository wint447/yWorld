<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
	<!-- HEAD 태그 공통 부분  -->
	<%@ include file="include/commons/head.jsp"%>
	<!-- /HEAD 태그 공통 부분  -->
</head>

<body>
	<!-- Header Area -->
	<header class="header">
		<div class="container">
			<div id="header-logo" class="text-center">
				<span id="big-headline" class="text-white">PAGE</span>
				<img class="border border-white" src="resources/image/index/people.png">
					<span id="sub-headline" class="text-white">우리가 만드는 우리들의 페이지</span>
					<a href="#" onclick="move_scroll('registration')">START!</a>
			</div>
		</div>
	</header>
	<!-- /Header Area -->

	<!-- Navigation Area -->
	<nav id="navigation" class="navbar navbar-dark">
		<div class="row">
			<div class="col-2 col-lg-1">
				<span id="nav-logo" class="navbar-brand">PAGE</span>
			</div>
			<div class="col-10 col-lg-4">
				<ul class="nav justify-content-end">
					<li class="nav-item">
					<a class="nav-link text-muted" href="#">맨위로</a>
					</li>
					<c:if test="${not empty login}">
						<li class="nav-item">
						<a class="nav-link text-muted" href="${path }/page">이어하기</a>
						</li>
					</c:if>
					<li class="nav-item">
					<a class="nav-link text-muted" href="#" onclick="login()">새로하기</a>
					</li>
					<li class="nav-item">
					<a class="nav-link text-muted" href="#" onclick="move_scroll('registration')">회원가입</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- /Navigation Area -->

	<!-- Content Area -->
	<!-- Services Area -->
	<section id="services">
		<div id="service-area" class="container">
			<div id="service-title">
				<span class="block_title">Services</span>
			</div>
			<div class="row align-items-center">
				<div class="col-sm-6 col-md-4">
					<div id="service-wrap">
						<img src="resources/image/index/note.png">
						<h5>웹페이지 화면을 내맘대로!</h5>
							<p>취향따라 목적따라 분류하고 웹페이지의
							모든 요소를 원하는대로 수정할 수 있습니다!!!</p>
					</div>
				</div>
				<div class="col-sm-6 col-md-4">
					<div id="service-wrap">
						<img src="resources/image/index/menu.png">
						<h5>원하는 기능만 모아서 사용!</h5>
							<p>한 페이지에서 원하는 기능을
							추가하고 자유롭게 사용할 수 있습니다.</p>
					</div>
				</div>
				<div class="col-sm-6 col-md-4">
					<div id="service-wrap">
						<img src="resources/image/index/group.png">
						<h5>원하는 사람들과 자유롭게!</h5>
							<p>그리고 이 모든걸 내가 원하는 사람들과
							동시에 다같이 즐길 수 있습니다.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- /Services Area -->

	<!-- Registration Area -->
	<section id="registration">
		<div id="opacity-wrap">
			<div id="regist-area" class="container">
				<h2 class="block_title">Join Us!!!</h2>
				<div class="row">
					<div class="col-sm-6">
						<div id="regist-details">
							<h2 class="con-title">More About Page!</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Voluptatum animi repudiandae nihil aspernatur repellat
								temporibus doloremque sint ea laboriosam, excepturi iure
								inventore rerum voluptatibus, suscipit totam, sit
								necessitatibus. Rerum, blanditiis.</p>
							<ul class="address">
								<li><span>1600 Pennsylvania Ave NW,<br>
								Washington, DC 20500,<br>
								United States</span></li>
								<li><span>example@gmail.com</span></li>
								<li></i><span>+1-202-555-0144</span></li>
								<li></i><span><a href="#">www.themewagon.com</a></span></li>
							</ul>
						</div>
					</div>
					<!-- 회원가입 입력 창 -->
					<div class="col-sm-6">
						<h2 class="con-title">Drop us a line</h2>
						<form id="insert-form" role="form" action="user/register" method="post">
							<!-- 이메일 -->
							<div class="form-group">
								<div class="col-12" style="padding-right: 0; padding-left: 0;">
									<input type="email" class="form-control" id="your_email"
										name="id" placeholder="Enter your email">
								</div>
							</div>
							<!-- 비밀번호 -->
							<div class="form-group row">
   							<div class="col-6" style="padding-right: 0">
									<input type="text" class="form-control" id="user_password"
										name="password" placeholder="Enter password">
								</div>
							</div>
							<!-- 회원가입 동적 생성 -->
							<div id="change">
								<!-- 비밀번호 확인 -->
								<div class="form-group row">
									<div class="col-6" style="padding-right: 0">
										<input type="text" class="form-control" id="user_password_again"
											placeholder="Enter password again">
									</div>
								</div>

								<!-- 닉네임 -->
								<div class="form-group row">
									<div class="col-6" style="padding-right: 0">
										<input type="text" class="form-control" id="user_name"
											name="nickname" placeholder="Enter your name">
									</div>
								</div>
							</div>

							<!-- 성별, form 태그 내의 button 태그의 default 동작은 submit이다 -->
							<div class="form-group row">
								<div class="col-6" style="padding-right: 0;">
									<button type="button" id="signin-select-button" style="width:100%;" onclick="goToSignIn()">SignIn</button>
								</div>
								<div class="col-6" style="padding-right: 0">
		    					<button type="button" id="login-select-button" style="width:100%;" onclick="goToLogin()">Login</button>
		  					</div>
								<button id="login-button" class="btn btn-warning" onclick="location.href='page'">회원가입!</button>
							</div>

						</form>
					</div>
				</div>
				<div id="regist-by-sns">
					<ul id="social-links">
						<li id="normal-txt">Join with your SNS</li>
						<li id="social-icons"><a id="facebook" href="#">
							<img src="resources/image/index/facebook.png">
						</a></li>
						<li id="social-icons"><a id="twitter" href="#">
							<img src="resources/image/index/twitter.png">
						</a></li>
						<li id="social-icons"><a id="google-plus" href="#">
							<img src="resources/image/index/google-plus.png">
						</a></li>
					</ul>
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
						Theme by
						<a href="http://themewagon.com" target="_blank">Themewagon</a>
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
