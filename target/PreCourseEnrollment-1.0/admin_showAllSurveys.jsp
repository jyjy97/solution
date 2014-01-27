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

	<table>
		<tr>
			<td>과목명</td>
			<td>학정번호</td>
			<td>수강신청인원</td>
			<td></td>
			<td>2학년</td>
			<td>3학년</td>
			<td>4학년</td>
			<td></td>
			<td>본전공</td>
			<td>복수(이중)전공</td>
			<td>부전공</td>
			<td>기타</td>
		</tr>

		<c:forEach items="${courses}" var="course">
			<tr>
				<td>${course.courseName}</td>
				<td>${course.courseNumber}</td>
				<td>${course.numofTotalStudent}</td>
				<td></td>
				<td>${course.numofSecondGradeStudent}</td>
				<td>${course.numofThirdGradeStudent}</td>
				<td>${course.numofFourthGradeStudent}</td>
				<td></td>
				<td>${course.numofMainMajorStudent}</td>
				<td>${course.numofMultiMajorStudent}</td>
				<td>${course.numofPartMajorStudent}</td>
				<td>${course.numofOtherStudent}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>