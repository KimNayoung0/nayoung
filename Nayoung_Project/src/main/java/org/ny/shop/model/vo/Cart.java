package org.ny.shop.model.vo;

import java.util.Date;

public class Cart {
	private int cCode;
	private String userId;
	private int gdsCode;
	private int cQt;
	private Date cDate;

	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Cart(int cCode, String userId, int gdsCode, int cQt, Date cDate) {
		super();
		this.cCode = cCode;
		this.userId = userId;
		this.gdsCode = gdsCode;
		this.cQt = cQt;
		this.cDate = cDate;
	}

	public int getcCode() {
		return cCode;
	}

	public void setcCode(int cCode) {
		this.cCode = cCode;
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

	public int getcQt() {
		return cQt;
	}

	public void setcQt(int cQt) {
		this.cQt = cQt;
	}

	public Date getcDate() {
		return cDate;
	}

	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

}
