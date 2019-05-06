 <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BAEKJOON.GG</title>
<link rel="stylesheet" href="css/bootstrap.css">
<!-- 
<script type="text/javascript">
function input(){
	var userId1 = document.getElementById("userId1").value;
	document.getElementById("ret").value = userId1;
}
</script>
 -->

</head> 
<body>
<center>
<a href="input.jsp"><img alt="MainLogo" src="img/main_logo.png" width="650" height="220"></a><p>
<%
	String id = request.getParameter("userId");
%>
<p class="text-right"><%=id %>님 반갑습니다</p>
<h3>문제수 비교하기</h3>
 <form method="get" action="testServlet">
첫 번째 유저 아이디 <input type="text" name="userId1">
두 번째 유저 아이디 <input type="text" name="userId2">
<button type="submit" class="btn btn-primary">확인</button>
 </form>
 </center>
 <br>
 <div class="container">
 <table class="table">
 	<thead>
 	<tr>
 		<th>번호</th>
 		<th>제목</th>
 		<th>작성자</th>
 		<th>날짜</th>
 		<th>조회수</th>
 	</tr>
 	</thead>
 	<tbody>
 	<tr>
 		<td>165</td>
 		<td>★☆★☆★ K번째 수 FAQ ★☆★☆★</td>
 		<td>djm03178</td>
 		<td>2019.05.06</td>
 		<td>3</td>
 	</tr>
 	<tr>
 		<td>166</td>
 		<td>c] 런타임 에러 질문합니다</td>
 		<td>dlqudgus2587</td>
 		<td>2019.05.06</td>
 		<td>6</td>
 	</tr>
 	<tr>
 		<td>167</td>
 		<td>max_element 쓰면 터지는 이유?[코드 있음]</td>
 		<td>herdson</td>
 		<td>2019.05.06</td>
 		<td>8</td>
 	</tr>
 	</tbody>
 </table>
 <hr/>
 <a class="btn btn-default pull-right">글쓰기</a>
 <div class="text-center">
 	<ul class="pagination">
 		<li><a herf="#">1</a></li>
 		<li><a herf="#">2</a></li>
 		<li><a herf="#">3</a></li>
 		<li><a herf="#">4</a></li>
 		<li><a herf="#">5</a></li>
 	</ul>
 </div>
</div>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <script type="text/javascript" src="js/bootstrap.js"></script>
</body> 

</html>


