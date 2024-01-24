<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<meta charset="UTF-8">
<title>이뚱이 게시글</title>
<link href="./css/index.css" rel="stylesheet" />
<link href="./css/menu.css" rel="stylesheet" />
<link href="./css/detail.css" rel="stylesheet" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript" src="./js/menu.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">

	$(document).ready(function() {
		
		$(".commentEdit").click(function(){
			if(confirm('수정하시겠습니까?')){
				//
				let cno $(this).siblings(".cno").val();
				let text = $(this).parents(".chead").next().text();
				alert(cno + " : " + comment);
			}
		});
		
		
		
		
		
		//댓글 삭제 버튼을 눌렀습니다.
		$(".commentDelete").click(function(){
			//alert("삭제버튼을 눌렀습니다.");
			//부모객체 찾아가기 = this
			//$(this).parent(".cname").css('color','green');
			//let text = $(this).parent(".cname").text();
			//부모요소 아래 자식요소 찾기 children()
			//let cno = $(this).parent(".cname").children(".cno").val();
			//let cno = $(this).parent().children(".cno").val();
			//형제요소 찾기 .siblings() .prev() 바로 이전 .next() 바로 다음
			
			if(confirm("삭제 하시겠습니까?")){
				let cno = $(this).prev().val();
				//ajax
				let point = $(this).closest(".comment");
				$.ajax({
					url : './commentDel',   //주소
					type : 'post',          //get.post
					dataType : 'text',      //수신타입 json
					data : {'no' : cno},      //보낼 값
					success:function(result){// 0,1
						if(result == 1){
							point.remove();
							//정상 삭제 : this의 부모 (.comment)를 찾아서 remove하겠습니다.
							//$(this).closest(".comment").hide();
							//$(this).closest(".comment").hide();
							} else {
							alert("삭제할 수 없습니다. 관리자에게 문의하세요.")
						}
					},
					error:function(request, status, error){//통신 오류
						alert("문제가 발생했습니다.");
					}
				}); //end ajax
				
				
			}
			
			
		});
		
		//댓글쓰기 버튼을 누르면 댓글창 나에게 하기 2024-01-24
		$(".comment-write").hide();//원래는 ready 바로 아래 두시는 것을 추천 ///
		//$(".comment-write").show(5000);
		$(".xi-group").click(function(){
			$(".xi-group").hide();
			//$(".comment-write").show();
			$(".comment-write").slideToggle('slow');
		});
		
		
		//alert("준비되었습니다");
		$("#comment-btn").click(function() {
			let content = $("#commentcontent").val();
			let bno = ${detail.no};//여기는 글번호
			//alert("content : " + content + "no  : " + no);
			//가상 form 만들기 = 동적생성
			//전송 ---> content가 5글자 이상인 경우 실행하겠습니다.
			if (content.length < 5) {
				alert("댓글은 다섯글자 이상으로 적어주세요.");
				$("#commentcontent").focus();
				//return false;
			} else {
				let form = $('<form></form>');
				form.attr('name', 'form');
				form.attr('method', 'post');
				form.attr('action', './comment');

				form.append($('<input/>', {type : 'hidden', name : 'commentcontent', value : content}));
				form.append($('<input/>', {type : 'hidden', name : 'bno', value : bno}));

				form.appendTo("body");
				form.submit();
				/*let form = document.createElement('form');
				form.name='form';
				form.method='post';
				form.action='./comment';
				//붙이기
				let text = document.createElement('textarea');
				text.setAttribute("type","hidden");
				text.setAttribute("name","commentcontent");
				text.setAttribute("value",content);
				//붙이기
				let no = document.createElement('input');
				text.setAttribute("type","hidden");
				text.setAttribute("name","bno");
				text.setAttribute("value",${detail.no});
				//form에다가 붙이기
				form.appendChild(text);
				form.appendChild(no);
				//전송하기
				document.body.appendChild(form);
				form.submit();*/
			}
		});
	});

	function commentwrite() {
		alert("버튼을 눌렀습니다!")
	}
