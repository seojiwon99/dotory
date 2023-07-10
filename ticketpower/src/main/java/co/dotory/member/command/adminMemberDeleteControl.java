package co.dotory.member.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;
import co.dotory.member.service.MemberService;
import co.dotory.member.serviceImpl.MemberServiceImpl;

public class adminMemberDeleteControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res){
		String id = req.getParameter("memberId");
		MemberService svc = new MemberServiceImpl();

		if (svc.memberDelete(id)) {
			System.out.println("삭제성공");
			return "adminMemberPage.do";
		} else {
			System.out.println("삭제실패");
			return "adminMemberDelete.do";
		}
	}

}
