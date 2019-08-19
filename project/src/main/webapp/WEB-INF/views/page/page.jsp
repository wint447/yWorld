<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<!-- HEAD 태그 공통 부분  -->
<%@ include file="../include/commons/head.jsp"%>
<!-- /HEAD 태그 공통 부분  -->

<body>

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

			<!-- 컨텐츠 레이아웃 ondrop="drop(event)" ondragover="allowDrop(event)" -->
			<div class="container-fluid" >
				<!-- 유저별 페이지 정보 상이 -->
			</div>
			<!-- /컨텐츠 레이아웃 -->

			<!-- 하단 네비게이션 바 -->
			<%@ include file="../include/page/page_footer.jsp"%>
			<!-- /하단 네비게이션 바 -->
		</div>
		<!-- /페이지 컨텐츠 레이아웃 -->
	</div>
	<!-- /전체 페이지 레이아웃 -->

<%@ include file="../include/page/page_plugin_js.jsp"%>

<script>
function allowDrop(ev) {
	ev.preventDefault();
}

function drag(ev) {
	ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
	ev.preventDefault();
	var data = ev.dataTransfer.getData("text");
	let insertTag = document.getElementById(data);
	// event.target returns the DOM element, so you can retrieve any property/ attribute that has a value;
	// so, to answer your question more specifically, you will always be able to retrieve nodeName,
	// and you can retrieve href and id, provided the element has a href and id defined;
	// otherwise undefined will be returned.
	// However, inside an event handler, you can use this, which is set to the DOM element as well; much easier.
	alert(data);
	alert(ev.target.tagName);

	insertTag.style.left = ev.clientX - insertTag.width / 2; // 동적으로 생성한 객체를 가리키게 할 필요가 있는데 어떻게 해야되지?
	insertTag.style.top = ev.clientY - insertTag.height / 2;
	if (ev.target.tagName != 'IMG') {
		ev.target.appendChild(d	ocument.getElementById(data));
	}
}
</script>

</body>

</html>
