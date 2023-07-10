package co.dotory.member.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;
import co.dotory.member.service.MemberService;
import co.dotory.member.service.MemberVO;
import co.dotory.member.serviceImpl.MemberServiceImpl;

public class adminMemberPageControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		MemberService svc = new MemberServiceImpl();
		List<MemberVO> list = svc.memberList();
		req.setAttribute("list", list);
		System.out.println(list);
		
		return "admin/adminMemberList.tiles";
	}

}
