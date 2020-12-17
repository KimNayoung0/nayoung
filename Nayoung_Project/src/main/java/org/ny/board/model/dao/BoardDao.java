package org.ny.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.ny.board.model.vo.B_Comment;
import org.ny.board.model.vo.B_File;
import org.ny.board.model.vo.Board;
import org.ny.board.model.vo.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("boardDao")
public class BoardDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	SqlSessionTemplate sqlsession;

	public ArrayList<Board> searchList(Search search, int start, int end)throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", search.getKeyword());

		List list = sqlsession.selectList("board.searchList", map);
		return (ArrayList<Board>) list;
	}

	public int totalBoardCount(String keyword) throws Exception{
		int totalCount = sqlsession.selectOne("board.totalBoardCount", keyword);
		return totalCount;
	}

	public Map<String, Object> boardSelect(Board b)throws Exception {
		return sqlsession.selectOne("board.boardSelect", b);
	}

	public int insertBoard(Board b)throws Exception { // 글 작성
		return sqlsession.insert("board.insertBoard", b);

	}

	public void insertFile(Map<String, Object> map) throws Exception { // 파일 작성
		sqlsession.insert("board.insertFile", map);
	}

	public void boardHit(int bCode) throws Exception {
		sqlsession.update("board.boardHit", bCode);
	}

	public List<Map<String, Object>> selectFile(int bCode) throws Exception {
		return sqlsession.selectList("board.selectFile", bCode);
	}

	public int insertComment(B_Comment bc)throws Exception {
		return sqlsession.insert("board.insertComment", bc);
	}

	public List<String> selectComment(int bCode) throws Exception {
		// System.out.println(bCode);
		return sqlsession.selectList("board.selectComment", bCode);
	}

	public int deleteComment(int coCode) throws Exception {
		return sqlsession.delete("board.deleteComment", coCode);
	}

	public Map<String, Object> fileDown(Map<String, Object> map) throws Exception {
		return sqlsession.selectOne("board.fileDown", map);
	}

	public int boardUpdate(Board b)throws Exception {
		return sqlsession.update("board.boardUpdate", b);
	}

	public int commentUpdate(B_Comment bc)throws Exception {
		return sqlsession.update("board.commentUpdate", bc);
	}

	public int boardDelete(int bCode)throws Exception {
		return sqlsession.delete("board.boardDelete", bCode);
	}

	public int updateFile(Map<String, Object> map) throws Exception { // map에는 fCode가 있음
		return sqlsession.update("board.updateFile", map);
	}

}
