<%--
	Created By Jinwoo Kim, Yongheon Yoo
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>admin</title>
	<style>
		table { border-collapse:collapse; }
		tr, td { border:1px solid #000000;
				width:100px;}
	</style>
	<script>
		function changeHangul(text) {
			if (text=="main") {
				document.write("본전공");
			} else if (text=="multi") {
				document.write("복수(이중)전공");
			} else if (text=="part") {
				document.write("부전공");
			} else if (text=="other") {
				document.write("기타");
			}
		}
	</script>
</head>
<body>
	<p>${course.courseName}, ${course.courseNumber}</p>
	<table>
		<tr>
			<td>학번</td>
			<td>본전공</td>
			<td>학년</td>
			<td>신청사유</td>
		</tr>
		<c:forEach items="${accounts}" var="account">
			<tr>
				<td>${account.studentNumber}</td>
				<td>${account.studentMajor}</td>
				<td>${account.studentGrade}</td>
				<td><script>changeHangul("${account.studentWhy}")</script></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>