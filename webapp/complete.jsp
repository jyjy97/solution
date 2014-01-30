<%--
	Created By Jinwoo Kim, Yonghyeon Yoo
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>연세대학교 예비 수강 신청</title>

	<link rel="stylesheet" type="text/css" href="./stylesheets/complete_style.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Bootstrap -->
	<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">

	<script language="JavaScript">
		tid = setInterval("change()", 5*1000);
		function change()
		{
			document.location.href="http://solutionyonsei.ac.kr";
		}
	</script>
	<% session = request.getSession(false);
		if(session != null) {
			session.invalidate();
		}
	%>
</head>

	<body>
		<div class="container">
			<br>
			<div class="hero-unit">
				<p class="lead">소중한 시간을 내어주셔서 감사합니다.</p>
				<p>제51대 총학생회 Solution은 여러분의 교육권을 지키기 위해 항상 노력하겠습니다.<p></p>
				<br>
				<p>문의사항은<p>
				<br>
				<p>총학생회 홈페이지 : <a href="http://solutionyonsei.ac.kr" target="_blank">https://solutionyonsei.ac.kr</a></p>
				<p>총학생회 페이스북 : <a href="https://www.facebook.com/solution51" target="_blank">https://www.facebook.com/solution51</a></p>
				<br>
				<p>로 문의주시길 바랍니다.</p>
				<br>
				<p>이 페이지는 5 초후 자동으로 총학생회 홈페이지로 이동합니다.</p>
			</div>
			<hr>
			<footer class="footer text-center">
				<img src="img/solution_logo.png" alt="Solution Logo">
			</footer>
		</div>
		<script src="http://code.jquery.com/jquery.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>