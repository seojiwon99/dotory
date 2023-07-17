package co.dotory.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;
import co.dotory.member.service.MemberService;
import co.dotory.member.service.MemberVO;
import co.dotory.member.serviceImpl.MemberServiceImpl;

public class MemberRegist implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
//		MemberService memberService = new MemberServiceImpl();
//		MemberVO memberVO = new MemberVO();
//		memberVO.setMemberId("memberId");
//		memberVO.setMemberPw("memberPw");
//		memberVO.setMemberName("memberName");
//		memberVO.setMemberTel("memberTel");
//		memberVO.setMemberAddr("memberAddr");
//		
//		MemberMapper.memberInsert(memberVO);
		
		String id = req.getParameter("memberId");
		String Pw = req.getParameter("memberPw");
		String Name = req.getParameter("memberName");
		String Tel = req.getParameter("memberTel");
		String Addr = req.getParameter("memberAddr");
		
		MemberVO vo = new MemberVO();
		vo.setMemberId(id);
		vo.setMemberPw(Pw);
		vo.setMemberName(Name);
		vo.setMemberTel(Tel);
		vo.setMemberAddr(Addr);
		
		MemberService service = new MemberServiceImpl();
		service.memberInsert(vo);
		return "main/main";
	}

}
