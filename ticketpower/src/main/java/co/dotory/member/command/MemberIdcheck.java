package co.dotory.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;
import co.dotory.member.service.MemberService;
import co.dotory.member.serviceImpl.MemberServiceImpl;

public class MemberIdcheck implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		MemberService memberService = new MemberServiceImpl();
		String result = "Ajax:";
		
		String id = req.getParameter("id");
		boolean check = memberService.ismemberIdCheck(id);
		
		if(check) {
			result += "1";
		}else {
			result += "0";
		}
		return result;
	}

}
