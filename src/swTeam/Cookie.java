package swTeam;

import java.util.Map;

public class Cookie {
	
	private static Cookie cookie = new Cookie();
	public Map<String, String> loginCookie;
	public String userID;
	
	private Cookie() {
	}
	
	public void setCookie(Map<String, String> cookie) {
		this.loginCookie = cookie;
	}
	
	public void setUserId(String userId) {
		this.userID = userId;
	}
	
	public static Cookie getInstance() {
		return cookie;
	}
}
