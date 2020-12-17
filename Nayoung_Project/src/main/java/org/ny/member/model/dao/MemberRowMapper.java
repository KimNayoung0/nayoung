package org.ny.member.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.ny.member.model.vo.Member;
import org.springframework.jdbc.core.RowMapper;

//꼭 RowMapper를 상속해서 써줘야 사용 가능
public class MemberRowMapper implements RowMapper {

	@Override
	public Object mapRow(ResultSet rset, int rowNum) throws SQLException {
		Member m = new Member();
		m.setUserId(rset.getString("USERID"));
		m.setUserPw(rset.getString("USERPW"));
		m.setUserName(rset.getString("USERNAME"));
		m.setUserPhon(rset.getInt("USERPHON"));
		m.setUserEmail(rset.getString("USEREMAIL"));
		m.setUserAddr1(rset.getString("USERADDR1"));
		m.setRegDate(rset.getDate("REGDATE"));
		m.setUserAddr2(rset.getString("USERADDR2"));
		m.setUserAddr3(rset.getString("USERADDR3"));
		return m;
	}

}
