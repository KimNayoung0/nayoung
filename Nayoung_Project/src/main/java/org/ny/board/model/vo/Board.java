package org.ny.board.model.vo;

import java.sql.Date;

public class Board {
	private int bCode;
	private String bTitle;
	private String bWriter;
	private String bContent;
	private String bSecret;
	private Date bRegDate;
	private String bPw;
	private String bFile;
	private int bHit;

	public int getbCode() {
		return bCode;
	}

	public void setbCode(int bCode) {
		this.bCode = bCode;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbSecret() {
		return bSecret;
	}

	public void setbSecret(String bSecret) {
		this.bSecret = bSecret;
	}

	public Date getbRegDate() {
		return bRegDate;
	}

	public void setbRegDate(Date bRegDate) {
		this.bRegDate = bRegDate;
	}

	public String getbPw() {
		return bPw;
	}

	public void setbPw(String bPw) {
		this.bPw = bPw;
	}

	public String getbFile() {
		return bFile;
	}

	public void setbFile(String bFile) {
		this.bFile = bFile;
	}

	public int getbHit() {
		return bHit;
	}

	public void setbHit(int bHit) {
		this.bHit = bHit;
	}

	public Board(int bCode, String bTitle, String bWriter, String bContent, String bSecret, Date bRegDate, String bPw,
			String bFile, int bHit) {
		super();
		this.bCode = bCode;
		this.bTitle = bTitle;
		this.bWriter = bWriter;
		this.bContent = bContent;
		this.bSecret = bSecret;
		this.bRegDate = bRegDate;
		this.bPw = bPw;
		this.bFile = bFile;
		this.bHit = bHit;
	}

	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

}
