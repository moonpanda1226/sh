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
					
				
					<br>
					<hr>

					<br>
					<br>
					<img alt="index" src="./img/똘망.gif" >
					<br>
					<br>
					오호잇~~ 다들 열공해서 나처럼 귀여워지라구~~~❤️‍🔥🤗
					 <br>
				
					
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