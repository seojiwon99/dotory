package co.dotory.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dotory.common.Command;

public class MemberLoginForm implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		return "member/memberLoginForm";
	}

}
