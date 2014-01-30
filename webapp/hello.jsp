<%--
	Created By Jinwoo Kim, Yonghyeon Yoo
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>

<html>
	<head>

		<title>2014학년도 1학기 연세대학교 예비수강신청</title>
		
		<link rel="stylesheet" type="text/css" href="./css/hello_style.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Bootstrap -->
		<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">

		<script>
			function fill_check(){
			
				var id = document.getElementById("identification");
				var grade = document.getElementById("grade");
				var major = document.getElementById("major");
				var why = document.getElementById("why");
				var reCAPTCHA = document.getElementById("recaptcha_response_field");
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
				} else if (reCAPTCHA.value == "" || reCAPTCHA.value == null) {
					alert("자동가입방지 문자를 입력해 주시기 바랍니다.")
					return false;
				}
				return true;
			}

			function only_number() {
				if ((event.keyCode<48) || event.keyCode>57) {
					event.returnValue=false;
				}
			}

			var strings = [];

//			strings['recaptcha.instructions_visual'] = "<spring:message code='recaptcha.instructions_visual' javaScriptEscape='true'/>";
			strings['recaptcha.instructions_audio'] = "<spring:message code='recaptcha.instructions_audio' javaScriptEscape='true'/>";
			strings['recaptcha.play_again'] = "<spring:message code='recaptcha.play_again' javaScriptEscape='true'/>";
			strings['recaptcha.cant_hear_this'] = "<spring:message code='recaptcha.cant_hear_this' javaScriptEscape='true'/>";
			strings['recaptcha.visual_challenge'] = "<spring:message code='recaptcha.visual_challenge' javaScriptEscape='true'/>";
			strings['recaptcha.audio_challenge'] = "<spring:message code='recaptcha.audio_challenge' javaScriptEscape='true'/>";
			strings['recaptcha.refresh_btn'] = "<spring:message code='recaptcha.refresh_btn' javaScriptEscape='true'/>";
			strings['recaptcha.help_btn'] = "<spring:message code='recaptcha.help_btn' javaScriptEscape='true'/>";
			strings['recaptcha.incorrect_try_again'] = "<spring:message code='recaptcha.incorrect_try_again' javaScriptEscape='true'/>";

			var RecaptchaOptions = {
				custom_translations : {
//					instructions_visual :  strings['recaptcha.instructions_visual'] ,
					instructions_audio : strings['recaptcha.instructions_audio'],
					play_again : strings['recaptcha.play_again'],
					cant_hear_this : strings['recaptcha.cant_hear_this'],
					visual_challenge : strings['recaptcha.visual_challenge'],
					audio_challenge : strings['recaptcha.audio_challenge'],
					refresh_btn : strings['recaptcha.refresh_btn'],
					help_btn : strings['recaptcha.help_btn'],
					incorrect_try_again : strings['recaptcha.incorrect_try_again']
				},
				theme : 'clean'
			};

			window.onload = function() {
				if (document.getElementById("loginButton") != null) {
					document.getElementById("loginButton").addEventListener('click', login, false);
				}
			};
			
		</script>



	</head>

	<body>
		
		<div class="body">
			<div class="body_wrap identityContainer">
	
				<div class="title">
					<p>2014-1학기 연세대학교 예비수강신청</p>
				</div>
	
				<div id="loginForm_wrap">
	
					
					<div class="login_info">
			
						<form id="loginForm" action="/login" method="POST">
						<input type="hidden" name="remoteAddress" value="<%=request.getRemoteAddr()%>">
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
								<td class="column_style"><input class="form_style" style="font-size:18px" type="text" maxlength="15" onkeypress="only_number();" name="identification" id="identification" placeholder="20######## 또는 0#####" ></td>
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
							<div class="recaptcha">
							<%
								ReCaptcha c = ReCaptchaFactory.newReCaptcha("6LcTsu0SAAAAADAHy06hQNewZtK3RD_dUYWRNrIx",
										"6LcTsu0SAAAAAETYICm55vPzqT0VQ0rwzofYTvhY", false);
								out.println(c.createRecaptchaHtml(null, null));
							%>
							</div>
							<div class="submit_button_line">
								<input type="submit" class="submit_button_style" onclick="return fill_check();" value=" 예비 수강신청 하기 ">
							</div>
						</form>
					
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
					<img src="img/solution_logo.png" alt="Solution Logo">
				</div>
			</div>
		</div>
		
		<script src="http://code.jquery.com/jquery.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>