<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="./js/menu.js"></script>
<meta charset="UTF-8">
<title> 🍵Compose Coffee menu🥛 </title>
</head>
<body>
<h1><b>메뉴판</b></h1>
<div class="ia" onclick="url('./iceAmericano')">
<h2>Ice Americano</h2>
</div>
<hr>
<div class="ha" onclick="url('./hotAmericano')">
<h2>Hot Americano</h2>
</div>
<hr>
<div class="it" onclick="url('./icedTea')">
<h2>Iced tea</h2>
</div>
<hr>
<div class="ht" onclick="url('./hotTea')">
<h2>Hot tea</h2>
</div>
<hr>
<div class="no" onclick="url('./none')">
<h2>먹지않겠습니다</h2>
</div>


</body>
</html>