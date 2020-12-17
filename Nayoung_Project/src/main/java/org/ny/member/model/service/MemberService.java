package org.ny.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.ny.board.model.vo.PageData;
import org.ny.member.model.dao.MemberDao;
import org.ny.member.model.vo.Member;
import org.ny.member.model.vo.MemberPageData;
import org.ny.member.model.vo.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

@Service("memberService")
public class MemberService {

	@Autowired
	@Resource(name = "memberDao")
	MemberDao memberDao;

	public int insertMember(Member m) throws Exception {
		int result = memberDao.insertMember(m);
		return result;
	}

	public Member checkId(String userId) throws Exception {
		Member m = memberDao.checkId(userId);
		return m;
	}

	public Member memberLogin(Member m) throws Exception {
		Member member = memberDao.memberLogin(m);
		return member;
	}

	public int updateMember(Member m) throws Exception {
		int result = memberDao.updateMember(m);
		return result;
	}

	public int deleteMember(String userId) throws Exception {
		int result = memberDao.deleteMember(userId);
		return result;
	}

	// 전체 회원 조회
	public ArrayList<Member> memberAll() throws Exception {
		List mList = memberDao.memberAll();
		return (ArrayList<Member>) mList;
	}

	// 전체 회원 조회 페이징
	public MemberPageData memberList(int currentPage, Search search) throws Exception {

		int numPerPage = 10;
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		search.setStart(start);
		search.setEnd(end);

		ArrayList<Member> searchList = memberDao.searchList(search, start, end);

		int totalCount = memberDao.totalMemberCount(search.getKeyword());

		int totalPage = 0;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}

		int pageNaviSize = 5;
		int startNavi = ((currentPage - 1) / pageNaviSize) * pageNaviSize + 1;
		int endNavi = startNavi + pageNaviSize - 1;

		if (endNavi > totalPage) {
			endNavi = totalPage;
		}

		StringBuilder sb = new StringBuilder();
		if (startNavi != 1) {// 1이 아닐 때만 이전을 넣어줌
			if (search.getKeyword() != null) {
				sb.append("<a href='/admin/adminPage?currentPage=" + (startNavi - 1) + "&keyword="
						+ search.getKeyword() + "'>[이전]</a>");
			} else {
				sb.append("<a href='/admin/adminPage?currentPage=" + (startNavi - 1) + "'>[이전]</a>");
			}
		}
		for (int i = startNavi; i <= endNavi; i++) {
			if (i != currentPage) {
				if (search.getKeyword() != null) {
					sb.append("<a href='/admin/adminPage?currentPage=" + i + "&keyword=" + search.getKeyword() + "'>"
							+ i + "</a>");
				} else {
					sb.append("<a href='/admin/adminPage?currentPage=" + i + "'>" + i + "</a>");
				}
			} else {
				// 요청페이지가 아니면 안눌리게 -> 현재 페이지는 안눌림
				sb.append("<span>" + i + "</span>");
			}
		}
		if (endNavi != totalPage) {// 최종페이지가 아니면 다음을 넣어줌
			if (search.getKeyword() != null) {
				sb.append("<a href='/admin/adminPage?currentPage=" + (endNavi + 1) + "&keyword=" + search.getKeyword()
						+ "'>[다음]</a>");
			} else {
				sb.append("<a href='/admin/adminPage?currentPage=" + (endNavi + 1) + "'>[다음]</a>");
			}
		}

		MemberPageData mpd = new MemberPageData(searchList, sb.toString());
		return mpd;
	}

}
