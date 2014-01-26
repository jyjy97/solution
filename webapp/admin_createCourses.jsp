<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>admin_createGaminginstance</title>
</head>
	<style type="text/css">
		table { border-collapse:collapse; }
		tr, td { border:1px solid #000000; }
	</style>

<body>
<form id="createGamingInstance" action="/solutionAdminPage/createCourse.do" method="POST">
	<p>학년<input type="text" name="courseGrade" size="40px"></p>
	<p>전공<input type="text" name="courseMajor" size="40px"></p>
	<p>종별<input type="text" name="courseType" size="40px"></p>
	<p>단위<input type="text" name="courseLevel" size="40px"></p>
	<p>학정번호<input type="text" name="courseNumber" size="40px"></p>
	<p>학점<input type="text" name="coursePoint" size="40px"></p>
	<p>교과목명<input type="text" name="courseName" size="40px"></p>
	<p>담당교수<input type="text" name="courseProfessor" size="40px"></p>
	<p>강의시간<input type="text" name="courseTime" size="40px"></p>
	<p>강의실<input type="text" name="courseLocation" size="40px"></p>
	<input type="submit" value="만들기">
</form>

<table>
	<tr>
		<td>전공</td>
		<td>학년</td>
		<td>종별</td>
		<td>단위</td>
		<td>학정번호</td>
		<td>학점</td>
		<td>교과목명</td>
		<td>담당교수</td>
		<td>강의시간</td>
		<td>강의실</td>
	</tr>
	<c:forEach items="${courses}" var="course">
		<tr>
			<td>${course.courseMajor}</td>
			<td>${course.courseGrade}</td>
			<td>${course.courseType}</td>
			<td>${course.courseLevel}</td>
			<td>${course.courseNumber}</td>
			<td>${course.coursePoint}</td>
			<td>${course.courseName}</td>
			<td>${course.courseProfessor}</td>
			<td>${course.courseTime}</td>
			<td>${course.courseLocation}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>