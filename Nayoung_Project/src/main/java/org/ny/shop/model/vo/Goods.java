package org.ny.shop.model.vo;

import java.sql.Date;

public class Goods {

	private int gdsCode;
	private String gdsCate;
	private String gdsName;
	private String gdsPrice;
	private int gdsStock;
	private String gdsImg;
	private String gdsDetail;
	private Date gdsDate;
	private int gdsSell;
	private String gdsThumbImg;

	public Goods() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Goods(int gdsCode, String gdsCate, String gdsName, String gdsPrice, int gdsStock, String gdsImg,
			String gdsDetail, Date gdsDate, int gdsSell, String gdsThumbImg) {
		super();
		this.gdsCode = gdsCode;
		this.gdsCate = gdsCate;
		this.gdsName = gdsName;
		this.gdsPrice = gdsPrice;
		this.gdsStock = gdsStock;
		this.gdsImg = gdsImg;
		this.gdsDetail = gdsDetail;
		this.gdsDate = gdsDate;
		this.gdsSell = gdsSell;
		this.gdsThumbImg = gdsThumbImg;
	}

	public int getGdsCode() {
		return gdsCode;
	}

	public void setGdsCode(int gdsCode) {
		this.gdsCode = gdsCode;
	}

	public String getGdsCate() {
		return gdsCate;
	}

	public void setGdsCate(String gdsCate) {
		this.gdsCate = gdsCate;
	}

	public String getGdsName() {
		return gdsName;
	}

	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}

	public String getGdsPrice() {
		return gdsPrice;
	}

	public void setGdsPrice(String gdsPrice) {
		this.gdsPrice = gdsPrice;
	}

	public int getGdsStock() {
		return gdsStock;
	}

	public void setGdsStock(int gdsStock) {
		this.gdsStock = gdsStock;
	}

	public String getGdsImg() {
		return gdsImg;
	}

	public void setGdsImg(String gdsImg) {
		this.gdsImg = gdsImg;
	}

	public String getGdsDetail() {
		return gdsDetail;
	}

	public void setGdsDetail(String gdsDetail) {
		this.gdsDetail = gdsDetail;
	}

	public Date getGdsDate() {
		return gdsDate;
	}

	public void setGdsDate(Date gdsDate) {
		this.gdsDate = gdsDate;
	}

	public int getGdsSell() {
		return gdsSell;
	}

	public void setGdsSell(int gdsSell) {
		this.gdsSell = gdsSell;
	}

	public String getGdsThumbImg() {
		return gdsThumbImg;
	}

	public void setGdsThumbImg(String gdsThumbImg) {
		this.gdsThumbImg = gdsThumbImg;
	}

}
