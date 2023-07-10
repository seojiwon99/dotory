package co.dotory.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dotory.common.Command;
import co.dotory.member.service.MemberService;
import co.dotory.member.service.MemberVO;
import co.dotory.member.serviceImpl.MemberServiceImpl;

public class MemberLogin implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		MemberService memberService = new MemberServiceImpl();
		MemberVO memberVO = new MemberVO();
		
		HttpSession session = req.getSession();
		String turn = null;
		
		memberVO.setMemberId(req.getParameter("memberId"));
		memberVO.setMemberPw(req.getParameter("memberPw"));
		
		memberVO = memberService.memberSelect(memberVO);
		
		if(memberVO != null) {
			session.setAttribute("id", memberVO.getMemberId());
			session.setAttribute("name", memberVO.getMemberName());
			session.setAttribute("author", memberVO.getMemberAuthor());
			turn = "main.do";
		} else {
			req.setAttribute("message", "잘못된 입력값입니다.");
			turn = "member/errorMessage";
		}
		return turn;
	}

}
