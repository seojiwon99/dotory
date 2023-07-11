package co.dotory.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;
import co.dotory.member.service.MemberService;
import co.dotory.member.service.MemberVO;
import co.dotory.member.serviceImpl.MemberServiceImpl;

public class MemberInfo implements Command{

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		
		String id = req.getParameter("memberId");
		MemberService svc = new MemberServiceImpl();
		MemberVO result = svc.memberSelect(id);
		
		
		req.setAttribute("member", result);
		
		return "member/memberInfo.tiles";
	}

}

