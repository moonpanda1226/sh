<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link href="../css/admin.css?ver=0.12" rel="stylesheet" />
<link href="../css/member.css" rel="stylesheet" />
<script type="text/javascript" src="../js/menu.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script>
$(function(){
	$('select[name=grade]').on("change", function(){
		let val = $(this).val();//변경시킬 등급
		let mno = $(this).closest("tr").children().first().text();
		//두 값을 잡았으면 가상 form에 담아서 전송합니다.
		let form = $('<form></form>');
		form.attr('method','post');
		form.attr('action','./members');
		form.append($('<input/>', {type : 'hidden', name : 'mno', value : mno}));
		form.append($('<input/>', {type : 'hidden', name : 'grade', value : val}));
		<c:if test="${param.grade ne null}">
		form.append($('<input/>', {type : 'hidden', name : 'currentgrade', value : ${param.grade}}));
		</c:if>
		form.appendTo('body');
		form.submit();
	});
});
</script>
</head>
<body>
	<div class="wrap">
		<div class="menu">
		<%@ include file="menu.jsp" %>
			<nav>
				<ul>
					<li onclick="url('./members')"><i class="xi-flag-o"></i> 회원 관리</li>
					<li onclick="url('./board')"><i class="xi-flag"></i> 게시글 관리</li>
					<li onclick="url('./comments')"><i class="xi-emoticon"></i> 댓글
						관리</li>
					<li onclick="url('./info')"><i class="xi-lock-o"></i> 이뚱님</li>
					<li></li>
					<li></li>
				</ul>
			</nav>
		</div>
		<div class="main">
			<article>
				<h2>회원관리</h2>
				<div class="member-lists">
					<ul>
						<li onclick="url('./members?grade=0')"><i
							class="xi-close-circle-o"></i> 탈퇴</li>
						<li onclick="url('./members?grade=1')"><i
							class="xi-minus-circle-o"></i> 강퇴</li>
						<li onclick="url('./members?grade=2')"><i
							class="xi-check-circle-o"></i> 정지</li>
						<li onclick="url('./members?grade=5')"><i class="xi-label-o"></i>
							정상</li>
						<li onclick="url('./members?grade=9')"><i
							class="xi-plus-square-o"></i> 관리자</li>
						<li onclick="url('./members?grade=10')"><i class="xi-crown"></i>
							이뿌니들</li>
					</ul>
				</div>
				<table>
					<thead>
						<tr>
							<td>번호</td>
							<td>아이디</td>
							<td>이름</td>
							<td>가입일</td>
							<td>등급</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="row">
							<tr class="row${row.mgrade }">
								<td class="d1">${row.mno }</td>
								<td class="title">${row.mid }</td>
								<td class="d1">${row.mname }</td>
								<td class="d2">${row.mdate }</td>
								<td class="d1">${row.mgrade }</td>
								<td class="d1"><select name="grade">
										<optgroup label="정지">
											<option
												<c:if test="${row.mgrade eq 0}">selected="selected"</c:if>>0
												강퇴</option>
											<option
												<c:if test="${row.mgrade eq 1}">selected="selected"</c:if>>1
												탈퇴</option>
											<option
												<c:if test="${row.mgrade eq 2}">selected="selected"</c:if>>2
												정지</option>
										</optgroup>
										<optgroup label="정상">
											<option
												<c:if test="${row.mgrade eq 5}">selected="selected"</c:if>>5
												평민</option>
										</optgroup>
										<optgroup label="관리자">
											<option
												<c:if test="${row.mgrade eq 9}">selected="selected"</c:if>>9
												관리자</option>
										</optgroup>
										<optgroup label="내사랑들">
											<option
												<c:if test="${row.mgrade eq 10}">selected="selected"</c:if>>10
												이뿌니</option>
										</optgroup>
								</select> ${row.mgrade }
							</tr>
						</c:forEach>
					</tbody>
				</table>
				페이징 필요
			</article>
		</div>
	</div>
</body>
</html>