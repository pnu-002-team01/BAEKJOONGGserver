package web;

import java.sql.*;

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
			System.out.println("helloworld");
			e.printStackTrace();
		}
	}
	
	public void getClosed() {
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String selectUserInformations(final String userID, final String infoType) {
		String ret = "";
		try {
			Statement stmt = con.createStatement();
			String selectSQL = "SELECT * FROM Users WHERE userid=" + "\'" + userID + "\';";
			ResultSet resultSet = stmt.executeQuery(selectSQL);
			while(resultSet.next()) {
				ret = ret.concat(resultSet.getString(infoType));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			ret = userID + "님의 정보가 없습니다.";
			e.printStackTrace();
		}
		return ret;
	}
	// jsp에서 쓸 때 먼저 db 객체를 만들어서 db 연결을 수립
	// db.selectUserInformations로 user의 원하는 정보 들고오고
	// db.getClosed()로 수립된 연결 해제
	public static void main(String[] args) {
		Database db = new Database();
		String ans1 = db.selectUserInformations("ksaid0203", "solvedproblem");
		String ans2 = db.selectUserInformations("ksaid0203", "unsolvedproblem");
		System.out.println(ans1);
		System.out.println(ans2);
		db.getClosed();
	}
}