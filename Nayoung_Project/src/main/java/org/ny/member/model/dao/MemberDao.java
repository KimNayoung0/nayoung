package org.ny.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.ny.member.model.vo.Member;
import org.ny.member.model.vo.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("memberDao")
public class MemberDao {
	@Autowired
	@Qualifier("sqlSessionTemplate")
	SqlSessionTemplate sqlsession;

	public int insertMember(Member m) throws Exception {
		return sqlsession.insert("member.insertMember", m);

	}

	public Member checkId(String userId) throws Exception {
		return sqlsession.selectOne("member.checkId", userId);
	}

	public Member memberLogin(Member m) throws Exception {
		return sqlsession.selectOne("member.memberLogin", m);
	}

	public HashMap<String, Object> getMail_Pwd(HashMap<String, Object> map) throws DataAccessException {
		return sqlsession.selectOne("member.Mail_Pwd", map);
	}

	public HashMap<String, Object> getMail_Id(HashMap<String, Object> map) throws DataAccessException {
		System.out.println(map);// {userName=김나영, userPhon=01055302783}
		return sqlsession.selectOne("member.Mail_Id", map);
	}

	public int updateMember(Member m) throws Exception {
		return sqlsession.update("member.updateMember", m);
	}

	public int deleteMember(String userId) throws Exception {
		return sqlsession.delete("member.deleteMember", userId);
	}

	public List memberAll() {
		List mList = sqlsession.selectList("member.memberAll");
		return mList;
	}

	public ArrayList<Member> searchList(Search search, int start, int end)throws Exception {
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", search.getKeyword());
		
		List list = sqlsession.selectList("member.searchList",map);
		return (ArrayList<Member>) list;
	}

	public int totalMemberCount(String keyword)throws Exception {
		int totalCount = sqlsession.selectOne("member.totalMemberCount",keyword);
		return totalCount;
	}

}
