package org.ny.shop.model.vo;

import java.util.Date;

public class CartList {
	private int cCode;
	private String userId;
	private int gdsCode;
	private int cQt;
	private Date cDate;

	private int num;
	private String gdsName;
	private int gdsPrice;
	private String gdsThumbImg;

	public CartList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CartList(int cCode, String userId, int gdsCode, int cQt, Date cDate, int num, String gdsName, int gdsPrice,
			String gdsThumbImg) {
		super();
		this.cCode = cCode;
		this.userId = userId;
		this.gdsCode = gdsCode;
		this.cQt = cQt;
		this.cDate = cDate;
		this.num = num;
		this.gdsName = gdsName;
		this.gdsPrice = gdsPrice;
		this.gdsThumbImg = gdsThumbImg;
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

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getGdsName() {
		return gdsName;
	}

	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}

	public int getGdsPrice() {
		return gdsPrice;
	}

	public void setGdsPrice(int gdsPrice) {
		this.gdsPrice = gdsPrice;
	}

	public String getGdsThumbImg() {
		return gdsThumbImg;
	}

	public void setGdsThumbImg(String gdsThumbImg) {
		this.gdsThumbImg = gdsThumbImg;
	}

}
