package org.ny.board.model.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.catalina.util.URLEncoder;
import org.ny.board.model.dao.BoardDao;
import org.ny.board.model.vo.B_Comment;
import org.ny.board.model.vo.Board;
import org.ny.board.model.vo.PageData;
import org.ny.board.model.vo.Search;
import org.ny.board.util.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service("boardService")
public class BoardService {

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Autowired
	@Qualifier("boardDao")
	BoardDao boardDao;

	public PageData boardList(int currentPage, Search search) throws Exception {
		// 조회할 게시물 start, end 번호 구하기
		int numPerPage = 10; // 한페이지에 게시물 몇 개인지
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		// 게시물 10개조회

		search.setStart(start);
		search.setEnd(end);

		/* ArrayList<Board> list = boardDao.boardList(start, end); */
		ArrayList<Board> searchList = boardDao.searchList(search, start, end);

		// 전체 게시물 수 조회
		int totalCount = boardDao.totalBoardCount(search.getKeyword());
		// System.out.println(search.getKeyword());
		// 전체 페이지 수 계산
		int totalPage = 0;
		if (totalCount % numPerPage == 0) { // 일단 나눠서 나머지 확인
			totalPage = totalCount / numPerPage;
		} else { // 나머지가 있으면 몫에다 + 1 (자바에서는 정수/정수 하면 정수만 나온다. 소숫점 계산 안해줌)
			totalPage = totalCount / numPerPage + 1;
		}

		// pageNavi 제작
		int pageNaviSize = 5;
		// currentPage = 1~5 -> 12345
		// currentPage = 6~10 -> 678910
		int startNavi = ((currentPage - 1) / pageNaviSize) * pageNaviSize + 1;
		int endNavi = startNavi + pageNaviSize - 1;

		// 일종의 오류처리
		if (endNavi > totalPage) {
			endNavi = totalPage;
		}

		StringBuilder sb = new StringBuilder();
		if (startNavi != 1) {// 1이 아닐 때만 이전을 넣어줌
			if (search.getKeyword() != null) {
				sb.append("<a href='/boardList?currentPage=" + (startNavi - 1) + "&keyword=" + search.getKeyword()
						+ "'>[이전]</a>");
			} else {
				sb.append("<a href='/boardList?currentPage=" + (startNavi - 1) + "'>[이전]</a>");
			}
		}
		for (int i = startNavi; i <= endNavi; i++) {
			if (i != currentPage) {
				if (search.getKeyword() != null) {
					sb.append("<a href='/boardList?currentPage=" + i + "&keyword=" + search.getKeyword() + "'>" + i
							+ "</a>");
				} else {
					sb.append("<a href='/boardList?currentPage=" + i + "'>" + i + "</a>");
				}
			} else {
				// 요청페이지가 아니면 안눌리게 -> 현재 페이지는 안눌림
				sb.append("<span>" + i + "</span>");
			}
		}
		if (endNavi != totalPage) {// 최종페이지가 아니면 다음을 넣어줌
			if (search.getKeyword() != null) {
				sb.append("<a href='/boardList?currentPage=" + (endNavi + 1) + "&keyword=" + search.getKeyword()
						+ "'>[다음]</a>");
			} else {
				sb.append("<a href='/boardList?currentPage=" + (endNavi + 1) + "'>[다음]</a>");
			}
		}

		PageData pd = new PageData(searchList, sb.toString(), null); // null?? PageData vo에 commentList때문에 그런가? o o 맞음
		return pd;
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	public Map<String, Object> boardSelect(Board b) throws Exception {
		boardDao.boardHit(b.getbCode());
		Map<String, Object> board = boardDao.boardSelect(b);
		return board;
	}

	public void insertBoard(Board b, MultipartHttpServletRequest upFile) throws Exception {

		boardDao.insertBoard(b); // 글작성

		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(b, upFile);
		// System.out.println(list.get(0).get("orgFileName").toString());
		int size = list.size();
		for (int i = 0; i < size; i++) {
			boardDao.insertFile(list.get(i)); // 파일 정보

		}

	}

	public List<Map<String, Object>> selectFile(int bCode) throws Exception {
		return boardDao.selectFile(bCode);
	}

	public int insertComment(B_Comment bc)throws Exception {
		int result = boardDao.insertComment(bc);
		return result;
	}

	public List<String> selectComment(int bCode) throws Exception {
		// System.out.println(bCode);
		return boardDao.selectComment(bCode);

	}

	public int deleteComment(int coCode) throws Exception {
		return boardDao.deleteComment(coCode);
	}

	public Map<String, Object> fileDown(Map<String, Object> map) throws Exception {
		return boardDao.fileDown(map);
	}

	public Map<String, Object> boardSelectDetail(Board b) throws Exception {
		Map<String, Object> board = boardDao.boardSelect(b);
		return board;
	}

	// 게시물 수정
	public void boardUpdate(Board b, String[] files, String[] fileNames, MultipartHttpServletRequest upFile)
			throws Exception {

		int board = boardDao.boardUpdate(b);

		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(b, files, fileNames, upFile);
		Map<String, Object> map = null;

		int size = list.size();
		for (int i = 0; i < size; i++) {
			map = list.get(i);
			if (map.get("IS_NEW").equals("Y")) {
				boardDao.insertFile(map);
			} else {
				boardDao.updateFile(map);
			}
		}

	}

	public List<String> commentSelectDetail(int bCode) throws Exception {
		List<String> bcList = boardDao.selectComment(bCode);
		return bcList;
	}

	public int commentUpdate(B_Comment bc) throws Exception {
		int bcList = boardDao.commentUpdate(bc);
		return bcList;
	}

	public int boardDelete(int bCode) throws Exception {
		int result = boardDao.boardDelete(bCode);
		return result;
	}

}
