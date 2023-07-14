package co.dotory.member.command;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dotory.common.Command;
import co.dotory.member.service.MemberService;
import co.dotory.member.service.MemberVO;
import co.dotory.member.serviceImpl.MemberServiceImpl;

public class UserInfo implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		
		String id = (String) session.getAttribute("id");
		MemberVO vo = new MemberVO();
		MemberService svc = new MemberServiceImpl();
		vo = svc.memberSelect(id);
		req.setAttribute("search", vo);
		
		
		return "user/userInfo.tiles";
	}

}
