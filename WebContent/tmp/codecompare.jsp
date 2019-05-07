<%@ page import="swTeam.BaekjoonCrawler_tmp,swTeam.Cookie, swTeam.CodeCompare, swTeam.SourceAnalysis, java.util.*" language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Cookie ck = Cookie.getInstance();
	BaekjoonCrawler_tmp boj = new BaekjoonCrawler_tmp(ck.loginCookie);
	String code1 = boj.getSource(request.getParameter("code1"));
	String code2 = boj.getSource(request.getParameter("code2"));
	CodeCompare cp = new CodeCompare(code1, code2);
%>
<div style="display:inline;" width="1000" height="1000" >
<div>
<%
out.print(cp.printCode(0));
%>
</div>
<div>
<%
out.print(cp.printCode(1));
%>
</div>
</div>
</body>
</html>