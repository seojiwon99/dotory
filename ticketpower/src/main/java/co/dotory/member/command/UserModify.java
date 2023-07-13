	package co.dotory.member.command;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;
import co.dotory.member.service.MemberService;
import co.dotory.member.service.MemberVO;
import co.dotory.member.serviceImpl.MemberServiceImpl;

public class UserModify implements Command {

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		
		String id = req.getParameter("memberId");
		System.out.println(id);
		
		String result = "Ajax:";
		MemberService svc = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		vo.setMemberId(req.getParameter("memberId"));
		vo.setMemberName(req.getParameter("memberName"));
		vo.setMemberTel(req.getParameter("memberTel"));
		vo.setMemberAddr(req.getParameter("memberAddr"));
		vo.setMemberImg(req.getParameter("memberImg"));
		System.out.println(vo);
		//return "Ajax:" + ""
		if (svc.memberUpdate(vo)) {
			System.out.println("수정완료");
			return result += "1";
		} else {
			System.out.println("수정실패");
			return result += "0";
		}
	}
}
