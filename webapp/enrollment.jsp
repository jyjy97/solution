﻿﻿<%--
  Created by Alek
  Date: 1/25/14
  Project: PreCourseEnrollment
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>예비수강신청</title>
	<link rel="stylesheet" type="text/css" href="./stylesheets/enrollment_style.css">
	<script>
		var totalPoint = 0;
		var totalCourse = 0;

		function select(e) {
			e.preventDefault();

			var targetPoint = parseInt(e.currentTarget.parentElement.parentElement.getElementsByClassName("coursePoint")[0].textContent);
//			debugger;
			if (totalPoint + targetPoint > 9) {
				alert("9학점을 초과하였습니다.");
			}

			else {

				e.currentTarget.parentElement.parentElement.children[0].value = 1;

				var tempHTML = e.currentTarget.parentElement.parentElement.innerHTML;
				var tempElement = document.createElement("tr");
				tempElement.innerHTML = tempHTML;

				tempElement.getElementsByClassName("courseSelect")[0].textContent = "지우기";
				tempElement.getElementsByClassName("courseSelect")[0].className = "courseDelete";

				document.getElementById("selectedCourse").insertAdjacentHTML('beforeend', tempElement.innerHTML);
				var deleteKeys = document.getElementsByClassName("courseDelete");
				for (var i = 0; i < deleteKeys.length; i++) {
					deleteKeys[i].addEventListener('click', deleteCourse, false);
				}

				totalPoint = totalPoint + targetPoint;
				totalCourse++;
			}
		}

		function deleteCourse(e) {
			e.preventDefault();
			var targetPoint = parseInt(e.currentTarget.parentElement.parentElement.getElementsByClassName("coursePoint")[0].textContent);
			e.currentTarget.parentElement.parentElement.parentElement.removeChild(e.currentTarget.parentElement.parentElement);

			totalCourse--;
			totalPoint = totalPoint - targetPoint;
		}

		function changeMajorView() {
			var major = document.getElementById("major");
			if (major.value == "국어국문학과") {
				document.getElementById("korean").style.display = "block";
				document.getElementById("psy").style.display = "none";
				document.getElementById("chulhak").style.display = "none";
				document.getElementById("economy").style.display = "none";
				document.getElementById("untong").style.display = "none";
				document.getElementById("jungchi").style.display = "none";
				document.getElementById("social").style.display = "none";
				document.getElementById("press").style.display = "none";
			}
			if (major.value == "심리학과") {
				document.getElementById("korean").style.display = "none";
				document.getElementById("psy").style.display = "block";
				document.getElementById("chulhak").style.display = "none";
				document.getElementById("economy").style.display = "none";
				document.getElementById("untong").style.display = "none";
				document.getElementById("jungchi").style.display = "none";
				document.getElementById("social").style.display = "none";
				document.getElementById("press").style.display = "none";
			}
			if (major.value == "철학과") {
				document.getElementById("korean").style.display = "none";
				document.getElementById("psy").style.display = "none";
				document.getElementById("chulhak").style.display = "block";
				document.getElementById("economy").style.display = "none";
				document.getElementById("untong").style.display = "none";
				document.getElementById("jungchi").style.display = "none";
				document.getElementById("social").style.display = "none";
				document.getElementById("press").style.display = "none";
			}
			if (major.value == "경제학과") {
				document.getElementById("korean").style.display = "none";
				document.getElementById("psy").style.display = "none";
				document.getElementById("chulhak").style.display = "none";
				document.getElementById("economy").style.display = "block";
				document.getElementById("untong").style.display = "none";
				document.getElementById("jungchi").style.display = "none";
				document.getElementById("social").style.display = "none";
				document.getElementById("press").style.display = "none";
			}
			if (major.value == "응용통계학과") {
				document.getElementById("korean").style.display = "none";
				document.getElementById("psy").style.display = "none";
				document.getElementById("chulhak").style.display = "none";
				document.getElementById("economy").style.display = "none";
				document.getElementById("untong").style.display = "block";
				document.getElementById("jungchi").style.display = "none";
				document.getElementById("social").style.display = "none";
				document.getElementById("press").style.display = "none";
			}
			if (major.value == "정치외교학과") {
				document.getElementById("korean").style.display = "none";
				document.getElementById("psy").style.display = "none";
				document.getElementById("chulhak").style.display = "none";
				document.getElementById("economy").style.display = "none";
				document.getElementById("untong").style.display = "none";
				document.getElementById("jungchi").style.display = "block";
				document.getElementById("social").style.display = "none";
				document.getElementById("press").style.display = "none";
			}
			if (major.value == "사회학과") {
				document.getElementById("korean").style.display = "none";
				document.getElementById("psy").style.display = "none";
				document.getElementById("chulhak").style.display = "none";
				document.getElementById("economy").style.display = "none";
				document.getElementById("untong").style.display = "none";
				document.getElementById("jungchi").style.display = "none";
				document.getElementById("social").style.display = "block";
				document.getElementById("press").style.display = "none";
			}
			if (major.value == "언론홍보영상학부") {
				document.getElementById("korean").style.display = "none";
				document.getElementById("psy").style.display = "none";
				document.getElementById("chulhak").style.display = "none";
				document.getElementById("economy").style.display = "none";
				document.getElementById("untong").style.display = "none";
				document.getElementById("jungchi").style.display = "none";
				document.getElementById("social").style.display = "none";
				document.getElementById("press").style.display = "block";
			}
		}

		function submit() {
			if (duplicateCheck()) {

				var courses = document.getElementById("selectedCourse").getElementsByClassName("courseNumber");
				if (courses[0]!=null) {
					var firstCourse = courses[0].textContent;
				} else {
					var firstCourse = "null";
				}
				if (courses[1]!=null) {
					var secondCourse = courses[1].textContent;
				} else {
					var secondCourse = "null";
				}
				if (courses[2]!=null) {
					var thirdCourse = courses[2].textContent;
				} else {
					var thirdCourse = "null";
				}

				var url = "/submit?firstCourse=" + firstCourse + "&secondCourse=" + secondCourse + "&thirdCourse=" + thirdCourse;
				location.href=url;
			}
		}

		function duplicateCheck() {
			var courses = document.getElementById("selectedCourse").getElementsByClassName("courseNumber");
			switch (totalCourse) {
				case 0 :
					alert("아무 과목도 수강신청하지 않았습니다.");
					return false;
					break;
				case 1 :
					return true;
					break;
				case 2 :
					if (courses[0].textContent == courses[1].textContent) {
						alert("중복된 과목이 있습니다.");
						return false;
						break;
					} else {
						return true;
						break;
					}
				case 3 :
					if (courses[0].textContent != courses[1].textContent && courses[1].textContent != courses[2].textContent && courses[0].textContent != courses[2].textContent) {
						return true;
						break;
					} else {
						alert("중복된 과목이 있습니다.");
						return false;
						break;
					}
			}
		}

		window.onload = function() {
			var selects = document.getElementsByClassName("courseSelect");
			for (var i = 0; i < selects.length; i++) {
				selects[i].addEventListener('click', select, false);
			}
		}
	</script>
