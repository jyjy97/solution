<%--
  Created by Alek
  Date: 11/22/13
  Project: NEXToTo
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>예비수강신청</title>

<script>

	function fill_check() {
		var id = document.getElementById("identification");
		var grade = document.getElementById("grade");
		var major = document.getElementById("major");
		var why = document.getElementById("why");
		if (id.value=="" || id.value==null) {
			alert("학번을 입력해 주세요.");
			return false;
		} else if (grade.value =="" || grade.value ==null) {
			alert("학년을 선택해 주세요.");
			return false;
		} else if (major.value =="" || major.value ==null) {
			alert("전공을 선택해 주세요.");
			return false;
		} else if (why.value =="" || why.value ==null) {
			alert("신청사유를 선택해 주세요.");
			return false;
//		} else if (id.value.length != 6 || id.value.length != 10) {
//			alert("학번은 숫자 6자리 또는 10자리로 되어있습니다. 다시 확인해 주시기 바랍니다.");
//			return false;
		}
			return true;
	}

	window.onload = function() {
		if (document.getElementById("loginButton")!=null) {
			document.getElementById("loginButton").addEventListener('click', login, false);
		}
	};
	</script>
</head>
<body>
<div class="body_wrap identityContainer">
	<h2>예비수강신청</h2>
	<div id="loginForm_wrap">
		<form id="loginForm" action="/login" method="POST">
			<input type="text" maxlength="15" name="identification" id="identification" size="15" placeholder="학번" >
			<select name="grade" id="grade">
				<option value="">-- 학년 --</option>
				<option value="2">2학년</option>
				<option value="3">3학년</option>
				<option value="4">4학년</option>
			</select>
			<select name="major" id="major">
				<option value="">-- 주전공 --</option>
				<option value="경영학과">경영학과</option>
				<option value="심리학과">심리학과</option>
			</select>
			<select name="why" id="why">
				<option value="">-- 수강 목적 --</option>
				<option value="main">본전공</option>
				<option value="multi">복수(이중)전공</option>
				<option value="part">부전공</option>
				<option value="other">기타</option>
			</select>
			<input type="submit" onclick="return fill_check();" value="로그인">
		</form>
	</div>
</div>
</body>
</html>