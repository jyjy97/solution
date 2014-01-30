<%--
	Created By Jinwoo Kim, Yonghyeon Yoo
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>admin</title>
	<style type="text/css">
		table { border-collapse:collapse; }
		tr, td { border:1px solid #000000; }

		.text-center{
			text-align:center;
		}		
	</style>
	<script>
		function popWindow() {
			var url = this.event.currentTarget.parentElement.parentElement.getElementsByClassName("courseNumber")[0].textContent;
			window.open("/solutionAdminPage/showAccounts?courseNumber="+url, "_blank", "width="+480+",resizable=1,scrollbars=1") ;
		}
	</script>
</head>
<body>
	<p><a href="/solutionAdminPage/main"><- 메인으로</a></p>
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
			<td></td>
		</tr>

		<c:forEach items="${courses}" var="course">
			<tr>
				<td>${course.courseName}</td>
				<td class="courseNumber">${course.courseNumber}</td>
				<td class="text-center">${course.numofTotalStudent}</td>
				<td></td>
				<td class="text-center">${course.numofSecondGradeStudent}</td>
				<td class="text-center">${course.numofThirdGradeStudent}</td>
				<td class="text-center">${course.numofFourthGradeStudent}</td>
				<td></td>
				<td class="text-center">${course.numofMainMajorStudent}</td>
				<td class="text-center">${course.numofMultiMajorStudent}</td>
				<td class="text-center">${course.numofPartMajorStudent}</td>
				<td class="text-center">${course.numofOtherStudent}</td>
				<td><button onclick="popWindow()">수강 신청한 학생 보기</button></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
