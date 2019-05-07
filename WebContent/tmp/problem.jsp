<%@ page import="swTeam.BaekjoonCrawler_tmp,swTeam.Cookie, java.util.*" language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BAEKJOON.GG</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<script type="text/javascript">
	function change(event) {
		var event_test = event;
		document.getElementById("num2").value = event_test;
		document.getElementById("send").submit();
	}
</script>
<body>
<center>
<img alt="MainLogo" src="img/main_logo.png" width="650" height="220"><p>
	<form id="send" action="source.jsp" method="post">
	<input type="hidden" id="num2" name="source">
		<div style=\"line-height:130%\">
			<h2>제출한 소스</h2>
			<div class="container">
				<table class="table">
						<thead>
							<tr>
								<th>제출 번호</th>
								<th>결 과</th>
								<th>시 간</th>
								<th>언 어</th>
								<th>제출 시간</th>
							</tr>
						</thead>
						<tbody>
							<%
								Cookie ck = Cookie.getInstance();
								BaekjoonCrawler_tmp boj = new BaekjoonCrawler_tmp(ck.loginCookie);
								ArrayList<String> list = boj.getSourceList(ck.userID, request.getParameter("problem"));
								for ( int i = 0; i < list.size(); i++ ) {
									out.println(list.get(i));
									System.out.println(list.get(i));
								}
							%>		
						</tbody>
				</table>
			</div>
			</div>
	</form>
</center>
</body>
</html>