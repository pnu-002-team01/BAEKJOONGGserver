<%@ page import="swTeam.BaekjoonCrawler_tmp,swTeam.Cookie, java.util.*" language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BAEKJOON.GG</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<style type=text/css>
	#view-on {width: 150px; height: 30px;}
</style>
<body>
<%
	Cookie ck = Cookie.getInstance();
	BaekjoonCrawler_tmp boj = new BaekjoonCrawler_tmp(ck.loginCookie);
	String proNum = request.getParameter("problem");
	ArrayList<String> list = boj.getSourceList(ck.userID, proNum);
%>
<center>
<img alt="MainLogo" src="img/main_logo.png" width="650" height="220"><p>
	<div id="view-on" style="display:inline">
	<form action="codecompare.jsp" id="compare">
	<input type="text" id="code1" name="code1">
	<input type="submit" value="소스 비교">
	<input type="text" id="code2" name="code2">
	</form>
	</div>
	<form id="analy" action="analysis.jsp" method="post">
		<input type="hidden" id="source" name="source">
		<input type="hidden" id="type" name="type">
		<input type="hidden" id="pronum" name="pronum">
	</form>
	<form id="send" action="source.jsp" method="post">
	<input type="hidden" id="num2" name="source">
		<div style=\"line-height:130%\">
			<h2 class="text">제출한 소스</h2>
			<div class="container">
				<table class="table">
						<thead>
							<tr>
								<th>제출 번호</th>
								<th>결 과</th>
								<th>시 간</th>
								<th>언 어</th>
								<th>제출 시간</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<%
								for ( int i = 0; i < list.size(); i++ ) {
									out.println(list.get(i));
								}
							%>		
						</tbody>
				</table>
			</div>
			</div>
	</form>
</center>
</body>
<script type="text/javascript">
	var idx = 0;
	function change(event) {
		var event_test = event;
		document.getElementById("num2").value = event_test;
		document.getElementById("send").submit();
	}
	function analysis(event, n) {
		var event_test = event;
		var nn = n;
		var pro = <%=proNum%>;
		document.getElementById("source").value = event_test;
		document.getElementById("type").value = nn;
		document.getElementById("pronum").value = pro;
		document.getElementById("analy").submit();
	}
	function setcompare(event) {
		var event_test = event;
		if ( idx % 2 == 0 ) {
			document.getElementById("code1").value = event_test;
		} else {
			document.getElementById("code2").value = event_test;
		}
		idx++;
	}
</script>
</html>