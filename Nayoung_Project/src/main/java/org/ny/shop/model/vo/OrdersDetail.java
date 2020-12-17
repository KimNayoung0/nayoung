package org.ny.shop.model.vo;

public class OrdersDetail {

	private int odCode;
	private String oCode;
	private int gdsCode;
	private int odQt;

	public OrdersDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrdersDetail(int odCode, String oCode, int gdsCode, int odQt) {
		super();
		this.odCode = odCode;
		this.oCode = oCode;
		this.gdsCode = gdsCode;
		this.odQt = odQt;
	}

	public int getOdCode() {
		return odCode;
	}

	public void setOdCode(int odCode) {
		this.odCode = odCode;
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

	public int getOdQt() {
		return odQt;
	}

	public void setOdQt(int odQt) {
		this.odQt = odQt;
	}

}
