package co.dotory.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dotory.common.Command;

public class MemberLogout implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		session.invalidate();
		req.setAttribute("message", "로그아웃 완료");
		return "main.do";
	}

}
