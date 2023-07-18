package co.dotory.member.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;
import co.dotory.common.PageDTO;
import co.dotory.member.service.MemberService;
import co.dotory.member.service.MemberVO;
import co.dotory.member.serviceImpl.MemberServiceImpl;

public class AdminMemberPageControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		MemberService svc = new MemberServiceImpl();
		
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		
		PageDTO dto = new PageDTO(Integer.parseInt(page), svc.totalCnt());
		List<MemberVO> list = svc.memberList(Integer.parseInt(page));
		
		req.setAttribute("list", list);
		req.setAttribute("page", dto);
		
		return "admin/adminMemberList.tiles";
	}

}
