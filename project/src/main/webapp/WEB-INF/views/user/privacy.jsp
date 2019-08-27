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

<title>privacy</title>
<!-- Custom fonts for this theme -->
<link
	href="../resources/pageManagementCSS/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Theme CSS -->
<link href="../resources/pageManagementCSS/css/freelancer.min.css"
	rel="stylesheet">
<!-- script --------------------------------------------------------------------------------------------->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

<script>
	$(document).ready(function() {

		$('#btn_privacy').on('click', toPrivate); // 자기관리창으로 이동
		$('#btn_pageManagement').on('click', toPagemanageMent); // pageManagement로 이동
		$('#user_nickName').on('keyup', nickName_CK); // 닉네임 중복 체크
		$('#user_newPassword').on('keyup', newPassword_CK); // 새로운 비밀번호 사용 가능 체크
		$('#user_newPassword_again').on('keyup', newPassword_again_CK); // 새로운 비밀번호 한번 더 체크
	});
	
	/************ 이동 부분 ****************/
	function toPrivate() {
		location.href = 'privacyPage';
	}
	function toPagemanageMent() {
		location.href = 'pageManagement';
	}
	/************************************/
	
	
	function nickName_CK() {
		var nickName = $('#user_nickName').val();
		
		/* 아무것도 쓰지 않았거나, 현재 쓰는 닉네임과 동일하면 오류 사라짐  */
		if (nickName.length == 0 || nickName == '${loginID.nickName}') {
			$('#user_nicknameCk').fadeOut(500);
			return;
		}
		
		/* 닉네임 쓰면 AJAX로 체크  */
		$.ajax({
			url : '/project/user/privacyNickNameCk',
			type : 'POST',
			data : {nickName : nickName},
			dataType : 'text',
			success : function(nickName) {
				successNickName(nickName);
			},
			error : function(e) {
				alert('오류');
			}
		});
	}

	/* 닉네임 사용 여부  */
	function successNickName(nickName) {
		
		$('#user_nicknameCk').fadeIn(500);
		
		/* 닉네임 사용 불가능한 경우  */
		if (nickName == "false") {
			$('#user_nicknameCk').html('※ 이미 사용중인 닉네임입니다.');
			$('#user_nicknameCk').css('color', 'red');
		} 
		
		/* 닉네임 사용할 수 있는 경우  */
		if(nickName == "true")
		{
			$('#user_nicknameCk').html('사용가능한 닉네임입니다.');
			$('#user_nicknameCk').css('color', 'green');
		}
	}

	/* 비밀번호 사용 가능 여부 체크  */
	function newPassword_CK() {
		var newPassword = $('#user_newPassword').val();
		var password = $('#user_password').val();
		var regExp = /^.*(?=^.{8,16}$)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

		if (newPassword == '') {
			$('#user_newPasswordCk').fadeOut(500);
			return;
		}
		
		$('#user_newPasswordCk').fadeIn(500);
		if (newPassword.match(regExp)) {
			$('#user_newPasswordCk').html('사용가능한 password 입니다.');
			$('#user_newPasswordCk').css('color', 'green');
		}

		else {
			$('#user_newPasswordCk').html('※ 8~16자 사이로 입력 / 영문 &특수문자를 포함해야 합니다');
			$('#user_newPasswordCk').css('color', 'red');
		}
	
	}
	
	/* 새비밀번호 한번 더 체크  */
	function newPassword_again_CK(){
		var newPassword = $('#user_newPassword').val();
		var newPasswordAgain = $('#user_newPassword_again').val();

		if (newPasswordAgain == '') {
			$('#user_newPassword_againCk').fadeOut(500);
			return;
		}
		
		$('#user_newPassword_againCk').fadeIn(500);
		if(newPassword == newPasswordAgain){
			$('#user_newPassword_againCk').html('password가 일치합니다.');
			$('#user_newPassword_againCk').css('color', 'green');
		}
		
		if(newPassword != newPasswordAgain){
			$('#user_newPassword_againCk').html('※ password가 일치하지않습니다.');
			$('#user_newPassword_againCk').css('color', 'red');
		}	
	}
	
	/* privacy 수정 폼 전송  */
	function privacyUpdate() {
		var id =  $('#user_id').val();
		var nickName = $('#user_nickName').val();
		var password = $('#user_password').val();
		var newPassword = $('#user_newPassword').val();
		var newPasswordAgain = $('#user_newPassword_again').val();
		var rtrs = true;	//return 값 
		
		if(nickName == ''){
			alert('닉네임을 입력해주세요.');
			$('#user_nickName').focus();
			return false;
		}
		
		if(password == ''){
			alert('현재 비밀번호를 입력해주세요.');
			$('#user_password').focus();
			return false;
		}
		
		if(newPassword == ''){
			alert('새로운 비밀번호를 입력해주세요.');
			$('#user_newPassword').focus();
			return false;
		}
		
		if(newPasswordAgain == ''){
			alert('새로운 비밀번호를 한번 더 입력해주세요.');
			$('#user_newPassword_again').focus();
			return false;
		}
		
		$.ajax({
			url:'/project/user/privacyPassword'
		,	type:'POST'
		,	data:{id:id,password:password}
		,	async:false // async - Ajax로 들어왔을때 다음으로 넘어가지 않음 (동시실행 불가)
		,	dataType:'text'
		,	success:function(update){
					if(update == 'false'){
						alert('현재 비밀번호가 일치하지 않습니다.');
						$('#user_password').focus();
						rtrs = false; //return 값을 false로 바꿔줌
					}
			}
		,	error:function(error){
				alert('오류');
			}
		});
		return rtrs;	//return값이 원래 true이므로 다음 페이지로 넘어 갈 수 있도록 함
		alert('들어오면 안되는 곳');
	}
