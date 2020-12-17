package org.ny.mail.controller;

import java.io.File;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSessionFactory;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.ny.member.model.dao.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.FileSystemResource;
import org.springframework.dao.DataAccessException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class EmailSender extends SqlSessionDaoSupport {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	public EmailSender(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}

	@Resource(name = "memberDao")
	MemberDao memberDao;
	
	public HashMap<String, Object> sendPwd(HashMap<String, Object> paramap) {
		//boolean b = false;
		HashMap<String, Object> map = memberDao.getMail_Pwd(paramap);
		System.out.println(map);
		if (map.size() != 0) {
			//b = true;
			String setfrom = "kimna0088@gmail.com";
			String tomail = (String) map.get("USEREMAIL"); // 받는 사람 이메일
			String title = "nayoung project 비밀번호 찾기 기능입니다."; // 제목
			System.out.println(map);
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				String text = "고객님의 비밀번호는 " + (String) map.get("USERPW")+"입니다.";
				messageHelper.setText(text, true);
				mailSender.send(message);
				System.out.println(map);
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		return map;
	}
	
	
	public HashMap<String, Object> sendId(HashMap<String, Object> paramap) {
		//boolean b = false;
		
		HashMap<String, Object> map =memberDao.getMail_Id(paramap);
		System.out.println(map);//{USEREMAIL=sksyd68@naver.com, USERID=rlaskdud}
		if (map.size() != 0) {
		//	b = true;
			String setfrom = "kimna0088@gmail.com";
			String tomail = (String) map.get("USEREMAIL"); // 받는 사람 이메일
			String title = "nayoung project 아이디 찾기 기능입니다."; // 제목
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				String text = "고객님의 아이디는 " + (String) map.get("USERID")+"입니다.";
				messageHelper.setText(text, true);
				mailSender.send(message);
			
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		return map;
	}
}
