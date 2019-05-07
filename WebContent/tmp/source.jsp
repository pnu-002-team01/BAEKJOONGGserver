<%@ page import="swTeam.BaekjoonCrawler_tmp,swTeam.Cookie, java.util.*" language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<textarea rows="50" cols="150">
<%
	Cookie ck = Cookie.getInstance();
	BaekjoonCrawler_tmp boj = new BaekjoonCrawler_tmp(ck.loginCookie);
	out.println(boj.getSource(request.getParameter("source")));
%>
</textarea>
</body>
</html>