<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
<!-- HEAD 태그 공통 부분  -->
<%@ include file="../include/commons/head.jsp"%>
<!-- /HEAD 태그 공통 부분  -->

<script type="text/javascript">
/*
$(document).ready(function (){
	$('#light').css('display','block');
	$('#fade').css('display','block');
	$('#nextp').on('click',Spage2);
	$('#beforep').on('click',Spage1);
	$('.tem').on('mouseover',temm);
	$('.tem').on('mouseout',temm2);
	$('.tem').on('click',start);
});
*/
function Spage2() {
	$('#light').css('display','none');
	$('#light2').css('display','block');
}

function Spage1() {
	$('#light2').css('display','none');
	$('#light').css('display','block');
}

function temm(){
	$(this).css('width','330px');
	$(this).css('height','230px');
	$(this).css('opacity','1');

}

function temm2(){
	$(this).css('width','270px');
	$(this).css('height','190px');
	$(this).css('opacity','0.5');

}

function start() {
	$('#light2').css('display','none');
	$('#fade').css('display','none');
}

</script>


<style type="text/css">
.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 5001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 80);
}

.white_content {
	display: none; /* display가 none상태이므로 등장 x */
	position: absolute;
	top: 15%;
	left: 15%;
	width: 70%;
	height: 70%;
	padding: 16px;
	border: 16px solid gray;
	background-color: white;
	z-index: 5002;
	overflow: auto;
}

.tem {
	width: 260px;
	height: 190px;
	cursor: pointer;
	margin-left: 20px;
	opacity: 0.5;
	border-radius: 10px;
}
</style>

</head>
<body>
	<!-- Layer Pop -->
	<div id="light" class="white_content">
		<form style="margin-top: 30px">
			<h style="font-size: 23px;">페이지를 만들기 전에 간단한 설문조사를 진행하겠습니다.</h>
			<br> <br>
			<!-- 사이트 제작 경험 -->
			<h style="margin-left: 30px;font-size:20px;">사이트의 제작 경험은 있으신가요?</h>
			<br> <select id="mexe"
				style="margin-left: 230px; margin-top: 5px;">
				<option selected="selected">예</option>
				<option>아니오</option>
			</select><br> <br>
			<!-- 사이트 목적 -->
			<h style="margin-left: 30px;font-size:20px;">사이트의 목적은 어떻게 되나요?</h>
			<br> <select id="purp"
				style="margin-left: 230px; margin-top: 5px;">
				<option selected="selected">블로그</option>
				<option>쇼핑몰</option>
				<option>커뮤니티</option>
			</select><br> <br>
			<!-- 사이트 이름 -->
			<h style="margin-left: 30px;font-size:20px;">사이트의 이름은 무엇인가요?</h>
			<br> <input type="text" id="Stitle"
				style="margin-left: 150px; width: 600px; height: 55px; font-size: 40px; margin-top: 15px;"><br>
			<img src="resources/image/img/ar1.png"
				style="width: 80px; height: 80px; margin-left: 850px; cursor: pointer;"
				id="nextp">
		</form>
	</div>
	<div id="fade" class="black_overlay"></div>
	<!--
	<div id="light2" class="white_content">
		<form style="margin-top: 30px">
			<h style="font-size: 23px;">템플릿을 선택해 주세요.</h>
			<br> <br> <img src="resources/image/img/tem1.png" id="tem1"
				class="tem"> <img src="resources/image/img/tem2.png" id="tem2"
				class="tem"> <img src="resources/image/img/tem3.png" id="tem3"
				class="tem"><br> <img src="resources/image/img/ar2.png"
				style="width: 80px; height: 80px; margin-left: 850px; cursor: pointer;"
				id="beforep"><br>
		</form>
	</div> -->
	<!-- Layer Pop -->

	<!-- 전체 페이지 레이아웃 -->
	<div class="d-flex toggled" id="wrapper">

		<!-- 좌측 사이드 바 -->
		<%@ include file="../include/page/page_sidebar.jsp"%>
		<!-- /좌측 사이드 바 -->

		<!-- 페이지 컨텐츠 레이아웃 -->
		<div id="page-content-wrapper">

			<!-- 상단 네비게이션 바 -->
			<%@ include file="../include/page/page_navigation.jsp"%>
			<!-- /상단 네비게이션 바 -->

			<div class="container-fluid" style="padding:0px;">
				<!-- 유저별 페이지 정보 상이, vh는 view-port height를 의미하는 단위로 사용자가 보는 스크린을 100 기준으로 재는 단위이다. vw도 존재한다. -->
				<div id="top" style="position:absolute; left:800px; top:110px; display:none;"></div>
				<iframe id="iframe" src="editpage" name="" style="width:100%; height: 100vh; boarder:none;">iframe이 지원되지 않는 브라우저;</iframe>
				<div id='bottom'></div>
			</div>
			<!-- /컨텐츠 레이아웃 -->
			<!-- iframe사용해서 템플릿 코드를 불러오도록 -->

			<!-- 하단 네비게이션 바 -->
			<!--<include file="../include/page/page_footer.jsp"%>  -->
			<!-- /하단 네비게이션 바 -->
		</div>
		<!-- /페이지 컨텐츠 레이아웃 -->
	</div>
	<!-- /전체 페이지 레이아웃 -->


	<%@ include file="../include/page/page_plugin_js.jsp"%>

	<script>
		// 전역 스코프에 있는 변수의 선언문은 자신이 속한 자바스크립트 파일의 최상단으로, 함수 스코프에 있는 변수의 선언문은 함수 스코프의 최상단으로 끌어올려진다.
		// 주의해야 할 점은 선언문만 끌어올려지고, 할당문은 그대로 있는 것이다. 때문에 첫 번째 aa에 접근할 때는 aa가 아직 초기화되지 않았으므로 undefined이 출력된다.
		/* iframe을 담을 변수.*/

		// jQuery 객체의 가장 중요한 특성은 암시적인 반복을 수행한다는 것이다. DOM과 다르게 jQuery 객체의 메소드를 실행하면 선택된 엘리먼트 전체에 대해서 동시에 작업이 처리된다.
		// 암시적 반복은 값을 설정할 때만 동작한다. 값을 가져올 때는 선택된 엘리먼트 중 첫번째에 대한 값만을 반환한다. 이에 대한 내용은 아래에서 살펴본다.

		/*

		var iframe = document.getElementById('editpage');
		var iframedoc = iframe.contentWindow.document;
		 */

		// $('#iframe').contents().find('#mainNav').html();
	</script>
</body>
</html>
