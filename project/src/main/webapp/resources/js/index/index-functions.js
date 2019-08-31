$(document).ready(function () {
	checking();//형식 확인
	$('#your_email').on('keyup',idCheck); //id형식&중복확인
	$('#user_password').on('keyup',pwCheck);//pw형식확인
	$('#user_password_again').on('keyup',pwAgain);//PW일치하는지
	$('#user_name').on('keyup',nameCheck);//닉네임 중복확인
	$('#signin-select-button').trigger('click');
})//ready();

//------------<로그인시 공백확인>------------------------------------------

function LoginBlankCheck(){
	var id = document.getElementById('your_email');
	var password = document.getElementById('user_password');

	if(id.value == ''){
		alert('반드시 이메일을 입력해주세요.');
		return false;
	}

	if(password.value == ''){
		alert('반드시 비밀번호를 입력해주세요')
		return false;
	}

		return true;
}



//------------<회원가입시 공백확인>------------------------------------------
function blankCheck(){
	var id = document.getElementById('your_email');
	var password = document.getElementById('user_password');
	var passwordAgain = document.getElementById('user_password_again');
	var nickName = document.getElementById('user_name');

	if(id.value == ''){
		alert('반드시 이메일을 입력해주세요.');
		return false;
	}

	if(password.value == ''){
		alert('반드시 비밀번호를 입력해주세요')
		return false;
	}

	if(passwordAgain.value == ''){
		alert('반드시 확인 비밀번호를 입력해주세요')
		return false;
	}
	if(nickName.value == ''){
		alert('반드시 닉네임을 입력해주세요')
		return false;
	}
		return true;
}


//------------<형식 확인>-----------------------------
function checking(){
	$('#idCheck').hide(0);//email
	$('#idCheck').css('transition', '0.3s');
	$('#pwCheck').hide(0);//password
	$('#pwCheck').css('transition', '0.3s');
	$('#pwCheckAgain').hide(0);//passwordAgain
	$('#pwCheckAgain').css('transition', '0.3s');
	$('#nickCheck').hide(0);//nickCheck
	$('#nickCheck').css('transition', '0.3s');

}


//-------<닉네임 중복 확인>----------------
function nameCheck(){

	var name = $('#user_name').val();

	if(name.length==0){
		$('#nickCheck').fadeOut(500);
		return;
	}
		$('#nickCheck').fadeIn(500);

	if (name.length >= 1) {
		$.ajax({
			url:'user/nameCheck',
			type:'post',
			data: {searchName:name},
			dataType:'text',
			success: function(s){

				if(s == 'true'){
					$('#nickCheck').html('사용가능한 닉네임 입니다');
					$('#nickCheck').css('color', 'green');
				}
				if(s == 'false'){
					$('#nickCheck').html('이미 사용중인  닉네임 입니다');
					$('#nickCheck').css('color', 'red');
				}

			},
			error: function(e){
			}
		});
	}
};


//------------<아이디 형식&중복 확인>----------------------------------------
function idCheck(){

		var email =$('#your_email').val();
		var regExp= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

		if(email.length==0){
			$('#idCheck').fadeOut(500);
			return;
		}
			$('#idCheck').fadeIn(500);

		if(email.match(regExp)){

			if (email.length >= 3 ) {
				$.ajax({
					url:'user/idCheck',
					type:'post',
					data: {searchID:email},
					dataType:'text',
					success: function(s){

						if(s == 'true'){
							$('#idCheck').html('사용가능한 email 입니다');
							$('#idCheck').css('color', 'green');
						}
						if(s == 'false'){
							$('#idCheck').html('이미 사용중인  email 입니다');
							$('#idCheck').css('color', 'red');
						}

					},
					error: function(e){

					}
				});

			};
		}else{
			$('#idCheck').html('올바르지 않은  email 형식 입니다');
			$('#idCheck').css('color', 'red');
		}
};

//-------------------<비밀번호 형식 확인>----------------------------------------
function pwCheck(){
	var password =$('#user_password').val();
	var regExp=/^.*(?=^.{8,16}$)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	if(password.length==0){
		$('#pwCheck').fadeOut(500);
		return;
	}
	$('#pwCheck').fadeIn(500);
	if (password.match(regExp)) {
		$('#pwCheck').html('사용가능한 password 입니다');
		$('#pwCheck').css('color', 'green');
	}
	else {
		$('#pwCheck').html('8~16자 사이,영문 &특수문자를 포함해야 합니다');
		$('#pwCheck').css('color', 'red');
	}
}