</head>
<body>
	<select id="major" onchange=changeMajorView()>
		<option value="">-- 전공을 선택하세요 --</option>
		<option value="">-- 문과 대학 --</option>
		<option value="국어국문학과">국어국문학과</option>
		<option value="심리학과">심리학과</option>
		<option value="철학과">철학과</option>
		<option value="">-- 상경 대학 --</option>
		<option value="경제학과">경제학과</option>
		<option value="응용통계학과">응용통계학과</option>
		<option value="">-- 사회과학대학 --</option>
		<option value="정치외교학과">정치외교학과</option>
		<option value="사회학과">사회학과</option>
		<option value="언론홍보영상학부">언론홍보영상학부</option>
	</select>

	<div id="korean" style="display: none;">
	<p>국어국문학과</p>
	<table class="courseList">
		<tr>
			<td>학년</td>
			<td>종별</td>
			<td>단위</td>
			<td>학정번호</td>
			<td>학점</td>
			<td>교과목명</td>
			<td>담당교수</td>
			<td>강의시간</td>
			<td>강의실</td>
			<td></td>
		</tr>
		<c:forEach items="${courses_korean}" var="course">
		<tr><input type="hidden" id="${course.courseName}" value=0>
			<td class="courseGrade">${course.courseGrade}</td>
			<td class="courseType">${course.courseType}</td>
			<td class="courseLevel">${course.courseLevel}</td>
			<td class="courseNumber">${course.courseNumber}</td>
			<td class="coursePoint">${course.coursePoint}</td>
			<td class="courseName">${course.courseName}</td>
			<td class="courseProfessor">${course.courseProfessor}</td>
			<td class="courseTime">${course.courseTime}</td>
			<td class="courseLocation">${course.courseLocation}</td>
			<td><button class="courseSelect">수강신청</button></td>
		</tr>
		</c:forEach>
	</table>
	</div>

	<div id="psy" style="display: none;">
		<p>심리학과</p>
		<table class="courseList">
			<tr>
				<td>학년</td>
				<td>종별</td>
				<td>단위</td>
				<td>학정번호</td>
				<td>학점</td>
				<td>교과목명</td>
				<td>담당교수</td>
				<td>강의시간</td>
				<td>강의실</td>
				<td></td>
			</tr>
			<c:forEach items="${courses_psy}" var="course">
				<tr><input type="hidden" id="${course.courseName}" value=0>
					<td class="courseGrade">${course.courseGrade}</td>
					<td class="courseType">${course.courseType}</td>
					<td class="courseLevel">${course.courseLevel}</td>
					<td class="courseNumber">${course.courseNumber}</td>
					<td class="coursePoint">${course.coursePoint}</td>
					<td class="courseName">${course.courseName}</td>
					<td class="courseProfessor">${course.courseProfessor}</td>
					<td class="courseTime">${course.courseTime}</td>
					<td class="courseLocation">${course.courseLocation}</td>
					<td><button class="courseSelect">수강신청</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div id="chulhak" style="display: none;">
		<p>철학과</p>
		<table class="courseList">
			<tr>
				<td>학년</td>
				<td>종별</td>
				<td>단위</td>
				<td>학정번호</td>
				<td>학점</td>
				<td>교과목명</td>
				<td>담당교수</td>
				<td>강의시간</td>
				<td>강의실</td>
				<td></td>
			</tr>
			<c:forEach items="${courses_chulhak}" var="course">
				<tr><input type="hidden" id="${course.courseName}" value=0>
					<td class="courseGrade">${course.courseGrade}</td>
					<td class="courseType">${course.courseType}</td>
					<td class="courseLevel">${course.courseLevel}</td>
					<td class="courseNumber">${course.courseNumber}</td>
					<td class="coursePoint">${course.coursePoint}</td>
					<td class="courseName">${course.courseName}</td>
					<td class="courseProfessor">${course.courseProfessor}</td>
					<td class="courseTime">${course.courseTime}</td>
					<td class="courseLocation">${course.courseLocation}</td>
					<td><button class="courseSelect">수강신청</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div id="economy" style="display: none;">
		<p>경제학과</p>
		<table class="courseList">
			<tr>
				<td>학년</td>
				<td>종별</td>
				<td>단위</td>
				<td>학정번호</td>
				<td>학점</td>
				<td>교과목명</td>
				<td>담당교수</td>
				<td>강의시간</td>
				<td>강의실</td>
				<td></td>
			</tr>
			<c:forEach items="${courses_ecomony}" var="course">
				<tr><input type="hidden" id="${course.courseName}" value=0>
					<td class="courseGrade">${course.courseGrade}</td>
					<td class="courseType">${course.courseType}</td>
					<td class="courseLevel">${course.courseLevel}</td>
					<td class="courseNumber">${course.courseNumber}</td>
					<td class="coursePoint">${course.coursePoint}</td>
					<td class="courseName">${course.courseName}</td>
					<td class="courseProfessor">${course.courseProfessor}</td>
					<td class="courseTime">${course.courseTime}</td>
					<td class="courseLocation">${course.courseLocation}</td>
					<td><button class="courseSelect">수강신청</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div id="untong" style="display: none;">
		<p>응용통계학과</p>
		<table class="courseList">
			<tr>
				<td>학년</td>
				<td>종별</td>
				<td>단위</td>
				<td>학정번호</td>
				<td>학점</td>
				<td>교과목명</td>
				<td>담당교수</td>
				<td>강의시간</td>
				<td>강의실</td>
				<td></td>
			</tr>
			<c:forEach items="${courses_untong}" var="course">
				<tr><input type="hidden" id="${course.courseName}" value=0>
					<td class="courseGrade">${course.courseGrade}</td>
					<td class="courseType">${course.courseType}</td>
					<td class="courseLevel">${course.courseLevel}</td>
					<td class="courseNumber">${course.courseNumber}</td>
					<td class="coursePoint">${course.coursePoint}</td>
					<td class="courseName">${course.courseName}</td>
					<td class="courseProfessor">${course.courseProfessor}</td>
					<td class="courseTime">${course.courseTime}</td>
					<td class="courseLocation">${course.courseLocation}</td>
					<td><button class="courseSelect">수강신청</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div id="jungchi" style="display: none;">
		<p>정치외교학과</p>
		<table class="courseList">
			<tr>
				<td>학년</td>
				<td>종별</td>
				<td>단위</td>
				<td>학정번호</td>
				<td>학점</td>
				<td>교과목명</td>
				<td>담당교수</td>
				<td>강의시간</td>
				<td>강의실</td>
				<td></td>
			</tr>
			<c:forEach items="${courses_jungchi}" var="course">
				<tr><input type="hidden" id="${course.courseName}" value=0>
					<td class="courseGrade">${course.courseGrade}</td>
					<td class="courseType">${course.courseType}</td>
					<td class="courseLevel">${course.courseLevel}</td>
					<td class="courseNumber">${course.courseNumber}</td>
					<td class="coursePoint">${course.coursePoint}</td>
					<td class="courseName">${course.courseName}</td>
					<td class="courseProfessor">${course.courseProfessor}</td>
					<td class="courseTime">${course.courseTime}</td>
					<td class="courseLocation">${course.courseLocation}</td>
					<td><button class="courseSelect">수강신청</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div id="social" style="display: none;">
		<p>사회학과</p>
		<table class="courseList">
			<tr>
				<td>학년</td>
				<td>종별</td>
				<td>단위</td>
				<td>학정번호</td>
				<td>학점</td>
				<td>교과목명</td>
				<td>담당교수</td>
				<td>강의시간</td>
				<td>강의실</td>
				<td></td>
			</tr>
			<c:forEach items="${courses_social}" var="course">
				<tr><input type="hidden" id="${course.courseName}" value=0>
					<td class="courseGrade">${course.courseGrade}</td>
					<td class="courseType">${course.courseType}</td>
					<td class="courseLevel">${course.courseLevel}</td>
					<td class="courseNumber">${course.courseNumber}</td>
					<td class="coursePoint">${course.coursePoint}</td>
					<td class="courseName">${course.courseName}</td>
					<td class="courseProfessor">${course.courseProfessor}</td>
					<td class="courseTime">${course.courseTime}</td>
					<td class="courseLocation">${course.courseLocation}</td>
					<td><button class="courseSelect">수강신청</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div id="press" style="display: none;">
		<p>언론홍보영상학부</p>
		<table class="courseList">
			<tr>
				<td>학년</td>
				<td>종별</td>
				<td>단위</td>
				<td>학정번호</td>
				<td>학점</td>
				<td>교과목명</td>
				<td>담당교수</td>
				<td>강의시간</td>
				<td>강의실</td>
				<td></td>
			</tr>
			<c:forEach items="${courses_press}" var="course">
				<tr><input type="hidden" id="${course.courseName}" value=0>
					<td class="courseGrade">${course.courseGrade}</td>
					<td class="courseType">${course.courseType}</td>
					<td class="courseLevel">${course.courseLevel}</td>
					<td class="courseNumber">${course.courseNumber}</td>
					<td class="coursePoint">${course.coursePoint}</td>
					<td class="courseName">${course.courseName}</td>
					<td class="courseProfessor">${course.courseProfessor}</td>
					<td class="courseTime">${course.courseTime}</td>
					<td class="courseLocation">${course.courseLocation}</td>
					<td><button class="courseSelect">수강신청</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<p>신청된 과목</p>

	<table id="selectedCourse">
		<tr>
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
	</table>

    <p><button id="submit" onclick="submit()">신청하기</button></p>
</body>
</html>