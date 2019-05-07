 <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BAEKJOON.GG</title>
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>
	<center>
		<img alt="MainLogo" src="img/main_logo.png" width="650" height="220"><p>
		<form id="send" action="problems.jsp" method="post">
			<p>ID : <input type="text" placeholder="아이디를 입력하세요" name="id"></p>
			<p>PW : <input type="password" placeholder="비밀번호" name="pw"></p>
			<input type="submit" value="Login">
		</form>
	</center>
</body>
</html>