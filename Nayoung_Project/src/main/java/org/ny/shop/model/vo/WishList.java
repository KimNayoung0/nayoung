package org.ny.shop.model.vo;

public class WishList {

	private int wCode;
	private String userId;
	private int gdsCode;

	public WishList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public WishList(int wCode, String userId, int gdsCode) {
		super();
		this.wCode = wCode;
		this.userId = userId;
		this.gdsCode = gdsCode;
	}

	public int getwCode() {
		return wCode;
	}

	public void setwCode(int wCode) {
		this.wCode = wCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getGdsCode() {
		return gdsCode;
	}

	public void setGdsCode(int gdsCode) {
		this.gdsCode = gdsCode;
	}

}
