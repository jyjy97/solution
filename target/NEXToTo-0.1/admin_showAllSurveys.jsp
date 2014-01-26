<%--
  Created by Alek
  Date: 1/26/14
  Project: PreCourseEnrollment
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>admin</title>
	<style type="text/css">
		table { border-collapse:collapse; }
		tr, td { border:1px solid #000000; }
	</style>
</head>
<body>
	<table>
		<tr>
			<td>학정번호</td>
			<td>학번</td>
		</tr>

	<c:forEach items="${surveys}" var="survey">
		<tr>
			<td>${survey.studentNumber}</td>
			<td>${survey.courseNumber}</td>
		</tr>
	</c:forEach>
	</table>

</body>
</html>