package org.ny.member.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ny.board.model.vo.Board;
import org.ny.member.model.vo.Search;
import org.ny.mail.controller.EmailSender;
import org.ny.member.model.service.MemberService;
import org.ny.member.model.vo.Member;
import org.ny.member.model.vo.MemberPageData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import net.sf.json.JSONObject;

@Controller
public class MemberController {

	// 비밀번호 암호화 사용을 위해 추가
	@Inject
	BCryptPasswordEncoder pwdEncoder;

	@Autowired
	@Qualifier("memberService")
	MemberService memberService;

	@RequestMapping("/signupFrm")
	public String signupFrm() {// 단순 페이지 이동
		return "member/signup";
	}

	@RequestMapping("/insertMember")
	public String insertMember(Member m, Model model) throws Exception {

		int result = memberService.insertMember(m);

		if (result > 0) {
			model.addAttribute("msg", "회원가입 성공");
		} else {
			model.addAttribute("msg", "회원가입 실패");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}

	// json방식
	@ResponseBody
	@RequestMapping(value = "/idChk", produces = "text/html; charset=utf-8") // ajax 데이터 넘겨줄 때 인코딩 방법
	public String checkId(String userId) throws Exception {
		Member m = memberService.checkId(userId);
		JSONObject obj = new JSONObject();
		if (m != null) {// 사용불가
			obj.put("result", "0");
		} else {// 사용가능
			obj.put("result", "1");
		}
		return new Gson().toJson(obj);
	}

	@RequestMapping("/loginFrm")
	public String loginFrm() {
		return "member/login";
	}

	@RequestMapping("/login")
	public String memberLogin(Member m, Model model, HttpSession session) throws Exception {

		Member member = memberService.memberLogin(m);

		if (member != null && member.getVerify() == 0) {
			session.setAttribute("member", member);
			model.addAttribute("msg", "로그인 성공");
			model.addAttribute("loc", "/");

		} else if (member != null && member.getVerify() == 9) {
			session.setAttribute("member", member);
			model.addAttribute("msg", "관리자 로그인 성공");
			model.addAttribute("loc", "admin/index");
		} else {
			model.addAttribute("msg", "로그인 실패");
			model.addAttribute("loc", "/loginFrm");
		}
		return "common/msg";
	}

	// logout 서블릿 하나 더 안만들고 바로 매소드 생성 가능
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
		// prefix지정 루트 안타고 바로 저기로 보내줌
	}

	@RequestMapping("/mypageFrm")
	public String mypage(HttpSession session, Model model) throws Exception {// 내 정보 가져와야하니 매개변수로 session, request영역에
																				// 등록해야하니 model
		Member member = (Member) session.getAttribute("member");// session에서 맴버 꺼내옴
		model.addAttribute("m", member);// 멤버를 model에도 add해줬으니 이제 requestScope에도 멤버가 들어있을 것
		return "member/mypage";
	}

	@RequestMapping("/update")
	public String updateMember(Member m, HttpSession session, Model model) throws Exception {
		int result = memberService.updateMember(m);

		if (result > 0) {
			session.setAttribute("member", m); // 기존의 데이터를 수정하는 것이므로 session 사용
			model.addAttribute("msg", "정보 수정 성공");
			model.addAttribute("loc", "/mypageFrm");
		} else {
			model.addAttribute("msg", "정보 수정 실패");
			model.addAttribute("loc", "/");
		}
		return "common/msg";

	}

	@RequestMapping("/delete")
	public String deleteMember(HttpSession session, Model model, @SessionAttribute("member") Member m)
			throws Exception {
		// updateMember에서 세션 받아오고 밑에서 꺼내왔는데 매개변수에 @SessionAttribute("member") Member m,로
		// 한방에 세션꺼내와서 담기 가능..! ->
		// 근데 탈퇴하고 세션파괴 해야하니 받아와야됨
		int result = memberService.deleteMember(m.getUserId());

		if (result > 0) {
			session.invalidate();
			model.addAttribute("msg", "회원 탈퇴 성공");
			model.addAttribute("loc", "/");
		} else {
			model.addAttribute("msg", "회원 탈퇴 실패");
			model.addAttribute("loc", "/");
		}

		return "common/msg";
	}

	// 활동 내용 페이지
	@RequestMapping("/activityContentFrm")
	public String activityContentFrm(HttpSession session, Model model) throws Exception {
		Member member = (Member) session.getAttribute("member");
		model.addAttribute("m", member);
		return "member/activityContent";
	}

	// 알림 페이지
	@RequestMapping("/messageFrm")
	public String messageFrm(HttpSession session, Model model) throws Exception {
		Member member = (Member) session.getAttribute("member");
		model.addAttribute("m", member);
		return "member/message";
	}

	@RequestMapping("/admin/adminPage")
	public String memberAll(Model model, int currentPage, Search search) throws Exception {
		ArrayList<Member> mList = memberService.memberAll();
		MemberPageData mpd = memberService.memberList(currentPage, search);

		if (mList != null) {
			model.addAttribute("mList", mList);
		}

		if (!mpd.getPageList().isEmpty()) {
			model.addAttribute("list", mpd.getPageList());
			model.addAttribute("pageNavi", mpd.getPageNavi());
		}
		return "/admin/adminPage";
	}

}
