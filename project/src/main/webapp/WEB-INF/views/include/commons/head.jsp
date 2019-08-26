<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- contextPath값을 호출해 변수로 지정, 이 프로젝트에서의 값은 /project -->
<c:set var="path" value="${pageContext.request.contextPath}"/>

<head>
	<meta charset="utf-8">

	<!-- HTML5에서 소개된 뷰포트 <meta> 태그를 사용하면 모바일 기기에서 실제 렌더링되는 영역과 뷰포트의 크기를 조절할 수 있습니다.
	또한 줌 레벨도 조정할 수 있습니다. 아래는 가장 일반적으로 사용되는 설정 입니다.

	width=device-width : 페이지의 너비를 기기의 스크린 너비로 설정합니다. 즉, 렌더링 영역을 기기의 뷰포트의 크기와 같게 만들어 줍니다.
	initial-scale=1.0 : 처음 페이지 로딩시 확대/축소가 되지 않은 원래 크기를 사용하도록 합니다. 0~10 사이의 값을 가집니다.
	shirnk-to-fit : 사파리 브라우저에만 영향을 미치는 속성 같습니다. 그 중에서도 사파리 11 이전의 버전과 관련된 것 같습니다.
	사파리는 기본적으로 viewport의 크기보다 보여줘야할 내용이 크면, 보여줘야할 내용을 줄여서라 보여준다고 하네요.
	그것을 방지하기 위해 이 코드를 쓴다고 합니다.

	이름공간 또는 네임스페이스(Namespace)는 개체를 구분할 수 있는 범위를 나타내는 말로 일반적으로 하나의 이름 공간에서는 하나의 이름이 단 하나의 개체만을 가리키게 된다.
	저명한 예는 다음을 포함한다: -->

	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>PAGE</title>

    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <!-- 웹폰트 CSS 설정 -->
	<link rel="stylesheet" href="${path}/resources/css/font/web-fonts.css" type="text/css">

	<!-- Font Awesome CDN -->
	<!-- 웹사이트에 픽토그램(그림문자)을 쉽게 넣는 방법이 있습니다. 바로 웹 아이콘 폰트를 사용하는 것인데요.
	웹 아이콘 폰트는 여러 종류가 있으나 그 중에서 Font Awesome가 제일 유명합니다. Font Awesome이란 이러한
	웹 아이콘 폰트를 모아놓은 라이브러리입니다.-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
		integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
		crossorigin="anonymous">

	<!-- Bootstrap, 부트스트랩의 CSS 와 자바스크립트를 CDN(Content delivery network)으로 지원해준다.
	CDN은 콘텐츠를 효율적으로 전달하기 위해 여러 노드를 가진 네트워크에 데이터를 저장하여 제공하는 시스템을 말한다.
	하지만 지금은 Maven Dependency를 활용한다.
	WebJars 는 클라이언트에서 사용하는 웹라이브러리(jquery 와 bootstrap)를 JAR 파일 안에 패키징한 것이다.

	-->
	<!-- Bootstrap -->
	<script src="${path}/webjars/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${path}/webjars/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="${path}/webjars/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>

	<!-- JQuery-UI -->
	<script src="${path}/webjars/jquery-ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="${path}/webjars/jquery-ui/1.12.1/jquery-ui.css">

	<!-- CSS 불러오기 -->
	<link href="${path}/resources/css/index/index.css" rel="stylesheet">

</head>
