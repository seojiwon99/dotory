	package co.dotory.member.command;

import java.security.KeyStore.Entry.Attribute;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dotory.common.Command;
import co.dotory.member.service.MemberService;
import co.dotory.member.service.MemberVO;
import co.dotory.member.serviceImpl.MemberServiceImpl;

public class UserModify implements Command {

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		
		String id = (String) session.getAttribute("id");
		String name = (String) session.getAttribute("name");
		String tel = (String) session.getAttribute("tel");
		String addr = (String) session.getAttribute("addr");
		String img = (String) session.getAttribute("image");
		System.out.println(id + name + tel + addr);
		
		MemberService svc = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		vo.setMemberId(req.getParameter("memberId"));
		vo.setMemberPw(req.getParameter("memberPw"));
		vo.setMemberTel(req.getParameter("memberTel"));
		vo.setMemberAddr(req.getParameter("memberAddr"));
		vo.setMemberImg(req.getParameter("memberImg"));
		System.out.println(vo);
		if (svc.memberUpdate(vo)) {
			System.out.println("수정완료");
			return "userInfo.do";
		} else {
			System.out.println("수정실패");
			return "userInfo.do";
		}
	}
}
