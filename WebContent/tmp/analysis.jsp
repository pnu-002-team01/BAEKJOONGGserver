<%@ page import="swTeam.BaekjoonCrawler_tmp,swTeam.Cookie, swTeam.SourceAnalysis, java.util.*" language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<textarea rows="30" cols="120">
<%
	Cookie ck = Cookie.getInstance();
	BaekjoonCrawler_tmp boj = new BaekjoonCrawler_tmp(ck.loginCookie);
	SourceAnalysis sa = new SourceAnalysis(request.getParameter("type"));
	out.print(sa.Analysis(ck.userID, request.getParameter("pronum"), boj.getSource(request.getParameter("source"))));
%>
</textarea>
</body>
</html>