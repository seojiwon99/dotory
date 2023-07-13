package co.dotory.member.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;
import co.dotory.common.PageDTO;
import co.dotory.member.service.PickService;
import co.dotory.member.service.PickVO;
import co.dotory.member.serviceImpl.PickServiceImpl;

public class UserPickList implements Command {
	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		PickService svc = new PickServiceImpl();
		
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		
		PageDTO dto = new PageDTO(Integer.parseInt(page), svc.totalCnt());
		
		List<PickVO> list = svc.UserPickList(Integer.parseInt(page));
		
		req.setAttribute("pick", list);
		req.setAttribute("page", dto);
		
		return "user/userPickList";
	}
}
