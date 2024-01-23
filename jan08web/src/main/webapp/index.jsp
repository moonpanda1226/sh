<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>짱구마을</title>
<link href="./css/index.css" rel="stylesheet"/>
<link href="./css/menu.css" rel="stylesheet"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript" src="./js/menu.js"></script>

</head>
<body>
	<div class="container">
		<header>
			<%@ include file="menu.jsp" %>
			<!-- jsp:은 출력 결과만 화면에 나옵니다. -->
		</header>
		<div class="main">
			<div class="mainStyle">
				<article>
						<%-- <c:set var="number" value="105"/>
					<c:out value="${number }"/>
					<br>
					<c:forEach begin="1" end="9" var="row" step="1">
						2 x ${row } = ${row * 2 }<br>
					</c:forEach>
					
					<c:if test="${number eq 105 }">
						number는 105입니다.<br>
						eq 11 == 5 같은 값? false
						ne 11 != 5 달라?    true
						lt 11 〈 5          false
						gt 11 〉 5          true
						le 11〈= 5          false
						ge 11 〉=5          true
						&& 
						||
						empty
						not empty
					</c:if>  --%>
					
					유리진선 수지효진 철수선우 짱아솔범 흰둥이뚱 Let`s go<br>
					<br>
					
					<hr>

					<br>
					<br>
					<img alt="index" src="./img/똘망.gif" >
					<br>
					<br>
					오호잇~~ 다들 열공해서 나처럼 귀여워지라구~~~❤️‍🔥🤗
					 <br>
					
					<br>
					설표 메모 <br>
					1. 라이브러리와 프레임워크 <br>
					2. 오버로딩과 오버라이딩 <br>
					3. 힙 영역의 사용법 <br>
					4. 클래스와 인터페이스 차이! <br>
					5. var, let, const, 호이스팅 <br>
					6. 사이트 뒤에 .do 가 붙는 이유 <br>
					7.myinfo 에 자신이 읽은 글 번호, 글 제목(링크), 읽은 시간
					
				<%--	1~45까지 짝수만 출력하세요.
				</article>
				<article>
				
					<c:forEach begin="1" end="45" var="row">
						<c:if test="${row % 2 eq 0 }">
							${row }<br>
						</c:if>
					</c:forEach> --%>
					
				</article>
				<article>
					
					<br>
					<%--<c:forEach begin="1" end="10" var="row" varStatus="s">
						${s.begin } / ${s.end } 
						 
						
					</c:forEach> --%>
				</article>
			</div>
		</div>
		<footer>
      <c:import url="footer.jsp"/>
      </footer>
	</div>
</body>
</html>