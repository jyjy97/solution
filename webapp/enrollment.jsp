<%--
Created By Jinwoo Kim, Yonghyeon Yoo
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>예비수강신청</title>
		<!-- <link rel="stylesheet" type="text/css" href="./css/enrollment_style.css"> -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Bootstrap -->
		<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
		
		
		<script>
			var totalPoint = 0;
			var totalCourse = 0;

			function select(e) {
				e.preventDefault();

				var targetPoint = parseInt(e.currentTarget.parentElement.parentElement.getElementsByClassName("coursePoint")[0].textContent);
				//			debugger;
				if (totalPoint + targetPoint > 9) {
					alert("9학점을 초과하였습니다.");
				} else {

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
					document.getElementById("money").style.display = "none";
					document.getElementById("untong").style.display = "none";
					document.getElementById("jungchi").style.display = "none";
					document.getElementById("social").style.display = "none";
					document.getElementById("press").style.display = "none";
				}
				if (major.value == "심리학과") {
					document.getElementById("korean").style.display = "none";
					document.getElementById("psy").style.display = "block";
					document.getElementById("chulhak").style.display = "none";
					document.getElementById("money").style.display = "none";
					document.getElementById("untong").style.display = "none";
					document.getElementById("jungchi").style.display = "none";
					document.getElementById("social").style.display = "none";
					document.getElementById("press").style.display = "none";
				}
				if (major.value == "철학과") {
					document.getElementById("korean").style.display = "none";
					document.getElementById("psy").style.display = "none";
					document.getElementById("chulhak").style.display = "block";
					document.getElementById("money").style.display = "none";
					document.getElementById("untong").style.display = "none";
					document.getElementById("jungchi").style.display = "none";
					document.getElementById("social").style.display = "none";
					document.getElementById("press").style.display = "none";
				}
				if (major.value == "경제학과") {
					document.getElementById("korean").style.display = "none";
					document.getElementById("psy").style.display = "none";
					document.getElementById("chulhak").style.display = "none";
					document.getElementById("money").style.display = "block";
					document.getElementById("untong").style.display = "none";
					document.getElementById("jungchi").style.display = "none";
					document.getElementById("social").style.display = "none";
					document.getElementById("press").style.display = "none";
				}
				if (major.value == "응용통계학과") {
					document.getElementById("korean").style.display = "none";
					document.getElementById("psy").style.display = "none";
					document.getElementById("chulhak").style.display = "none";
					document.getElementById("money").style.display = "none";
					document.getElementById("untong").style.display = "block";
					document.getElementById("jungchi").style.display = "none";
					document.getElementById("social").style.display = "none";
					document.getElementById("press").style.display = "none";
				}
				if (major.value == "정치외교학과") {
					document.getElementById("korean").style.display = "none";
					document.getElementById("psy").style.display = "none";
					document.getElementById("chulhak").style.display = "none";
					document.getElementById("money").style.display = "none";
					document.getElementById("untong").style.display = "none";
					document.getElementById("jungchi").style.display = "block";
					document.getElementById("social").style.display = "none";
					document.getElementById("press").style.display = "none";
				}
				if (major.value == "사회학과") {
					document.getElementById("korean").style.display = "none";
					document.getElementById("psy").style.display = "none";
					document.getElementById("chulhak").style.display = "none";
					document.getElementById("money").style.display = "none";
					document.getElementById("untong").style.display = "none";
					document.getElementById("jungchi").style.display = "none";
					document.getElementById("social").style.display = "block";
					document.getElementById("press").style.display = "none";
				}
				if (major.value == "언론홍보영상학부") {
					document.getElementById("korean").style.display = "none";
					document.getElementById("psy").style.display = "none";
					document.getElementById("chulhak").style.display = "none";
					document.getElementById("money").style.display = "none";
					document.getElementById("untong").style.display = "none";
					document.getElementById("jungchi").style.display = "none";
					document.getElementById("social").style.display = "none";
					document.getElementById("press").style.display = "block";
				}
			}

			function submit() {
				if (duplicateCheck()) {
					var coursesName = document.getElementById("selectedCourse").getElementsByClassName("courseName");
					var courses = document.getElementById("selectedCourse").getElementsByClassName("courseNumber");

					var message = "다음 과목을 예비 수강 신청합니다.\n";
				
					if (courses[0] != null) {
						var firstCourse = courses[0].textContent;
						var firstCourseName = coursesName[0].textContent;
						message += "1. " + firstCourseName + "\t" + firstCourse + "\n";
					} else {
						var firstCourse = " ";
						var firstCourseName = " ";
					}
					if (courses[1] != null) {
						var secondCourse = courses[1].textContent;
						var secondCourseName = coursesName[1].textContent;
						message += "2. " + secondCourseName + "\t" + secondCourse + "\n";
					} else {
						var secondCourse = " ";
						var secondCourseName = " ";
					}
					if (courses[2] != null) {
						var thirdCourse = courses[2].textContent;
						var thirdCourseName = coursesName[2].textContent;
						message += "3. " + thirdCourseName + "\t" + thirdCourse + "\n";
					} else {
						var thirdCourse = " ";
						var thirdCourseName = " ";
					}

					message += "계속 하시겠습니까?";

					if (confirm(message)) {
						var url = "/submit?firstCourse=" + firstCourse + "&secondCourse=" + secondCourse + "&thirdCourse=" + thirdCourse;
						location.href = url;
					} else {
						return false;
					}

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
	
		<div class="container">
			<div class="hero-unit">
				<p>졸업 필수 또는 커리큘럼 상 꼭 들어야 하는 과목이지만 TO가 부족해 듣지 못하는 상황을 방지하기 위하여 진행되는 예비수강신청 입니다.</p>
				<p>이번 학기에 꼭 들을 과목에 한해서만 예비수강신청을 진행해주시기 바랍니다. 신청 완료후에는 변경이 불가하오니 학우 여러분께서는 신중히 선택해주시기 바랍니다.</p>
			</div>
			
			<hr>
			
			<div>
				<div class="inline-block">개설 전공</div>
				<div class="inline-block">
					<select id="major" class="selector_major" onchange="changeMajorView();">
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
				</div>
			</div>
			
			<table id="korean" style="display: none;" class="table table-hover table-condensed courseList">
				<caption class="text-left"><strong>국어국문학과<strong></caption>
				<thead>
					<tr>
						<th>학년</th>
						<th>종별</th>
						<th>단위</th>
						<th>학정번호</th>
						<th>학점</th>
						<th>교과목명</th>
						<th>담당교수</th>
						<th>강의시간</th>
						<th>강의실</th>
						<th> </th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${courses_korean}" var="course">
						<tr>
							<input type="hidden" id="${course.courseName}" value=0>
							<td class="courseGrade">${course.courseGrade}</td>
							<td class="courseType">${course.courseType}</td>
							<td class="courseLevel">${course.courseLevel}</td>
							<td class="courseNumber">${course.courseNumber}</td>
							<td class="coursePoint">${course.coursePoint}</td>
							<td class="courseName">${course.courseName}</td>
							<td class="courseProfessor">${course.courseProfessor}</td>
							<td class="courseTime">${course.courseTime}</td>
							<td class="courseLocation">${course.courseLocation}</td>
							<td><button class="courseSelect btn btn-primary">수강신청</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
			<table id="psy" style="display: none;" class="table table-hover table-condensed courseList">
				<caption class="text-left"><strong>심리학과<strong></caption>
				<thead>
					<tr>
						<th>학년</th>
						<th>종별</th>
						<th>단위</th>
						<th>학정번호</th>
						<th>학점</th>
						<th>교과목명</th>
						<th>담당교수</th>
						<th>강의시간</th>
						<th>강의실</th>
						<th> </th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${courses_psy}" var="course">
						<tr>
							<input type="hidden" id="${course.courseName}" value=0>
							<td class="courseGrade">${course.courseGrade}</td>
							<td class="courseType">${course.courseType}</td>
							<td class="courseLevel">${course.courseLevel}</td>
							<td class="courseNumber">${course.courseNumber}</td>
							<td class="coursePoint">${course.coursePoint}</td>
							<td class="courseName">${course.courseName}</td>
							<td class="courseProfessor">${course.courseProfessor}</td>
							<td class="courseTime">${course.courseTime}</td>
							<td class="courseLocation">${course.courseLocation}</td>
							<td><button class="courseSelect btn btn-primary">수강신청</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	
			<table id="chulhak" style="display: none;" class="table table-hover table-condensed courseList">
				<caption class="text-left"><strong>철학과<strong></caption>
				<thead>
					<tr>
						<th>학년</th>
						<th>종별</th>
						<th>단위</th>
						<th>학정번호</th>
						<th>학점</th>
						<th>교과목명</th>
						<th>담당교수</th>
						<th>강의시간</th>
						<th>강의실</th>
						<th> </th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${courses_chulhak}" var="course">
						<tr>
							<input type="hidden" id="${course.courseName}" value=0>
							<td class="courseGrade">${course.courseGrade}</td>
							<td class="courseType">${course.courseType}</td>
							<td class="courseLevel">${course.courseLevel}</td>
							<td class="courseNumber">${course.courseNumber}</td>
							<td class="coursePoint">${course.coursePoint}</td>
							<td class="courseName">${course.courseName}</td>
							<td class="courseProfessor">${course.courseProfessor}</td>
							<td class="courseTime">${course.courseTime}</td>
							<td class="courseLocation">${course.courseLocation}</td>
							<td><button class="courseSelect btn btn-primary">수강신청</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	
			<table id="money" style="display: none;" class="table table-hover table-condensed courseList">
				<caption class="text-left"><strong>경제학과<strong></caption>
				<thead>
					<tr>
						<th>학년</th>
						<th>종별</th>
						<th>단위</th>
						<th>학정번호</th>
						<th>학점</th>
						<th>교과목명</th>
						<th>담당교수</th>
						<th>강의시간</th>
						<th>강의실</th>
						<th> </th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${courses_money}" var="course">
						<tr>
							<input type="hidden" id="${course.courseName}" value=0>
							<td class="courseGrade">${course.courseGrade}</td>
							<td class="courseType">${course.courseType}</td>
							<td class="courseLevel">${course.courseLevel}</td>
							<td class="courseNumber">${course.courseNumber}</td>
							<td class="coursePoint">${course.coursePoint}</td>
							<td class="courseName">${course.courseName}</td>
							<td class="courseProfessor">${course.courseProfessor}</td>
							<td class="courseTime">${course.courseTime}</td>
							<td class="courseLocation">${course.courseLocation}</td>
							<td><button class="courseSelect btn btn-primary">수강신청</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	
			<table id="untong" style="display: none;" class="table table-hover table-condensed courseList">
				<caption class="text-left"><strong>응용통계학과<strong></caption>
				<thead>
					<tr>
						<th>학년</th>
						<th>종별</th>
						<th>단위</th>
						<th>학정번호</th>
						<th>학점</th>
						<th>교과목명</th>
						<th>담당교수</th>
						<th>강의시간</th>
						<th>강의실</th>
						<th> </th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${courses_untong}" var="course">
						<tr>
							<input type="hidden" id="${course.courseName}" value=0>
							<td class="courseGrade">${course.courseGrade}</td>
							<td class="courseType">${course.courseType}</td>
							<td class="courseLevel">${course.courseLevel}</td>
							<td class="courseNumber">${course.courseNumber}</td>
							<td class="coursePoint">${course.coursePoint}</td>
							<td class="courseName">${course.courseName}</td>
							<td class="courseProfessor">${course.courseProfessor}</td>
							<td class="courseTime">${course.courseTime}</td>
							<td class="courseLocation">${course.courseLocation}</td>
							<td><button class="courseSelect btn btn-primary">수강신청</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	
			<table id="jungchi" style="display: none;" class="table table-hover table-condensed courseList">
				<caption class="text-left"><strong>정치외교학과<strong></caption>
				<thead>
					<tr>
						<th>학년</th>
						<th>종별</th>
						<th>단위</th>
						<th>학정번호</th>
						<th>학점</th>
						<th>교과목명</th>
						<th>담당교수</th>
						<th>강의시간</th>
						<th>강의실</th>
						<th> </th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${courses_jungchi}" var="course">
						<tr>
							<input type="hidden" id="${course.courseName}" value=0>
							<td class="courseGrade">${course.courseGrade}</td>
							<td class="courseType">${course.courseType}</td>
							<td class="courseLevel">${course.courseLevel}</td>
							<td class="courseNumber">${course.courseNumber}</td>
							<td class="coursePoint">${course.coursePoint}</td>
							<td class="courseName">${course.courseName}</td>
							<td class="courseProfessor">${course.courseProfessor}</td>
							<td class="courseTime">${course.courseTime}</td>
							<td class="courseLocation">${course.courseLocation}</td>
							<td><button class="courseSelect btn btn-primary">수강신청</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	
			<table id="social" style="display: none;" class="table table-hover table-condensed courseList">
				<caption class="text-left"><strong>사회학과<strong></caption>
				<thead>
					<tr>
						<th>학년</th>
						<th>종별</th>
						<th>단위</th>
						<th>학정번호</th>
						<th>학점</th>
						<th>교과목명</th>
						<th>담당교수</th>
						<th>강의시간</th>
						<th>강의실</th>
						<th> </th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${courses_social}" var="course">
						<tr>
							<input type="hidden" id="${course.courseName}" value=0>
							<td class="courseGrade">${course.courseGrade}</td>
							<td class="courseType">${course.courseType}</td>
							<td class="courseLevel">${course.courseLevel}</td>
							<td class="courseNumber">${course.courseNumber}</td>
							<td class="coursePoint">${course.coursePoint}</td>
							<td class="courseName">${course.courseName}</td>
							<td class="courseProfessor">${course.courseProfessor}</td>
							<td class="courseTime">${course.courseTime}</td>
							<td class="courseLocation">${course.courseLocation}</td>
							<td><button class="courseSelect btn btn-primary">수강신청</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	
			<table id="press" style="display: none;" class="table table-hover table-condensed courseList">
				<caption class="text-left"><strong>언론홍보영상학부<strong></caption>
				<thead>
					<tr>
						<th>학년</th>
						<th>종별</th>
						<th>단위</th>
						<th>학정번호</th>
						<th>학점</th>
						<th>교과목명</th>
						<th>담당교수</th>
						<th>강의시간</th>
						<th>강의실</th>
						<th> </th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${courses_press}" var="course">
						<tr>
							<input type="hidden" id="${course.courseName}" value=0>
							<td class="courseGrade">${course.courseGrade}</td>
							<td class="courseType">${course.courseType}</td>
							<td class="courseLevel">${course.courseLevel}</td>
							<td class="courseNumber">${course.courseNumber}</td>
							<td class="coursePoint">${course.coursePoint}</td>
							<td class="courseName">${course.courseName}</td>
							<td class="courseProfessor">${course.courseProfessor}</td>
							<td class="courseTime">${course.courseTime}</td>
							<td class="courseLocation">${course.courseLocation}</td>
							<td><button class="courseSelect btn btn-primary">수강신청</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	
			<div>신청한 과목</div>
	
			<table id="selectedCourse" class="table">
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
			
		<div><button id="submit" class="btn" onclick="submit()">예비 수강신청 확정</button></div>
		</div>
		
		<script src="http://code.jquery.com/jquery.js"></script>
		<script src="js/bootstrap.min.js"></script>		
	</body>
</html>