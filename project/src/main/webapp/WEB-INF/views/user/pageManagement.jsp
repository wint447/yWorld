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
  <link href="./resources/pageManagementCSS/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Theme CSS -->
  <link href="./resources/pageManagementCSS/css/freelancer.min.css" rel="stylesheet">
 
  <script  src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

<script>
 $(document).ready(function(){
	 $('#btn_private').on('click',toPrivate)
 });
 
 function toPrivate() {
	 location.href='toPrivate';
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
        <button type="button" class="btn btn-primary btn-lg raised" id="logout"> 로그아웃 </button>
      </div>
  </div>
  </header>

<!-- Portfolio Section -->
  <section class="page-section portfolio" id="portfolio">
    <div class="container">

      <!-- Portfolio Section Heading -->
      <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">PAGE MANAGEMENT</h2>

      <!-- Icon Divider -->
      <div class="divider-custom">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon">
          <i class="fas fa-star"></i>
        </div>
        <div class="divider-custom-line"></div>
      </div>

      <!-- Portfolio Grid Items -->
      <div class="row">

        <!-- Portfolio Item 1 -->
        <div class="col-md-6 col-lg-4">
          <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal1">
            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
              <div class="portfolio-item-caption-content text-center text-white">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="./resources/pageManagementCSS//img/portfolio/cabin.png" alt="">
          </div>
        </div>

        <!-- Portfolio Item 2 -->
        <div class="col-md-6 col-lg-4">
          <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal2">
            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
              <div class="portfolio-item-caption-content text-center text-white">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="./resources/pageManagementCSS//img/portfolio/cake.png" alt="">
          </div>
        </div>

        <!-- Portfolio Item 3 -->
        <div class="col-md-6 col-lg-4">
          <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal3">
            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
              <div class="portfolio-item-caption-content text-center text-white">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="./resources/pageManagementCSS//img/portfolio/circus.png" alt="">
          </div>
        </div>
      <!-- /.row -->

    </div>
  </section>
 
 
   <!-- Bootstrap core JavaScript -->
  <script src="./resources/pageManagementCSS/vendor/jquery/jquery.min.js"></script>
  <script src="./resources/pageManagementCSS/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="./resources/pageManagementCSS/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact Form JavaScript -->
  <script src="./resources/pageManagementCSS/js/jqBootstrapValidation.js"></script>
  <script src="./resources/pageManagementCSS/js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="./resources/pageManagementCSS/js/freelancer.min.js"></script>
</body>
</html>