</script>
<!-- style --------------------------------------------------------------------------------------------->
<style>
/* 공백 남기기 위해서 해둠 */
html, body {
	background: beige;
	margin: 0;
	padding: 0;
	width: 100%;
}

/* header 색깔, 여백 */
.header {
	background: #F5DA81;
	padding: 35px;
	margin-top: 0;
	margin-left: 0;
	margin-right: 0;
	margin-bottom: 50px;
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

/* 폼 위치 */
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
	margin-top: 35px;
}

#updateBtn {
	margin-top: 10px;
	position: relative;
	transform: translateX(1%);
}
</style>
<!-- body ---------------------------------------------------------------------------------------------->
<body>
	<header class="header">
	<div class="row">
		<div class="col-sm-6" id="header_Menu_button1">
			<h1>YELLOW WORLD</h1>
		</div>
		<div class="col-sm-6" id="header_Menu_button2">
			<button type="button" class="btn btn-primary btn-lg raised"
				id="btn_privacy">개인정보수정</button>
			<button type="button" class="btn btn-primary btn-lg raised"
				id="btn_credit">결제 관리</button>
			<button type="button" class="btn btn-primary btn-lg raised"
				id="btn_QNA">Q & A</button>
			<button type="button" class="btn btn-primary btn-lg raised"
				id="btn_pageManagement" style="width:125px;">홈으로</button>
		</div>
	</div>
	</header>

	<section id="privatePage">
	<div id="private-area">
			<!-- 개인정보 수정 창 -->
			<div class="col-sm-6" style="margin-left: 550px;">
				<form id="update-form" role="form" action="/project/user/privacyCommit"
					method="post" onsubmit="return privacyUpdate()" style="border-color: black;">

					<!-- 이메일 -->
					<div class="form-group row" style="margin-bottom: 8px;">
						<div class="col-6" style="font-weight: bold;">
							<div>
								＊아이디 
								<input type="text" class="form-control" id="user_id"
									   name="id" style="width: 400px; height: 50px;"
									   value="${sessionScope.loginID.id }" readonly="readonly">
							</div>
						</div>
					</div>

					<!-- 닉네임 -->
					<div class="form-group row" style="margin-bottom: 8px;">
						<div class="col-6" style="font-weight: bold;">
							<div>
								＊ 닉네임 변경 
								<input type="text" class="form-control"
									   id="user_nickName" name="nickName"
									   style="width: 400px; height: 50px;"
									   value="${sessionScope.loginID.nickName }" autocomplete="off" >
							</div>
						</div>
					</div>
					<div id="user_nicknameCk"></div>

					<!-- 현재 비밀번호 -->
					<div class="form-group row" style="margin-bottom: 8px;">
						<div class="col-6" style="font-weight: bold;">
							＊ 현재 비밀번호 
							<input type="password" class="form-control"
								   id="user_password" style="width: 400px; height: 50px;"
								   placeholder="Enter password">
						</div>
						<div id="user_passwordCk"></div>
					</div>

					<!-- 새로운 비밀번호 -->
					<div class="form-group row" style="margin-bottom: 8px;">
						<div class="col-6" style="font-weight: bold;">
							<div>
								＊ 새로운 비밀번호 
							<input type="password" class="form-control"
									id="user_newPassword" name="password"
									style="width: 400px; height: 50px;"
									placeholder="Enter password again">
							</div>
						</div>
					</div>
					<div id="user_newPasswordCk"></div>

					<!-- 새로운 비밀번호 확인 -->
					<div class="form-group row" style="margin-bottom: 8px;">
						<div class="col-6" style="font-weight: bold;">
							＊ 새로운 비밀번호 체크<input type="password" class="form-control"
								id="user_newPassword_again" style="width: 400px; height: 50px;"
								placeholder="Enter password again">
						</div>
					</div>
					<div id="user_newPassword_againCk"></div>

					<div class="form-group row">
						<div id="updateBtn" class="col-6" style="text-align: center;">
							 <input type="submit" class="btn btn-warning" value="수정하기 ➔"> 
						</div>
					</div>
				</form>
			</div>
		</div>

	</section>

</body>
</html>