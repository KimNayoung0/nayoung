package org.ny.shop.model.vo;

import java.util.Date;

public class OrderList {

	private String oCode;
	private String userId;
	private String oName;
	private String oAddr1;
	private String oPhon;
	private int amount;
	private Date oDate;
	private String delivery;
	private String oAddr2;
	private String oAddr3;

	private int odCode;
	private int gdsCode;
	private int odQt;

	private String gdsName;
	private String gdsThumbImg;
	private int gdsPrice;

	public OrderList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderList(String oCode, String userId, String oName, String oAddr1, String oPhon, int amount, Date oDate,
			String delivery, String oAddr2, String oAddr3, int odCode, int gdsCode, int odQt, String gdsName,
			String gdsThumbImg, int gdsPrice) {
		super();
		this.oCode = oCode;
		this.userId = userId;
		this.oName = oName;
		this.oAddr1 = oAddr1;
		this.oPhon = oPhon;
		this.amount = amount;
		this.oDate = oDate;
		this.delivery = delivery;
		this.oAddr2 = oAddr2;
		this.oAddr3 = oAddr3;
		this.odCode = odCode;
		this.gdsCode = gdsCode;
		this.odQt = odQt;
		this.gdsName = gdsName;
		this.gdsThumbImg = gdsThumbImg;
		this.gdsPrice = gdsPrice;
	}

	public String getoCode() {
		return oCode;
	}

	public void setoCode(String oCode) {
		this.oCode = oCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getoName() {
		return oName;
	}

	public void setoName(String oName) {
		this.oName = oName;
	}

	public String getoAddr1() {
		return oAddr1;
	}

	public void setoAddr1(String oAddr1) {
		this.oAddr1 = oAddr1;
	}

	public String getoPhon() {
		return oPhon;
	}

	public void setoPhon(String oPhon) {
		this.oPhon = oPhon;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Date getoDate() {
		return oDate;
	}

	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public String getoAddr2() {
		return oAddr2;
	}

	public void setoAddr2(String oAddr2) {
		this.oAddr2 = oAddr2;
	}

	public String getoAddr3() {
		return oAddr3;
	}

	public void setoAddr3(String oAddr3) {
		this.oAddr3 = oAddr3;
	}

	public int getOdCode() {
		return odCode;
	}

	public void setOdCode(int odCode) {
		this.odCode = odCode;
	}

	public int getGdsCode() {
		return gdsCode;
	}

	public void setGdsCode(int gdsCode) {
		this.gdsCode = gdsCode;
	}

	public int getOdQt() {
		return odQt;
	}

	public void setOdQt(int odQt) {
		this.odQt = odQt;
	}

	public String getGdsName() {
		return gdsName;
	}

	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}

	public String getGdsThumbImg() {
		return gdsThumbImg;
	}

	public void setGdsThumbImg(String gdsThumbImg) {
		this.gdsThumbImg = gdsThumbImg;
	}

	public int getGdsPrice() {
		return gdsPrice;
	}

	public void setGdsPrice(int gdsPrice) {
		this.gdsPrice = gdsPrice;
	}

}
