<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--
	메인 페이지 좌측 사이드바 구현
	* 페이지 설정 관련 메뉴
	* 페이지 요소 관련 메뉴
 -->

<!-- 좌측 사이드 바 -->
<div class="bg-light border-right border-secondary" id="sidebar-wrapper">
	<div class="sidebar-heading bg-secondary text-white rounded-top">
	페이지 편집 메뉴
	</div>
	<div id="sidebar-scroll" class="list-group list-group-flush border-top-0">

		<!-- 페이지 설정 관련 메뉴 -->
		<a class="list-group-item list-group-item-action bg-light"
			data-toggle="collapse" href="#page-management" aria-expanded="false">
			페이지 관리
		</a>
		<div id="page-management" class="collapse list-group list-group-flush">
			<a onclick="" class="list-group-item list-group-item-action bg-white"
				data-toggle="collapse" href="#page-details" aria-expanded="false">사이트 메뉴</a>
			<a onclick="" class="list-group-item list-group-item-action bg-white"
				data-toggle="collapse" href="#partner-details" aria-expanded="false">페이지 이동 효과</a>
			<a onclick="" class="list-group-item list-group-item-action bg-white"
				data-toggle="collapse" href="#partner-details" aria-expanded="false">페이지 배경</a>
		</div>

		<!-- 페이지 요소 관련 메뉴 -->
		<a class="list-group-item list-group-item-action bg-light"
			data-toggle="collapse" href="#primary-components"
			aria-expanded="false" aria-controls="collapseExample">
			기본 요소 추가</a>
		<!-- onclick="Add_PlainText();" -->
		<div id="primary-components" class="collapse list-group list-group-flush">
			<a id="text" href="#" onmousedown="Add_PlainText();"
				class="list-group-item list-group-item-action bg-white">텍스트</a>
			<a href="#" onclick=""
				class="list-group-item list-group-item-action bg-white">이미지</a>
			<a href="#" onclick=""
				class="list-group-item list-group-item-action bg-white">상자</a>
			<a href="#" onclick=";"
				class="list-group-item list-group-item-action bg-white">버튼</a>
			<a href="#" onclick="Add_Table();"
				class="list-group-item list-group-item-action bg-white">테이블</a>
			<a href="#" onclick=""
				class="list-group-item list-group-item-action bg-white">동영상</a>
			<a href="#" onclick=""
				class="list-group-item list-group-item-action bg-white">음악</a>
		</div>

		<!-- 페이지 기능 요소 관련 메뉴 -->
		<a class="list-group-item list-group-item-action bg-light"
			data-toggle="collapse" href="#activity-components"
			aria-expanded="false" aria-controls="collapseExample">
			페이지 전체 기능 요소</a>
		<div id="activity-components" class="collapse list-group list-group-flush">
		<a href="#" onclick="Add_Board();"
			class="list-group-item list-group-item-action bg-white">게시판</a>
		<a href="#" onclick="Add_Chat();"
			class="list-group-item list-group-item-action bg-white">채팅</a>
		<a href="#" onclick="Add_Paint();"
			class="list-group-item list-group-item-action bg-white">그림판</a>
		<a href="#" onclick="Add_Map();"
			class="list-group-item list-group-item-action bg-white">지도</a>
		<a href="#" onclick="Add_Calendar();"
			class="list-group-item list-group-item-action bg-white">캘린더</a>
		</div>
	</div>
</div>
<!-- /#sidebar-wrapper -->
