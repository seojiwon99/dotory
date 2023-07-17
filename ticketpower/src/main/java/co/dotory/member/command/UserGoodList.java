package co.dotory.member.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dotory.common.Command;
import co.dotory.common.PageDTO;
import co.dotory.member.service.GoodService;
import co.dotory.member.service.GoodVO;
import co.dotory.member.serviceImpl.GoodServiceImpl;

public class UserGoodList implements Command {
	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		GoodService svc = new GoodServiceImpl();
		HttpSession session = req.getSession();
		String memberId = (String) session.getAttribute("id");
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		
		PageDTO dto = new PageDTO(Integer.parseInt(page), svc.totalCnt());
		
		List<GoodVO> list = svc.userGoodList(Integer.parseInt(page), memberId);
		
		req.setAttribute("good", list);
		req.setAttribute("page", dto);
		
		return "user/userGoodList";
	}
}
