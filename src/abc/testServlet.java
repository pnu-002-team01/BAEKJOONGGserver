package abc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

@WebServlet("/testServlet")
public class testServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public testServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId1 = request.getParameter("userId1");
		String userId2 = request.getParameter("userId2");
		ArrayList<String>[] list = new ArrayList[2];
		 for(int i = 0; i < 2; i++) {
			 list[i] = new ArrayList<String>();
		 }
		List<String> userIDs = new ArrayList<String>();
		userIDs.add(userId1);userIDs.add(userId2);
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		String htmlResponse = "<html><head><link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\"></head><body><h1>";
		
		List<String> interList;
		List<String> uniList;
		try {
			for (int i = 0; i < 2; ++i) {
				String connUrl = "http://www.acmicpc.net/user/" + userIDs.get(i);
				Document doc = Jsoup.connect(connUrl).get();	
				Element CorrectNum = doc.select(".panel-body").first();
				Elements problems = CorrectNum.select(".panel-body").select(".problem_number");
				for (Element e : problems) {
					list[i].add(e.select("a").text().toString());
				}
			}
			
//			List<String> interList = new testServlet().intersection(list[0], list[1]);
//			List<String> uniList = new testServlet().union(list[0], list[1]);
			htmlResponse += "</h1><br><div style=\"line-height:130%\"> ";
			
			interList = new testServlet().intersection(list[0], list[1]);
			list[0].removeAll(interList);
			list[1].removeAll(interList);
			htmlResponse += "<h2>"+userIDs.get(0)+"와 "+userIDs.get(1)+"같이 푼 문제"+"</h2><h3>";
			for(String s : interList)
				htmlResponse += s+" ";
			htmlResponse += "</h3><br>";
			
			htmlResponse += "<h2>"+userIDs.get(0)+"만 푼 문제 </h2><h3>";
			for(String s : list[0])
				htmlResponse += s+" ";
			htmlResponse += "</h3><br>";
			htmlResponse += "<h2>"+userIDs.get(1)+"만 푼 문제 </h2><h3>";
			for(String s : list[1])
				htmlResponse += s+" ";
			htmlResponse += "</h3><br>";
			
		}catch(Exception e) {
			out.print(e);
		}
		htmlResponse += "</div></body></html>";
		out.println(htmlResponse);
	}
	
	public <T> List<T> union(List<T> list1, List<T> list2) { // 합집합 메소드
        Set<T> set = new HashSet<T>(); 
        set.addAll(list1);
        set.addAll(list2); 
        return new ArrayList<T>(set);
    }

    public <T> List<T> intersection(List<T> list1, List<T> list2) {
        List<T> list = new ArrayList<T>(); 
        for (T t : list1) {
            if (list2.contains(t)) {
                list.add(t);
            }
        } 
        return list;
    }
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		response.setContentType("text/html;charset=UTF-8");
		String userID = request.getParameter("userId");
		String userPW = request.getParameter("password");
		PrintWriter out = response.getWriter();
		BaekjoonCrawler bojcrawl = new BaekjoonCrawler(userID,userPW);
		if(bojcrawl.loginState == true) {
			out.println("<script>");
			out.println("alert('"+userID + "님 환영합니다')");
			out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("input.jsp");
			rd.forward(request, response);

		}
		else {
			out.println("<script>");
			out.println("alert('로그인에 실패하셨습니다')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

}
