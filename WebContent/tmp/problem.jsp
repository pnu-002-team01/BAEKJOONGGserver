<%@ page import="swTeam.BaekjoonCrawler_tmp,swTeam.Cookie, java.util.*" language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function change(event) {
		var event_test = event;
		document.getElementById("num2").value = event_test;
		document.getElementById("send").submit();
	}
</script>
<body>
	<form id="send" action="source.jsp" method="post">
	<input type="hidden" id="num2" name="source">
		<div style=\"line-height:130%\">
			<h2>제출한 소스</h2>
				<h3>
					<%
						Cookie ck = Cookie.getInstance();
						BaekjoonCrawler_tmp boj = new BaekjoonCrawler_tmp(ck.loginCookie);
						ArrayList<String> list = boj.getSourceList(ck.userID, request.getParameter("problem"));
						for ( int i = 0; i < list.size(); i++ )
							out.println(list.get(i));
					%>
				</h3>
			</div>
	</form>
</body>
</html>