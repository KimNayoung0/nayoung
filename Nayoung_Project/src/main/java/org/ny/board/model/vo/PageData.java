package org.ny.board.model.vo;

import java.util.ArrayList;

public class PageData {

	private ArrayList<Board> pageList;
	private String pageNavi;
	private ArrayList<B_Comment> commentList;

	public PageData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ArrayList<Board> getPageList() {
		return pageList;
	}

	public void setPageList(ArrayList<Board> pageList) {
		this.pageList = pageList;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

	public ArrayList<B_Comment> getCommentList() {
		return commentList;
	}

	public void setCommentList(ArrayList<B_Comment> commentList) {
		this.commentList = commentList;
	}

	public PageData(ArrayList<Board> pageList, String pageNavi, ArrayList<B_Comment> commentList) {
		super();
		this.pageList = pageList;
		this.pageNavi = pageNavi;
		this.commentList = commentList;
	}

}
