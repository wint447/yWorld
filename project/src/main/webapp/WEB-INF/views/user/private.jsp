<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Insert title here</title>
<!-- Custom fonts for this theme -->
<link
	href="./resources/pageManagementCSS/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Theme CSS -->
<link href="./resources/pageManagementCSS/css/freelancer.min.css"
	rel="stylesheet">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

<script>
	$(document).ready(function() {
		$('#btn_private').on('click', toPrivate);
		$('#btn_pageManagement').on('click', toPagemanageMent);
	});

	function toPrivate() {
		location.href = 'toPrivate';
	}

	function toPagemanageMent() {
		location.href = 'pageManagement';
	}
</script>
<style>
/* 공백 남기기 위해서 해둠 */
html, body {
	background: beige; margin : 0;
	padding: 0;
	margin: 0;
}

/* header 색깔, 여백 */
.header {
	background: #F5DA81;
	padding: 35px;
	margin-top: 0;
	margin-left: 0;
	margin-right: 0;
	width: 100%;
}
/* Yellow 이름 색깔, 여백 */
#projectName {
	color: #000;
	margin-left: 40px;
}

/* 메인 메뉴 버튼 (개인정보, 결제, QnA 위치) */
#header_Menu_button1 {
	position: relative;
	transform: translateX(10%);
}

#header_Menu_button2 {
	float: right;
}

/**************************
  DEFAULT BOOTSTRAP STYLES
**************************/
.btn {
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 0;
	font-size: 14px;
	font-weight: normal;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-image: none;
	border: 1px solid transparent;
	border-radius: 4px;
	padding: 10px 16px;
}

.btn-lg {
	font-size: 18px;
	line-height: 1.33;
	border-radius: 6px;
}

.btn-primary {
	color: #fff;
	background-color: #428bca;
	border-color: #357ebd;
}

.btn-primary:hover, .btn-primary:focus, .btn-primary:active,
	.btn-primary.active, .open .dropdown-toggle.btn-primary {
	color: #fff;
	background-color: #3276b1;
	border-color: #285e8e;
}

/***********************
  CUSTON BTN VALUES
************************/
.btn {
	padding: 14px 24px;
	margin-left: 20px;
	border: 0 none;
	font-weight: 700;
	letter-spacing: 1px;
	text-transform: uppercase;
}

.btn:focus, .btn:active:focus, .btn.active:focus {
	outline: 0 none;
}

.btn-primary {
	background: #FE2E64;
	color: #FFF;
}

.btn-primary:hover, .btn-primary:focus, .btn-primary:active,
	.btn-primary.active, .open>.dropdown-toggle.btn-primary {
	background: #33a6cc;
}

.btn-primary:active, .btn-primary.active {
	background: #33a6cc;
	box-shadow: #33a6cc;
}

/* 개인정보 수정 관련  */
	#private-area {
		margin-top:90px;
		position: relative;
		transform: translateX(35%);
	}
	#updateBtn{
		margin-top: 10px;    
	}
</style>
<body>
	<header class="header">
	<div class="row">
		<div class="col-sm-6" id="header_Menu_button1">
			<h1>YELLOW WORLD</h1>
		</div>
		<div class="col-sm-6" id="header_Menu_button2">
			<button type="button" class="btn btn-primary btn-lg raised"
				id="btn_private">개인정보수정</button>
			<button type="button" class="btn btn-primary btn-lg raised"
				id="btn_credit">결제 관리</button>
			<button type="button" class="btn btn-primary btn-lg raised"
				id="btn_QNA">Q & A</button>
			<button type="button" class="btn btn-primary btn-lg raised"
				id="btn_pageManagement">홈으로</button>
		</div>
	</div>
	</header>

	<section id="privatePage">
	<div id="private-area" class="container">
		<div class="row">
			<!-- 개인정보 수정 창 -->
			<div class="col-sm-6">
				<form id="update-form" role="form" action="user/private"
					method="post" style="border-color:black;">

					<!-- 닉네임 -->
					<div class="form-group row">
						<div class="col-6">
							＊ nickname <input type="text" class="form-control"
								id="user_nickname" name="nickname" placeholder="Enter your name">
						</div>
					</div>

					<!-- 비밀번호 -->
					<div class="form-group row">
						<div class="col-6">
							＊ 현재 비밀번호 <input type="password" class="form-control"
								id="user_password" name="password" placeholder="Enter password">
						</div>
					</div>

					<!-- 새로운 비밀번호 -->
					<div class="form-group row">
						<div class="col-6">
							＊ 새로운 비밀번호 <input type="password" class="form-control"
								id="user_password_again" placeholder="Enter password again">
						</div>
					</div>

					<!-- 새로운 비밀번호 확인 -->
					<div class="form-group row">
						<div class="col-6">
							＊ 새로운 비밀번호 체크<input type="password" class="form-control"
								id="user_password_again_check"
								placeholder="Enter password again">
						</div>
					</div>

					<div class="form-group row">
						<div id="updateBtn" class="col-6" style="text-align: center;">
							<button id="update-button" class="btn btn-warning"
								onclick="private_Update">수정하기</button>
						</div>
				 	</div>
				</form>
			</div>
		</div>
	</div>
	</section>

</body>
</html>