package co.dotory.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;
import co.dotory.member.service.MemberService;
import co.dotory.member.serviceImpl.MemberServiceImpl;

public class AdminMemberDeleteControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res){
		String id = req.getParameter("memberId");
		MemberService svc = new MemberServiceImpl();

		if (svc.memberDelete(id)) {
			return "adminMemberPage.do";
		} else {
			return "adminMemberDelete.do";
		}
	}

}
