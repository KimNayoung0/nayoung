package org.ny.member.model.vo;

import java.util.ArrayList;

import org.ny.board.model.vo.B_Comment;
import org.ny.board.model.vo.Board;

public class MemberPageData {

	private ArrayList<Member> pageList;
	private String pageNavi;

	public MemberPageData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberPageData(ArrayList<Member> pageList, String pageNavi) {
		super();
		this.pageList = pageList;
		this.pageNavi = pageNavi;
	}

	public ArrayList<Member> getPageList() {
		return pageList;
	}

	public void setPageList(ArrayList<Member> pageList) {
		this.pageList = pageList;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

}
