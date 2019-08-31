<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- contextPath값을 호출해 변수로 지정, 이 프로젝트에서의 값은 /project -->
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <meta charset="utf-8">
  <!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Grayscale - Start Bootstrap Theme</title>

  <!-- Bootstrap core CSS -->
  <link href="${path}/resources/1/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="${path}/resources/1/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${path}/resources/1/css/grayscale.min.css" rel="stylesheet">

	<!-- JQuery-UI -->
  <link rel="stylesheet" href="${path}/webjars/jquery-ui/1.12.1/jquery-ui.css">

  <!-- ckeditor -->
  <script src="${path}/resources/libs/ckeditor/ckeditor.js"></script>
</head>

<body id="page-top">
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="#page-top"><div contenteditable='false'>Start Bootstrap</div></a>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#about"><div contenteditable='false'>About</div></a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#projects"><div contenteditable='false'>Projects</div></a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#signup"><div contenteditable='false'>Contact</div></a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- Header -->
  <header class="masthead">
    <div class="container d-flex h-100 align-items-center">
      <div class="mx-auto text-center">
        <div class="ui-resizable draggable mx-auto text-white-50 my-0 text-uppercase">
          <div contenteditable='false'>Grayscale</div></div>
        <div class="ui-resizable draggable text-white-50 mx-auto mt-2 mb-5"><div contenteditable='false'>
          A sfree, responsive, one page Bootstrap theme created by Start Bootstrap.</div></div>
        <div class="ui-resizable draggable">
          <a href="#about" class="ui-resizable btn btn-primary js-scroll-trigger"><div contenteditable='false'>Get Started</div></a></div>


      </div>
    </div>
  </header>

  <!-- About Section -->
  <div id="about" class="about-section text-center">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto">
          <div class="ui-resizable draggable text-white mb-4"><div contenteditable='false'>Built with Bootstrap 4</div></div>
          <div class="ui-resizable draggable text-white-50"><div contenteditable='false'>Grayscale is a free Bootstrap theme created by Start Bootstrap. It can be yours right now, simply download the template on
            <a href="http://startbootstrap.com/template-overviews/grayscale/">the preview page</a>. The theme is open source, and you can use it for any purpose, personal or commercial.</div></div>
        </div>
      </div>
    </div>
    <img src="../resources/1/img/ipad.png" class="ui-resizable draggable" alt="">
  </div>

  <!-- Projects Section -->
  <section id="projects" class="projects-section bg-light">
    <div class="container">

      <!-- Featured Project Row -->
      <div class="row align-items-center no-gutters mb-4 mb-lg-5">
        <div class="col-xl-8 col-lg-7">
          <img class="ui-resizable draggable img-fluid mb-3 mb-lg-0" src="img/bg-masthead.jpg" alt="">
        </div>
        <div class="col-xl-4 col-lg-5">
          <div class="featured-text text-center text-lg-left">
            <div class="ui-resizable draggable"><div contenteditable='false'>Shoreline</div></div>
            <div class="ui-resizable draggable text-black-50 mb-0"><div contenteditable='false'>Grayscale is open source and MIT licensed. This means you can use it for any project - even commercial projects! Download it, customize it, and publish your website!</div></div>
          </div>
        </div>
      </div>

      <!-- Project One Row -->
      <div class="row justify-content-center no-gutters mb-5 mb-lg-0">
        <div class="col-lg-6">
          <img class="ui-resizable draggable img-fluid" src="img/demo-image-01.jpg" alt="">
        </div>
        <div class="col-lg-6">
          <div class="ui-resizable draggable bg-black text-center h-100 project">
            <div class="d-flex h-100">
              <div class="project-text w-100 my-auto text-center text-lg-left">
                <div class="ui-resizable draggable text-white"><div contenteditable='false'>Misty</div></div>
                <div class="ui-resizable draggable mb-0 text-white-50"><div contenteditable='false'>An example of where you can put an image of a project, or anything else, along with a description.</div></div>
                <hr class="ui-resizable draggable d-none d-lg-block mb-0 ml-0">
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Project Two Row -->
      <div class="row justify-content-center no-gutters">
        <div class="col-lg-6">
          <img class="ui-resizable draggable img-fluid" src="img/demo-image-02.jpg" alt="">
        </div>
        <div class="col-lg-6 order-lg-first">
          <div class="ui-resizable draggable bg-black text-center h-100 project">
            <div class="d-flex h-100">
              <div class="project-text w-100 my-auto text-center text-lg-right">
                <div class="ui-resizable draggable text-white"><div contenteditable='false'>Mountains</div></div>
                <div class="ui-resizable draggable mb-0 text-white-50"><div contenteditable='false'>Another example of a project with its respective description. These sections work well responsively as well, try this theme on a small screen!</div></div>
                <hr class="ui-resizable draggable d-none d-lg-block mb-0 mr-0">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Signup Section -->
  <section id="signup" class="signup-section">
    <div class="container">
      <div class="row">
        <div class="col-xs-10 col-lg-8 mx-auto text-center">

          <i class="ui-resizable draggable far fa-paper-plane fa-2x mb-2 text-white"></i>
          <div class="ui-resizable draggable text-white mb-5"><div contenteditable='false'>Subscribe to receive updates!</div></div>

          <form class="ui-resizable draggable form-inline d-flex">
            <div class="ui-resizable draggable"><div contenteditable='false'><input type="email" class="form-control flex-fill mr-0 mr-sm-2 mb-3 mb-sm-0" id="inputEmail" placeholder="Enter email address..."></div></div>
            <div class="ui-resizable draggable"><div contenteditable='false'><button type="submit" class="ui-resizable draggable btn btn-primary mx-auto" contenteditable='false'>Subscribe</button></div></div>
          </form>
        </div>
      </div>
    </div>
  </section>

  <!-- Contact Section -->
  <section class="contact-section bg-black">
    <div class="container">

      <div class="ui-resizable draggable row">

        <div class="ui-resizable draggable col-xs-4 mb-3 mb-md-0">
          <div class="ui-resizable draggable card py-4 h-100">
            <div class="ui-resizable draggable card-body text-center">
              <i class="ui-resizable draggable fas fa-map-marked-alt text-primary mb-2"></i>
              <h4 class="ui-resizable draggable text-uppercase m-0" contenteditable='false'>Address</h4>
              <hr class="ui-resizable draggable my-4">
              <div class="ui-resizable draggable small text-black-50" contenteditable='false'>4923 Market Street, Orlando FL</div>
            </div>
          </div>
        </div>

        <div class="ui-resizable draggable col-xs-4 mb-3 mb-md-0">
          <div class="ui-resizable draggable card py-4 h-100">
            <div class="ui-resizable draggable card-body text-center">
              <i class="ui-resizable draggable fas fa-envelope text-primary mb-2"></i>
              <div contenteditable='false'><h4 class="ui-resizable draggable text-uppercase m-0">Email</h4></div>
              <hr class="ui-resizable draggable my-4">
              <div class="ui-resizable draggable small text-black-50">
                <div contenteditable='false'><a href="#">hello@yourdomain.com</a></div>
              </div>
            </div>
          </div>
        </div>

        <div class="ui-resizable draggable col-xs-4 mb-3 mb-md-0">
          <div class="ui-resizable draggable card py-4 h-100">
            <div class="ui-resizable draggable card-body text-center">
              <i class="ui-resizable draggable fas fa-mobile-alt text-primary mb-2"></i>
              <div contenteditable='false'><h4 class="ui-resizable draggable text-uppercase m-0">Phone</h4></div>
              <hr class="ui-resizable draggable my-4">
              <div contenteditable='false'><div class="ui-resizable draggable small text-black-50">+1 (555) 902-8832</div></div>
            </div>
          </div>
        </div>
      </div>

      <div class="ui-resizable draggable social d-flex justify-content-center">
        <a href="#" class="ui-resizable draggable mx-2">
          <i class="ui-resizable draggable fab fa-twitter"></i>
        </a>
        <a href="#" class="ui-resizable draggable mx-2">
          <i class="ui-resizable draggable fab fa-facebook-f"></i>
        </a>
        <a href="#" class="ui-resizable draggable mx-2">
          <i class="ui-resizable draggable fab fa-github"></i>
        </a>
      </div>

    </div>
  </section>

  <!-- Footer -->
  <footer class="ui-resizable draggable bg-black small text-center text-white-50">
    <div contenteditable='false'><div class="ui-resizable draggable container">
      Copyright &copy; Your Website 2019
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="${path}/resources/1/vendor/jquery/jquery.min.js"></script>
  <script src="${path}/resources/1/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${path}/webjars/jquery-ui/1.12.1/jquery-ui.js"></script>

  <!-- Plugin JavaScript -->
  <script src="${path}/resources/1/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="${path}/resources/1/js/grayscale.min.js"></script>

</body>

</html>
