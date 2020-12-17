package org.ny.board.model.vo;

import java.util.Date;

public class B_Comment {

	private int coCode;
	private int bCode;
	private String coWriter;
	private String coContent;
	private Date coRegDate;

	public B_Comment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getCoCode() {
		return coCode;
	}

	public void setCoCode(int coCode) {
		this.coCode = coCode;
	}

	public int getbCode() {
		return bCode;
	}

	public void setbCode(int bCode) {
		this.bCode = bCode;
	}

	public String getCoWriter() {
		return coWriter;
	}

	public void setCoWriter(String coWriter) {
		this.coWriter = coWriter;
	}

	public String getCoContent() {
		return coContent;
	}

	public void setCoContent(String coContent) {
		this.coContent = coContent;
	}

	public Date getCoRegDate() {
		return coRegDate;
	}

	public void setCoRegDate(Date coRegDate) {
		this.coRegDate = coRegDate;
	}

	public B_Comment(int coCode, int bCode, String coWriter, String coContent, Date coRegDate) {
		super();
		this.coCode = coCode;
		this.bCode = bCode;
		this.coWriter = coWriter;
		this.coContent = coContent;
		this.coRegDate = coRegDate;
	}

}
