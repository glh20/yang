<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/images/placeholder.jpg" var="placeholder" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tea Time</title>

<style>
html, body {
	width: 100%;
	height: 100%;
}

.wrapper {
	width: 100%;
	height: 100%;
}

.main-wrapper {
	width: 1950px;
	height: 100%;
}

.info-container {
	order: 1;
	display: flex;
	flex-flow: column;
	width: 20%;
	height: 100%;
	background-color: #E6E6E6;
	text-align: center;
	border-right-style: solid;
	border-right-width: 5px;
	border-color: #CCCCCC;
}

.user-name {
	margin-top: 10%;
}

.profile-pic {
	margin-top: 10%;
	display: block;
	margin-left: auto;
	margin-right: auto;
	width: 80%;
	height: 25%;
	border: 1px solid #2F4F4F;
}

.user-info {
	margin-top: 20%;
}

table {
	font-size: 14pt;
	border-collapse: collapse;
}

table td, table th {
	border: 1px solid #2F4F4F;
	padding: 4px;
}

table tr:first-child td {
	border-top: 0;
}

table tr:last-child td {
	border-bottom: 0;
}

table tr td:first-child, table tr th:first-child {
	border-left: 0;
}

table tr td:last-child, table tr th:last-child {
	border-right: 0;
}

.friend-button {
	margin-top: 20%;
	text-align: center;
}

.removeFriendButton {
	background-color: white;
	color: black;
	border: 2px solid #f44336;
}

.addFriendButton {
	background-color: white;
	color: black;
	border: 2px solid #e7e7e7;
}

.removeFriendButton:hover {
	background-color: #EE4466;
	color: white;
}

.addFriendButton:hover {
	background-color: #33CCFF;
}

.button {
	background-color: #73E600;
	border: none;
	color: white;
	padding: 16px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 18px;
	margin: 4px 2px;
	transition-duration: 0.4s;
	cursor: pointer;
	border-radius: 6px;
}
</style>

</head>

<jsp:include page="/WEB-INF/views/header/f_header.jsp" />

<div class="wrapper">

	<div class="main-wrapper">

		<div class="info-container">
			<span class="user-name">${member.m_id} 님</span> <img
				class="profile-pic" src="img/${member.m_pic }" />
			<div class="user-info">
				<table align="center">
					<tr>
						<td>이름</td>
						<td>${member.m_name }</td>
					</tr>
					<tr>
						<td>성별</td>
						<td>${member.m_strgender }</td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td>${member.m_idnum }</td>
					</tr>
					<tr>
						<td>연락처</td>
						<td>${member.m_tel }</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>${member.m_mail }</td>
					</tr>
				</table>
			</div>


			<div class="friend-button">
				<c:choose>
					<c:when test="${isFriend == true }">
						<button class="button removeFriendButton" onclick="removeFriend()">친구
							삭제</button>
					</c:when>
					<c:otherwise>
						<button class="button addFriendButton" onclick="addFriend()">친구
							추가</button>
					</c:otherwise>
				</c:choose>
			</div>

		</div>
	</div>


</div>

</body>
</html>