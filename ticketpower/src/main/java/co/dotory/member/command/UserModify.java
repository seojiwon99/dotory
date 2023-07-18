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
		
		String result = "Ajax:";
		MemberService svc = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		vo.setMemberId(req.getParameter("memberId"));
		vo.setMemberName(req.getParameter("memberName"));
		vo.setMemberTel(req.getParameter("memberTel"));
		vo.setMemberAddr(req.getParameter("memberAddr"));
		vo.setMemberImg(req.getParameter("memberImg"));
		//return "Ajax:" + ""
		if (svc.memberUpdate(vo)) {
			return result += "1";
		} else {
			return result += "0";
		}
	}
}
