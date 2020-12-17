package org.ny.board.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ny.board.model.service.BoardService;
import org.ny.board.model.vo.B_Comment;
import org.ny.board.model.vo.Board;
import org.ny.board.model.vo.PageData;
import org.ny.board.model.vo.Search;
import org.ny.member.model.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Autowired
	@Qualifier("boardService")
	BoardService boardService;

	@RequestMapping("/boardList")
	public String boardList(int currentPage, Model model, Search search) throws Exception {
		PageData pd = boardService.boardList(currentPage, search);

		if (!pd.getPageList().isEmpty()) {
			model.addAttribute("list", pd.getPageList());
			model.addAttribute("pageNavi", pd.getPageNavi());
			return "board/boardList";
		}
		return "board/boardList";
	}

	@RequestMapping("/writeFrm")
	public String writeFrm(HttpSession session) throws Exception {
		Member member = (Member) session.getAttribute("member");
		if (member != null) {
			return "board/boardWrite";
		}
		return "member/login";
	}

	// 파일 업로드
	@RequestMapping("/fileWriteFrm")
	public String fileWriteFrm() {
		return "board/fileWrite";
	}

	@RequestMapping("/boardSelect") // 여기에 파일 테이블이랑 댓글도 함께 출력되도록 합침
	public String boardSelect(Board b, Model model) throws Exception {

		Map<String, Object> board = boardService.boardSelect(b);
		// System.out.println(board);
		

		List<Map<String, Object>> fileList = boardService.selectFile(b.getbCode());
		model.addAttribute("file", fileList);
		// System.out.println(fileList);

		List<String> bcList = boardService.selectComment(b.getbCode());
		// System.out.println(bcList);
		model.addAttribute("bcList", bcList);

		if (board != null) {
			model.addAttribute("b", board);
		} else {
			model.addAttribute("msg", "게시물 조회 실패");
			model.addAttribute("loc", "/boardList?currentPage=1");
			return "common/msg";
		}
		return "board/boardSelect";
	}

	@RequestMapping("/insertBoard")
	public String insertBoard(Board b, MultipartHttpServletRequest upFile, Model model) throws Exception {

		// logger.info("insertBoard");
		boardService.insertBoard(b, upFile);
		return "redirect:/boardList?currentPage=1";

	}

	@RequestMapping("/insertComment")
	public String insertComment(B_Comment bc, HttpSession session, Model model) throws Exception {

		Member member = (Member) session.getAttribute("member");

		if (member != null) {
			int result = boardService.insertComment(bc);
			model.addAttribute("bc", bc);
			return "redirect:/boardSelect?bCode=" + bc.getbCode();
		} else {
			model.addAttribute("msg", "로그인 후 이용해주세요.");
			model.addAttribute("loc", "/loginFrm");
			return "common/msg";
		}

	}

	@RequestMapping("/deleteComment")
	public String deleteComment(B_Comment bc, Board b, Model model) throws Exception {
		int result = boardService.deleteComment(bc.getCoCode());
		return "redirect:/boardSelect?bCode=" + b.getbCode();

	}

	// 처음에 첨부파일을 업로드 할때는 MultipartHttpServletRequest mpRequest을 이용하여
	// 서버에 요청을 했었는데요. request는 jsp화면에서 서버로 요청할 때 쓰고,
	// response는 서버에서 jsp화면으로 응답할때에 쓰입니다. 그래서 파일정보들을 responses에 담아 처리를 합니다.
	@RequestMapping("/fileDown")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception {
		Map<String, Object> resultMap = boardService.fileDown(map);
		System.out.println(map); // {fCode=48}
		System.out.println(resultMap);// {ORGFILENAME=고민 1.txt, STOREDFILENAME=379e37ecc6764f36aa18ece065fdb37e.txt}
		String storedFileName = (String) resultMap.get("STOREDFILENAME"); // resultMap에 나타나는 값 그대로 입력해줘야함 _ 계속 VO에 입력한
																			// 변수명으로 찾으려해서 나타나지 않았음 !! 주의!
		String orgFileName = (String) resultMap.get("ORGFILENAME");

		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils
				.readFileToByteArray(new File("C:\\mp\\file\\" + storedFileName));

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(orgFileName, "UTF-8") + "\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();

	}

	// 게시물 수정 - 기존 데이터를 board에 담기
	@RequestMapping("/boardUpdateView")
	public String boardDetail(Board b, Model model) throws Exception {// bCode 담아옴
		Map<String, Object> board = boardService.boardSelectDetail(b);
		model.addAttribute("detail", board);

		List<Map<String, Object>> fileList = boardService.selectFile(b.getbCode());
		// 담아온 bCode를 통해 파일의 기존 정도를 fileList에 담음
		model.addAttribute("file", fileList);

		return "board/boardUpdate";
	}

	@RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)
	public String boardUpdate(Board b, Model model, @RequestParam(value = "fCodeDel[]") String[] files,
			@RequestParam(value = "fNameDel[]") String[] fileNames, MultipartHttpServletRequest upFile)
			throws Exception {
		// 파라미터에 @RequestParam이 붙은 fileNoDel[]과 fileNameDel[]은 jsp에서 fileNoDel[]과
		// fileNameDel[]로 지정한 값을 String[] 타입으로 담겠다는 말입니다.

		boardService.boardUpdate(b, files, fileNames, upFile);

		return "redirect:/boardSelect?bCode=" + b.getbCode();
	}

	@RequestMapping(value = "/commentUpdate", method = RequestMethod.POST)
	public String commentUpdate(B_Comment bc, Model model) throws Exception {
		int bcList = boardService.commentUpdate(bc);
		model.addAttribute("bcList", bcList);
		return "redirect:/boardSelect?bCode=" + bc.getbCode();
	}

	@RequestMapping("/boardDelete")
	public String boardDelete(Board b) throws Exception {
		int result = boardService.boardDelete(b.getbCode());
		System.out.println(b.getbCode());
		return "redirect:/boardList?currentPage=1";
	}

}
