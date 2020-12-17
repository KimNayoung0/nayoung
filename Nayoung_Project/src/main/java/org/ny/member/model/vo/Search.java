package org.ny.member.model.vo;

public class Search {

	private int start;
	private int end;
	private String keyword;

	public Search() {
		super();
	
	}

	public Search(int start, int end, String keyword) {
		super();
		this.start = start;
		this.end = end;
		this.keyword = keyword;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}
