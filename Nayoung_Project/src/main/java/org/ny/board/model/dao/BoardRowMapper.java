package org.ny.board.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.ny.board.model.vo.Board;

public class BoardRowMapper {

	public Object mapRow(ResultSet rset, int rowNum) throws SQLException {
		Board b = new Board();
		b.setbCode(rset.getInt("BCODE"));
		b.setbTitle(rset.getString("BTITLE"));
		b.setbWriter(rset.getString("BWRITER"));
		b.setbContent(rset.getString("BCONTENT"));
		b.setbSecret(rset.getString("BSECRET"));
		b.setbRegDate(rset.getDate("BREGDATE"));
		b.setbPw(rset.getString("BPW"));
		b.setbFile(rset.getString("BFILE"));
		b.setbHit(rset.getInt("BHIT"));
		return b;
	}
}
