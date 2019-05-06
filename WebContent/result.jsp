<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"
    import = "org.jsoup.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
Document doc = Jsoup.connect("http://www.naver.com").get();
String s = doc.toString();


%>
<%=s %>

</body>
</html>