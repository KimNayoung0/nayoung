package org.ny.shop.model.vo;

import java.sql.Date;

public class Orders {

	private String oCode;
	private int gdsCode;
	private String userId;
	private Date oDate;
	private String oName;
	private int oPhon;
	private String oAddr1;
	private String oRequests;
	private int oPayment;
	private int amount;
	private String delivery;
	private String oAddr2;
	private String oAddr3;

	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Orders(String oCode, int gdsCode, String userId, Date oDate, String oName, int oPhon, String oAddr1,
			String oRequests, int oPayment, int amount, String delivery, String oAddr2, String oAddr3) {
		super();
		this.oCode = oCode;
		this.gdsCode = gdsCode;
		this.userId = userId;
		this.oDate = oDate;
		this.oName = oName;
		this.oPhon = oPhon;
		this.oAddr1 = oAddr1;
		this.oRequests = oRequests;
		this.oPayment = oPayment;
		this.amount = amount;
		this.delivery = delivery;
		this.oAddr2 = oAddr2;
		this.oAddr3 = oAddr3;
	}

	public String getoCode() {
		return oCode;
	}

	public void setoCode(String oCode) {
		this.oCode = oCode;
	}

	public int getGdsCode() {
		return gdsCode;
	}

	public void setGdsCode(int gdsCode) {
		this.gdsCode = gdsCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getoDate() {
		return oDate;
	}

	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}

	public String getoName() {
		return oName;
	}

	public void setoName(String oName) {
		this.oName = oName;
	}

	public int getoPhon() {
		return oPhon;
	}

	public void setoPhon(int oPhon) {
		this.oPhon = oPhon;
	}

	public String getoAddr1() {
		return oAddr1;
	}

	public void setoAddr1(String oAddr1) {
		this.oAddr1 = oAddr1;
	}

	public String getoRequests() {
		return oRequests;
	}

	public void setoRequests(String oRequests) {
		this.oRequests = oRequests;
	}

	public int getoPayment() {
		return oPayment;
	}

	public void setoPayment(int oPayment) {
		this.oPayment = oPayment;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
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

}
