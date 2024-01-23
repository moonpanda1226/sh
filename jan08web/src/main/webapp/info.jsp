<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link href="./css/index.css" rel="stylesheet"/>
<link href="./css/menu.css" rel="stylesheet"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript" src="./js/menu.js"></script>

</head>
<body>
	<div class="container">
		<header>
			<jsp:include page="menu.jsp"></jsp:include>
			<!-- jsp:은 출력 결과만 화면에 나옵니다. -->
			<%@ include file="menu.jsp" %>
		</header>
		<div class="main">
			<div class="mainStyle">
				<article>
					<h1>info</h1>
					<h2>2024-01-23 프레임워크 프로그래밍 / 정처기 시험접수</h2>
					<ul>
						<li>읽은 글 보기</li>
						<li>관리자모드 - 회원관리</li>
						<li>관리자모드 - 글관리</li>
					</ul>
					<h2>2024-01-22 프레임워크 프로그래밍</h2>
					<ul>
						<li>댓글출력</li>
						<li>댓글달기</li>
						<li>댓글삭제</li>
					</ul>
					<h2>2024-01-19</h2>
					<ul>
						<li>댓글출력</li>
						<li>댓글달기</li>
						<li>댓글삭제</li>
					</ul>
				</article>
				<article>
					<div>
						<h1>남은 것</h1>
						<ul>
							<li>xml / json</li>
							<li>관리자페이지</li>
							<li>파일업로드</li>
							<li>MVC패턴</li>
							<li>스프링-레거시</li>
							<li>lombok</li>
							<li>mybaris</li>
							<li>스프링-부트</li>
							<li>thymeleaf</li>
							<li>jpa</li>
							<li>리눅스</li>
							<li>aws</li>
							<li>vue</li>
						</ul>
					</div>
				</article>
			</div>
		</div>
		<footer>
      <c:import url="footer.jsp"/>
      </footer>
	</div>
</body>
</html>