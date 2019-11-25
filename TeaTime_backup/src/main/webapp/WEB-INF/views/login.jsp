<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<spring:url value="/resources/images/naver.png" var="naver" />


<link href="https://fonts.googleapis.com/css?family=Nunito&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${basicCss }">

<style>
.main-wrapper {
	text-align: center;
}


.id-box {
	width: 300px;
	height: 30px;
	font-size: 16pt;
}
.id-box:focus {
	outline-width: 1px;
	outline-style: solid;
	outline-color: #228B22;
}
.pw-box {
	width: 300px;
	height: 30px;
	font-size: 16pt;
}
.pw-box:focus {
	outline-width: 1px;
	outline-style: solid;
	outline-color: #228B22;
}
</style>
</head>
<body>

	<!-- 
<form action="loginchk" method="post">
<input type="text" name="id" placeholder="ID"><br>
<input type="password" name="pw" placeholder="Password"><br>
<input type="submit" value="로그인"><br>
<input type="button" value="회원가입" onclick="location.href='register'">
</form>
 -->
	<c:choose>
		<c:when test="${sid != null}">
			<h2>네이버 아이디 로그인 성공하셨습니다!!</h2>
			<h3>'${sid}' 님 환영합니다!</h3>
			<h3>
				<a href="logout">로그아웃</a>
			</h3>
		</c:when>
		<c:when test="${sid == null }">
			<form action="loginchk" method="post" name="frm"
				style="width: 470px;">
				<h2>로그인</h2>
				<input class="id-box" type="text" name="id" placeholder="아이디" > <br> 
				<input class="pw-box" type="password" name="pw" placeholder="비밀번호"> <br>
				 <input type="submit" value="로그인"> <br>
			</form>
			<br>
			<!-- 네이버 로그인 창으로 이동 -->
			<div id="naver_id_login" style="text-align: center">
				<a href="${url}"> <img width="223"
					src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
			</div>
			<br>
		</c:when>
	</c:choose>
</body>
</html>