<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav>
	<ul>
		<li onclick="url('./index')"><i class="xi-heart"></i>멍</li>
		<li onclick="url('./board')"><i class="xi-emoticon-happy-o"></i>멍멍</li>
		<li onclick="url('./qna')"><i class="xi-emoticon-happy"></i>멍멍멍</li>
		<li onclick="url('./notice')"><i class="xi-emoticon-smiley-o"></i>멍멍</li>
		<li onclick="url('./bootstrap')">멍멍멍</li>
		<li onclick="url('./info')"><i class="xi-emoticon-smiley"></i>멍멍</li>
		<li onclick="url('./team')">왈왈</li><c:choose><c:when test="${sessionScope.mname eq null}">
		<li onclick="url('./login')"><i class="xi-heart-o"></i>멍</li></c:when><c:otherwise>
		<li onclick="url('./myInfo')"><i class="xi-key"></i>${sessionScope.mname}님</li>
		<li onclick="url('./logout')"><i class="xi-hand-paper"></i>로그아웃</li></c:otherwise></c:choose>
	</ul>
</nav>