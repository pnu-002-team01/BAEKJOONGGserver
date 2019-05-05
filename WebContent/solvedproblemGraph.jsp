<%@ page language="java" contentType = "text/html; charset=UTF-8"
	pageEncoding ="UTF-8" %>
<%@ page import="datateam.*"%>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userId");
	BaekjoonCrawler bj = new BaekjoonCrawler(userid, "rlawngh2@");
%>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <script>
    function writeUserData(userId, updateDate, solved, solvedproblems, unsolved, unsolvedproblems) {
  	  firebase.database().ref('user/' + userId + '/' + updateDate).set({
  		  countSolvedProblems: solved,
  		  solvedProblems : solvedproblems,
  		  countUnsolvedProblems : unsolved,
  		  unsolvedProblems : unsolvedproblems
  	  });
  	}
		function start() {
	        // Initialize Firebase
	        var config = {
	            apiKey: "AIzaSyB13-gwgVjR75BjSPxBaMS5mEzTvePx4gE",
	            authDomain: "baekjoongg.firebaseapp.com",
	            databaseURL: "https://baekjoongg.firebaseio.com",
	            projectId: "baekjoongg",
	            storageBucket: "baekjoongg.appspot.com",
	            messagingSenderId: "284865530354"
	        };
	        firebase.initializeApp(config);
			
	        
	        var rootRef = firebase.database().ref();
			var userId = "<%=userid%>";
			<%
				ArrayList<String> tmp = bj.crawlSolvedProblem(userid);
				Iterator it = tmp.iterator();
			%>
			
	        var solved = [<%
				while(it.hasNext()) {
					out.println(it.next() + ",");
				}
	        %>];
	        
	        var unsolved = [
	        	<%
	        	String tmp2 = new String("\"");
	        	while(it.hasNext()) {
	        		tmp2.concat(it.next() + "\n");
	        	}
	        	tmp2.concat("\"");
	        	%>
	        ]
	        
	        document.getElementById("pref").innerHTML = unsolved;
	        
	        writeUserData(userId, updateDate, solved, solvedproblems, unsolved, unsolvedproblems);
	        
	        //1번 uid 비교
	        rootRef.child('user').child(userId).once('value', function(data){
				// user가 없다면 하지 않는다고 출력한다.
				if(data.exists() == false) {
					document.getElementById("pref").innerHTML = userId + "님의 정보가 없습니다.";
				}
				// user가 있으면 user의 7일 까지의 데이터를 출력한다
				else {
		    	    // Load the Visualization API and the piechart package.
		    	    google.charts.load('current', {'packages':['corechart']});
		    	
		    	    // Set a callback to run when the Google Visualization API is loaded.
		    	    google.charts.setOnLoadCallback(drawChart);
		    	
		    	    // Callback that creates and populates a data table, 
		    	    // instantiates the pie chart, passes in the data and
		    	    // draws it.
		    	    function drawChart() {
		    	
		    		    // Create the data table.
		    		    var t_data = new google.visualization.DataTable();
		    		    t_data.addColumn('string', 'date');
		    		    t_data.addColumn('number', 'solvedproblemNumber');
		    		    data.forEach(
							function(childData) {
								t_data.addRow([childData.key, childData.child('solvedproblemNumber').val()]);
							}
						);
		    		
		    		    // Set chart options
		    		    var options = {'title': userId + '의 최근 문제 푼 갯수',
		    		    				'legend' : {position: 'bottom'},
		    		                   'width':400,
		    		                   'height':300};
		    		
		    		    // Instantiate and draw our chart, passing in some options.
		    		    var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
		    		    chart.draw(t_data, options);
		    		    
		    		}

				}
			});

	        //2번 이메일 찾기
	        
/* 	        rootRef.child('user').child('Rche').once('value', function(data){
	            console.log('2번 :' , data.val());
	        });
	        //3번 3개만 가져오기
	        rootRef.child('user').limitToFirst(1).once('value', function(data){
	            console.log('3번 :' , data.val());
	        }); */
		}
		window.addEventListener("load", start, false);
    </script>
    <meta charset="EUC-KR">
    <title>푼 문제 갯수 그래프</title>
</head>
<body>
	<p id = "pref"></p>
	<div id="chart_div" style="width:400; height:300"></div>
	
	<a href="../BAEKJOON_GG/solvedproblemGraph.html">go to 푼 문제 검색 페이지</a>
</body>
</html>
