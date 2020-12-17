package org.ny.member.model.vo;

import java.sql.Date;

public class Member {

	private String userId;
	private String userPw;
	private String userName;
	private int userPhon;
	private String userEmail;
	private String userAddr1;
	private Date regDate;
	private int verify;
	private String userAddr2;
	private String userAddr3;

	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(String userId, String userPw, String userName, int userPhon, String userEmail, String userAddr1,
			Date regDate, int verify, String userAddr2, String userAddr3) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userPhon = userPhon;
		this.userEmail = userEmail;
		this.userAddr1 = userAddr1;
		this.regDate = regDate;
		this.verify = verify;
		this.userAddr2 = userAddr2;
		this.userAddr3 = userAddr3;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserPhon() {
		return userPhon;
	}

	public void setUserPhon(int userPhon) {
		this.userPhon = userPhon;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserAddr1() {
		return userAddr1;
	}

	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getVerify() {
		return verify;
	}

	public void setVerify(int verify) {
		this.verify = verify;
	}

	public String getUserAddr2() {
		return userAddr2;
	}

	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}

	public String getUserAddr3() {
		return userAddr3;
	}

	public void setUserAddr3(String userAddr3) {
		this.userAddr3 = userAddr3;
	}

}
