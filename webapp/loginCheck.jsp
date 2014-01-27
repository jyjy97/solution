<%--
	Created By Jinwoo Kim, Yongheon Yoo
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title></title>
	<script>
		function getParameter(name) {
			search = location.search;
			if (!search) {
				//파라미터가 하나도 없을때
				document.write("에러 출력 텍스트");
				return false;
			}
			search = search.split("?");
			data = search[1].split("=");
			if (search[1].indexOf(name) == (-1) || data[0] != name) {
				//해당하는 파라미터가 없을때.
				return "";
				return;
			}
			if (search[1].indexOf("&") == (-1)) {
				//한개의 파라미터일때.
				data = search[1].split("=");
				return data[1];
			} else {
				//여러개의 파라미터 일때.
				data = search[1].split("&");  //엠퍼센트로 자름.
				for (i = 0; i <= data.length - 1; i++) {
					l_data = data[i].split("=");
					if (l_data[0] == name) {
						return l_data[1];
						break;
					} else {
						;
					}
				}
			}
		}

		window.onload = function() {
			if (getParameter("status")=="ok") {
				location.href='/enrollment';
			}
			else if (getParameter("status")=="duplicate") {
				var conf = confirm("이 학번은 이미 수강신청을 하신 상태입니다.\n다시 수강신청을 하시면 기존 데이터는 삭제됩니다.\n계속 하시겠습니까?");
				if (conf) {
					location.href='/enrollment';
				} else {
					location.href='/';
				}
			}
			else {
				location.href='/';
			}
		}
	</script>
</head>
<body>

</body>
</html>