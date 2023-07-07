package co.dotory.member.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;
import co.dotory.member.service.MemberService;
import co.dotory.member.service.MemberVO;
import co.dotory.member.serviceImpl.MemberServiceImpl;

public class MemberList implements Command{

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		MemberService memberservice = new MemberServiceImpl();
		List<MemberVO> members = new ArrayList<>();
		
		members = memberservice.memberList();
		req.setAttribute("members", members);
 		return "member/memberList";
	}
}