</script>
</head>
<body>
	<div class="container">
		<header>
			<%@ include file="menu.jsp"%>
		</header>
		<div class="main">
			<div class="mainStyle">
				<article>
					<div class="detailDIV">
						<div class="detailTITLE">${detail.title }</div>
						<div class="detailWRITECOUNT">
							<div class="detailWRITE">
								${detail.write }

								<c:if test="${detail.mid eq 'test10' }">
									<img class="profilePic" alt="아가설표프로필" src="./img/솔범.jpg">
								</c:if>
								<c:if test="${detail.mid eq 'test91' }">
									<img class="profilePic" alt="괴도지훈프로필" src="./img/지훈.png">
								</c:if>
								<c:if test="${detail.mid eq 'test6' }">
									<img class="profilePic" alt="하츄핑프로필" src="./img/하츄츄.webp">
								</c:if>
								<c:if test="${detail.mid eq 'lala' }">
									<img class="profilePic" alt="라라핑프로필" src="./img/라라.webp">
								</c:if>
								<c:if test="${detail.mid eq 'test123' }">
									<img class="profilePic" alt="시러핑프로필" src="./img/시러핑.png">
								</c:if>
								<c:if test="${detail.mid eq 'leesu' }">
									<img class="profilePic" alt="방글핑프로필" src="./img/방그핑.jpeg">
								</c:if>


								<c:if test="${sessionScope.mname ne null && detail.mid  eq sessionScope.mid}">

									<img alt="삭제" src="./img/삭제.png" onclick="del()">
									<img alt="수정" src="./img/수정.png" onclick="update()">
								</c:if>

							</div>
							<div class="detailCOUNT">${ip} / ${detail.count }</div>
						</div>
						<div class="detailCONTENT">${detail.content }</div>
					</div>
					<c:if test="${sessionScope.mid ne null }">
					<button class="xi-group">댓글쓰기</button>
						<!-- 댓글쓰는 창을 여기다가 만들어주겠습니다.댓글내용, 누가, 어느 2024-01-22 -->
						<div class="comment-write">
							<div class="comment-form">
								<textarea id="commentcontent" name="commentcontent"></textarea>
								<button id="comment-btn">댓글쓰기</button>

							</div>
						</div>
					</c:if>
					<!-- 댓글 출력창 -->
					<div class="comments">
						<c:forEach items="${commentList }" var="co">
							<div class="comment">
								<div class="chead">
									<div class="cname">
									<c:if test="${co.mid eq 'test10' }">
									<img class="profilePic" alt="아가설표프로필" src="./img/솔범.jpg">
								</c:if>
								<c:if test="${co.mid eq '페이커' }">
									<img class="profilePic" alt="페이커프로필" src="./img/지훈.png">
								</c:if>
								<c:if test="${co.mid eq 'test6' }">
									<img class="profilePic" alt="하츄핑프로필" src="./img/하츄츄.webp">
								</c:if>
								<c:if test="${co.mid eq 'lala' }">
									<img class="profilePic" alt="라라핑프로필" src="./img/라라.webp">
								</c:if>
								<c:if test="${co.mid eq 'test123' }">
									<img class="profilePic" alt="시러핑프로필" src="./img/시러핑.png">
								</c:if>
								<c:if test="${co.mid eq 'leesu' }">
									<img class="profilePic" alt="방글핑프로필" src="./img/방그핑.jpeg">
								</c:if>
									
									${co.mname}님
									<c:if test="${sessionScope.mname ne null && co.mid eq sessionScope.mid }"> 
									<input type="hidden" class="cno" value="${co.cno }">
									<img alt="삭제" src="./img/삭제.png" class="commentDelete">
									<img alt="수정" src="./img/수정.png" class="commentEdit">
									</c:if>
									</div>
									<div class="cdate">${co.ip} / ${co.cdate }</div>
								</div>
								<div class="ccomment">${co.comment }</div>
							</div>
						</c:forEach>

					</div>
				<article>
				하단 foot때문에 안보이묜 ㅊ추키
				</article>
					<button onclick="url('./board?page=${param.page}')">게시판으로</button>
				</article>

			</div>
		</div>
		<footer>
			<c:import url="footer.jsp" />
		</footer>
	</div>

	<script type="text/javascript">
		function del() {
			//alert("삭제를 눌렀습니다");
			var ch = confirm("글을 삭제하시겠습니까?");
			if (ch) {
				location.href = "./delete?no=${detail.no}";
			}
		}
		function update() {
			if (confirm("수정하시겠습니까?")) {
				location.href = "./update?no=${detail.no }";
			}
		}
		function commentDel(cno){
			if(confirm("댓글을 삭제하시겠습니까?")){
				location.href='./commentDel?no=${detail.no}&cno='+cno;
			}
		}
	</script>
</body>
</html>