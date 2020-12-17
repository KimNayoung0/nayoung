package org.ny.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ny.member.model.vo.Member;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {
		// 컨트롤러가 실행되기 전에 관리자 여부를 확인하고 싶으니 preHandle을 오버라이드
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("member");

		if (member == null || member.getVerify() != 9) {
			res.sendRedirect("/");
			return false;
		}

		return true;
	}

}