//-----------------<비밀번호 두번 확인!!>----------------------------------
function pwAgain(){
	var password = $('#user_password').val();
	var passwordAgain = $('#user_password_again').val();

	if(passwordAgain.length==0){
		$('#pwCheckAgain').fadeOut(500);
		return;
	}
		$('#pwCheckAgain').fadeIn(500);


	if (password == passwordAgain) {
		$('#pwCheckAgain').html('일치합니다');
		$('#pwCheckAgain').css('color', 'green');
	}else {
		$('#pwCheckAgain').html('일치하지않습니다');
		$('#pwCheckAgain').css('color', 'red');
	}
}


//--------<로그인 버튼시>-------------------------------
function goToLogin() {
	var loginButton = "login-button";
	var signinButton = "signin-button";
	$('#change').slideUp(1000);
	$("#" + loginButton).html('로그인!');
	$("#" + loginButton).attr('id', loginButton);
	$("#insert-form").attr('action','user/login');
	$('#idCheck').html('');//회원가입이였다가 로그인으로 올때 경고문 사라지게
	$('#pwCheck').html('');// 위와동일
	$('#pwCheck').attr('id', 'pwCheck1'); //제약조건 안받게 id변경
	$('#idCheck').attr('id', 'idCheck1'); //제약조건 안받게 id변경
	$('#insert-form').attr('onsubmit','return LoginBlankCheck()');//로그인시 공백확인
}



//----------<회원가입 버튼시>------------------------------
function goToSignIn() {
	var loginButton = "login-button";
	//var signinButton = "signin-button";
	$('#change').slideDown(1000);
	$("#" + loginButton).html('회원가입!');
	//$("#" + loginButton).attr('id', signinButton);
	$("#insert-form").attr('action','user/register');
	$('#pwCheck1').attr('id', 'pwCheck');//제약조건 받게 id이름 변경
	$('#idCheck1').attr('id', 'idCheck');//제약조건 받게 id이름 변경
	$('#insert-form').attr('onsubmit','return blankCheck()');//회원가입시 공백확인
}



/* 로그인 버튼 이벤트 */
/*function login() {

	event.preventDefault();
n
	// 이미 로그인 창이 실행 중인 경우
	if($("[id=navigation]").find("[class*=col]").length>2) {

		if($("[id=nav-logo]").hasClass("text-warning")) {
			$("[id=nav-logo]").html("PAGE").removeClass("text-warning");
		}
		$("[id=navigation]").find("[id=login-form]").remove();
	}
	// 로그인 창 띄우기
	else {

		// 데스크톱 환경일 경우 네비게이션 바 중앙에 배치
		if($(window).width() >= 1440) {

			$("[id=navigation]").find("[class~=col-10]").before(
					'<div id="login-form" class="col col-lg-7">'
					+'<form role="form" action="user/loginPost"  method="post">'
						+'<div class="form-row">'
							+'<div class="col-2">'
								+'<span class="navbar-brand text-warning">LOGIN</span>'
							+'</div>'
							+'<div class="col-3" style="min-width: 29%;">'
								+'<input type="text" class="form-control" placeholder="ID"'
								+'style="margin-top: 14px" name="user_id">'
							+'</div>'
							+'<div class="col-3" style="min-width: 29%;">'
								+'<input type="text" class="form-control" placeholder="PASSWORD"'
								+'style="margin-top: 14px" name="user_pw">'
							+'</div>'
							+'<div class="col-1">'
							+'<button type="submit" class="btn btn-warning"'
							+'style="margin-top: 14px">'
							+'GO!</button>'
							+'</div>'
							+'<div class="col-2">'
								+'<label style="margin-top: 20px;"><input type="checkbox" name="user_cookie">'
								+'<span class="text-white"> 로그인 유지</span></label>'
							+'</div>'
						+'</div>'
					+'</form>'
				+'</div>'
			);
		}

	}
}
*/
/* 스크롤 이동 이벤트 */
function move_scroll(to_where) {

	if(to_where=="loginPage") {

		$('html, body').animate({scrollTop : $("[id=loginPage]").offset().top-30}, 400);
	}
}
/* 스크롤 이동 이벤트 */

/*
$("#start-button").on('click', function(event) {
		// Make sure this.hash has a value before overriding default behavior
		alert(this.hash);

		if (this.hash != "") { // 해당 태그의 href의 값을 string 형식으로 반환해줌. 여기에서는 #registration
		  // Prevent default anchor click behavior
		  event.preventDefault();

			// Store hash
		  var hash = this.hash;

			alert($(hash).offset().top);
		  // Using jQuery's animate() method to add smooth page scroll
		  // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
		  $('html, body').animate({

		    scrollTop: $(hash).offset().top // 1593.0374755859375, top 위치
		  }, 800, function(){
	    	// Add hash (#) to URL when done scrolling (default click behavior)
		    window.location.hash = hash; // 이동할 위치
		 		});
			} // End if
		});

*/
