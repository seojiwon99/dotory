package co.dotory.member.command;


import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;
import co.dotory.member.service.MemberService;
import co.dotory.member.service.MemberVO;
import co.dotory.member.serviceImpl.MemberServiceImpl;

public class adminMemberModifyControl implements Command {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		String id = req.getParameter("memberId");
		String name = req.getParameter("memberName");
		String tel = req.getParameter("memberTel");
		String addr = req.getParameter("memberAddr");
		String img = req.getParameter("memberImg");
		
		
		MemberService svc = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		vo.setMemberId(id);
		vo.setMemberName(name);
		vo.setMemberTel(tel);
		vo.setMemberAddr(addr);
		vo.setMemberImg(img);
		System.out.println(vo);
		
		if(svc.memberUpdate(vo)) {
			System.out.println("수정완료");
			return "adminMemberPage.do";
		}else {
			System.out.println("수정실패");
			return "adminMemberForm.do";
		}
	}

}
