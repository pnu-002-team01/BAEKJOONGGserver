<%@ page import="swTeam.BaekjoonCrawler_tmp,swTeam.Cookie, java.util.*" language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function change(val) {
		var value = val;
		document.getElementById("problem").value = value;
		document.getElementById("send").submit();
	}
</script>
<body>
	<center>
		<img alt="MainLogo" src="img/main_logo.png" width="650" height="220"><p>
			<%
				String id = request.getParameter("id").toString();
				String pw = request.getParameter("pw").toString();
			%>
		<form action="sourcelist.jsp" id="send" method="post">
			<input type="hidden" name="problem" id="problem">
			<div style=\"line-height:130%\">
				<h2>내가 푼 문제</h2>
					<h3>
						<%
							BaekjoonCrawler_tmp boj = new BaekjoonCrawler_tmp(id, pw);
							Cookie ck = Cookie.getInstance();
							ck.setCookie(boj.getCookie());
							ck.setUserId(boj.getuserID());
							ArrayList<String> problems = boj.crawlSolvedProblem(ck.userID);
							for ( int i = 0; i < problems.size(); i++ )
								out.print(problems.get(i)+"\t");
						%>
					</h3>
				</div>
		</form>
	</center>
</body>
</html>