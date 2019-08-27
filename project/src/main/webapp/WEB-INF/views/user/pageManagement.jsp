<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
<title>Insert title here</title>
 <!-- Custom fonts for this theme -->
  <link href="../resources/pageManagementCSS/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Theme CSS -->
  <link href="../resources/pageManagementCSS/css/freelancer.min.css" rel="stylesheet">
 
  <script  src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

<script>
 $(document).ready(function(){
	 $('#btn_private').on('click',toPrivate)
	 $('#btn_logout').on('click',toLogout)
	 
 });
 
 function toPrivate() {
	 location.href='privacyPage';
 }
 
 function toLogout() {
	 location.href='logout';
 }
 
 function toSurvey1(){
	 location.href='page';
 } 
 
 function toSurvey2(){
	 location.href='page2';
 }

 function toSurvey3(){
	 location.href='page3';
 }
</script>
<style>
/* 공백 남기기 위해서 해둠 */
html,body {
	background: beige;
	margin: 0;
	padding: 0;

}

/* header 색깔, 여백 */
.header { 
			background:#F5DA81;
			padding:35px;
			margin-top: 0;
			margin-left: 0;
			margin-right: 0;
			width:100%;
 		
 		}
/* Yellow 이름 색깔, 여백 */
#projectName {
			color:#000;
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
	
/* 페이지 추가  */
.create_page{
			float: left; 
			background: #FAFAFA; 
			margin:125px 45px 35px 35px; 
			border-radius:20px;
			box-shadow: 10px 10px 15px #A59C81;
			cursor: pointer;
			opacity: 1.5;
			}
			
.create_page:hover { opacity: 0.7; }


			
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

.btn-primary:hover,
.btn-primary:focus,
.btn-primary:active,
.btn-primary.active,
.open .dropdown-toggle.btn-primary {
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
.btn-primary:hover, .btn-primary:focus, .btn-primary:active, .btn-primary.active, .open > .dropdown-toggle.btn-primary {
    background: #33a6cc;
}
.btn-primary:active, .btn-primary.active {
    background: #33a6cc;
    box-shadow: #33a6cc;
}
</style>
</head>
<body>
<header class="header">
  <div class="row">
      <div class="col-sm-6" id="header_Menu_button1">
        <h1> YELLOW WORLD </h1>
      </div>
      <div class="col-sm-6" id="header_Menu_button2"> 
        <button type="button" class="btn btn-primary btn-lg raised" id="btn_private"> 개인정보수정 </button>
        <button type="button" class="btn btn-primary btn-lg raised" id="btn_credit"> 결제 관리 </button>
        <button type="button" class="btn btn-primary btn-lg raised" id="btn_QNA"> Q & A </button>
        <button type="button" class="btn btn-primary btn-lg raised" id="btn_logout"> 로그아웃 </button>
      </div>
  </div>
  </header>
<div align="center" style="width: 100%;">
  <div style="display: inline-block; ">
  	<div class="create_page" onclick="toSurvey1()"> <img alt="" src="../resources/image/plus_button1.png" style="height: 130px; width: 130px; margin:100px;"></div>
  	<div class="create_page" onclick="toSurvey2()"> <img alt="" src="../resources/image/plus_button1.png" style="height: 130px; width: 130px; margin:100px;"></div>
  	<div class="create_page" onclick="toSurvey3()"> <img alt="" src="../resources/image/plus_button1.png" style="height: 130px; width: 130px; margin:100px;"></div>
  </div>
</div>

</body>
</html>