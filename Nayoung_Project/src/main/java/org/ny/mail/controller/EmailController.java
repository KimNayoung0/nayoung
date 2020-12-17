package org.ny.mail.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EmailController {

	@Autowired

	@Qualifier("emailSender")
	private EmailSender emailSender;

	@RequestMapping("/findPwFrm")
	public String findPwFrm() {
		return "member/findPw";
	}

	@RequestMapping("/findIdFrm")
	public String findIdFrm() {
		return "member/findId";
	}

	@RequestMapping("/findPw")
	//@ResponseBody
	public String getJson(@RequestParam("userName") String userName,
			@RequestParam("userPhon") String userPhon, @RequestParam("userId") String userId, Model model) {
		HashMap<String, Object> paramap = new HashMap<String, Object>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		paramap.put("userName", userName);
		paramap.put("userPhon", userPhon);
		paramap.put("userId", userId);

		Map<String, Object> result= emailSender.sendPwd(paramap);

		if (result != null) {
			return "member/findPwSuccess";
		} else {
			model.addAttribute("msg","비밀번호 찾기 실패");
			model.addAttribute("loc","/");
		}
		return "common/msg";
	}

	@RequestMapping("/findId")
	//@ResponseBody ->이걸 지워야 페이지로 이동됨
	//메소드에 @ResponseBody 로 어노테이션이 되어 있다면 메소드에서 리턴되는 값은 View 를 통해서  출력되지 않고 HTTP Response Body 에 직접 쓰여지게 됩니다.
	public String getJson(@RequestParam("userName") String userName,
			@RequestParam("userPhon") String userPhon, Model model) {
		HashMap<String, Object> paramap = new HashMap<String, Object>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		paramap.put("userName", userName);
		paramap.put("userPhon", userPhon);
		//System.out.println(paramap);
		Map<String, Object> result= emailSender.sendId(paramap);
		//System.out.println(b);//ture
		//System.out.println(paramap);//{userName=김나영, userPhon=01055302783}
		if (result != null) {
			return "member/findIdSuccess";
		} else {
			model.addAttribute("msg","아이디 찾기 실패");
			model.addAttribute("loc","/");
		}
		return "common/msg";
	}

}
