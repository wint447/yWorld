$(document).ready(function () {

	// TODO: 회원가입 창 인풋 활성화시 투명도 제거
	/* 상단 네비게이션 스크롤 시 상단 고정 */
	var menu = $('.navbar');
	var origOffsetY = menu.offset().top;
	console.log(origOffsetY);

	/* 윈도우 전체 이벤트 바인딩 */
	$(window)

	/* 윈도우 스크롤 감지 이벤트 */
	.on('scroll', function() {

		/* 상단 네비게이션 최초 위치를 벗어나면 상단에 고정 */
		if ($(window).scrollTop() >= origOffsetY) {

			$('.navbar').addClass('navbar-wrap');

		} else {

			$('.navbar').removeClass('navbar-wrap');
		}
	})
})
function goToLogin() {
	var loginButton = "login-button";
	var signinButton = "signin-button";
	$('#change').slideUp(1000);
	$("#" + signinButton).html('로그인!');
	$("#" + signinButton).attr('id', loginButton);
	$("#insert-form").attr('action', 'user/login');
}

function goToSignIn() {
	var loginButton = "login-button";
	var signinButton = "signin-button";
	$('#change').slideDown(1000);
	$("#" + loginButton).html('회원가입!');
	$("#" + loginButton).attr('id', signinButton);
	$("#insert-form").attr('action', 'user/register')	;
}
/* 로그인 버튼 이벤트 */
function login() {

	event.preventDefault();

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
		// 모바일 환경일 경우 네비게이션 하단에 배치
		else if($(window).width() < 1440) {

			$("[class=navbar-brand]").html("LOGIN").addClass("text-warning");

			$("[id=navigation]").find("[class~=col-10]").after(
					'<div id="login-form" class="col col-lg-8">'
					+'<form role="form" action="user/loginPost"  method="post">'
						+'<div class="form-row">'
							+'<div class="col-5">'
								+'<input type="text" class="form-control" placeholder="ID"'
								+'style="margin-top: 8px" name="user_id">'
							+'</div>'
							+'<div class="col-5">'
								+'<input type="text" class="form-control" placeholder="PASSWORD"'
								+'style="margin-top: 8px" name="user_pw">'
							+'</div>'
							+'<div class="col-2">'
							+'<button type="submit" class="btn btn-warning"'
							+'style="margin-top: 8px">'
							+'GO</button>'
							+'</div>'
						+'</div>'
						+'<div class="form-row">'
							+'<div class="col" style="margin-top: 8px">'
								+'<label><input type="checkbox" name="user_cookie">'
								+'<span class="text-white"> 로그인 유지</span></label>'
							+'</div>'
						+'</div>'
					+'</form>'
				+'</div>'
			);
		}
	}
}

/* 스크롤 이동 이벤트 */
function move_scroll(to_where) {

	if(to_where=="registration") {

		$('html, body').animate({scrollTop : $("[id=registration]").offset().top-30}, 400);
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
