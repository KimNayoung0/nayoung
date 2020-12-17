package org.ny.board.model.vo;

import java.sql.Date;

public class B_File {

	private int fCode;
	private int bCode;
	private String orgFileName;
	private String storedFileName;
	private int fileSize;
	private Date regDate;
	private String delGb;

	public B_File() {
		super();
		// TODO Auto-generated constructor stub
	}

	public B_File(int fCode, int bCode, String orgFileName, String storedFileName, int fileSize, Date regDate,
			String delGb) {
		super();
		this.fCode = fCode;
		this.bCode = bCode;
		this.orgFileName = orgFileName;
		this.storedFileName = storedFileName;
		this.fileSize = fileSize;
		this.regDate = regDate;
		this.delGb = delGb;
	}

	public int getfCode() {
		return fCode;
	}

	public void setfCode(int fCode) {
		this.fCode = fCode;
	}

	public int getbCode() {
		return bCode;
	}

	public void setbCode(int bCode) {
		this.bCode = bCode;
	}

	public String getOrgFileName() {
		return orgFileName;
	}

	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}

	public String getStoredFileName() {
		return storedFileName;
	}

	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getDelGb() {
		return delGb;
	}

	public void setDelGb(String delGb) {
		this.delGb = delGb;
	}

}
