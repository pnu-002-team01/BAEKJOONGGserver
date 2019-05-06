package web;

import java.sql.*;
import java.util.*;
// jsp에서 쓸 때 먼저 db 객체를 만들어서 db 연결을 수립
// db.selectUserInformations로 user의 원하는 정보 들고오고
// db.getClosed()로 수립된 연결 해제
public class Database {
	private Connection con = null;
	private final String DBNAME = "postgres";
	private final String PASSWORD = "rlawngh2@";
	
	// constructor
	public Database() {
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5434/postgres", DBNAME, PASSWORD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("error occured");
			e.printStackTrace();
		}
	}
	// db 연결 해제
	public void getClosed() {
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// 정보 받아오기
	public ArrayList<String[]> readUserdata(final String userID, final String infoType) {
		ArrayList<String[]> ret = new ArrayList<String[]>();
		try {
			Statement stmt = con.createStatement();
			String selectSQL = "SELECT date, list, numberofproblem\r\n" + 
					"FROM " + infoType + "\r\n" + 
					"WHERE userid = \'" + userID + "\'\r\n" + 
					"ORDER BY date DESC\r\n" + 
					"LIMIT 30;";
			ResultSet resultSet = stmt.executeQuery(selectSQL);
			while(resultSet.next()) {
				ret.add(new String[] {resultSet.getString("date"), resultSet.getString("list"), resultSet.getString("numberofproblem")});
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			ret.clear();
			e.printStackTrace();
		}
		return ret;
	}

}