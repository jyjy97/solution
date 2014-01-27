<%--
Created by Alek
Date: 11/22/13
Project: NEXToTo
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>

		<title>2014학년도 1학기 연세대학교 예비수강신청</title>

		<script>
			function fill_check(){
			
				var id = document.getElementById("identification");
				var grade = document.getElementById("grade");
				var major = document.getElementById("major");
				var why = document.getElementById("why");
				if (id.value == "" || id.value == null) {
					alert("학번을 입력해 주세요.");
					return false;
				} else if (grade.value == "" || grade.value == null) {
					alert("학년을 선택해 주세요.");
					return false;
				} else if (major.value == "" || major.value == null) {
					alert("전공을 선택해 주세요.");
					return false;
				} else if (why.value == "" || why.value == null) {
					alert("신청사유를 선택해 주세요.");
					return false;
				} else if (id.value.length != 6 && id.value.length != 10) {
					alert("학번은 숫자 6자리 또는 10자리로 되어있습니다. 다시 확인해 주시기 바랍니다.");
					return false;
				}
				return true;
			}


			window.onload = function() {
				if (document.getElementById("loginButton") != null) {
					document.getElementById("loginButton").addEventListener('click', login, false);
				}
			};
			
		</script>

		<link rel="stylesheet" type="text/css" href="./stylesheets/hello_style.css">
	</head>

	<body>
		
		<div class="body">
			<div class="body_wrap identityContainer">
	
				<div class="title">
					<h1>2014-1학기 연세대학교 예비수강신청</h1>
				</div>
	
				<div id="loginForm_wrap">
	
					
					<div class="login_info">
			
						<form id="loginForm" action="/login" method="POST">
						<table>
							<tr class="row_style">	
								<td class="column_style">주전공(학과)</td>
								<td class="column_style"><input class="form_style" type="text" name="major" id="major"  placeholder=" 예) 경제학과"></td>
							</tr>
							
							<tr class="row_style">
								<td class="column_style">학 년<br>(2014년 1학기에 해당하는 학년)</td>	
								<td class="column_style">
									<select class="form_style" name="grade" id="grade">
										<option value="">-- 학년 --</option>
										<option value="2">2 학년</option>
										<option value="3">3 학년</option>
										<option value="4">4 학년</option>
									</select>
								</td>
							</tr>
							
							<tr class="row_style">
								<td class="column_style">학 번</td>
								<td class="column_style"><input class="form_style" style="font-size:18px" type="text" maxlength="15" name="identification" id="identification" placeholder="20######## 또는 0#####" ></td>
							</tr>
	
							<tr class="row_style">
								<td class="column_style">신청 사유</td>
								<td class="column_style">
									<select class="form_style" name="why" id="why">
										<option value="">-- 수강 목적 --</option>
										<option value="main">본전공</option>
										<option value="multi">복수(이중)전공</option>
										<option value="part">부전공</option>
										<option value="other">기타</option>
									</select>
								</td>
							</tr>
							
						</table>	
						</form>
					
					</div>
						
					<div class="submit_button_line">
						<input type="submit" class="submit_button_style" onclick="return fill_check();" value=" 예비 수강신청 하기 ">
					</div>
					
				</div>
			</div>
	
			<div>
	
				<div class="notice">
					<div class="notice_title">
						&lt; 안 내 문 &gt;
					</div>
					<div class="notice_content">
						본 예비수강신청은 학생들이 미리 수강신청을 해볼 수 있도록 하여 수요에 비해 TO가 적은 수업들을 조사하고, 그러한 수업들에 대해 유동적으로 TO를 조절하려는 목적으로 진행됩니다. 수요의 허수를 줄이기 위해 9학점까지만 예비수강신청을 할 수 있으며, 더불어 학우 여러분들께서도 반드시 수강하고 싶은 전공에만 수강신청을 부탁 드립니다.
					</div>
				</div>
	
				<div class="solution_logo">
					<img src="./images/solution_logo.png" alt="Solution Logo">
				</div>
			</div>
		</div>
		
	</body>
</html>