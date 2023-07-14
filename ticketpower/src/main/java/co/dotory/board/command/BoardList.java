package co.dotory.board.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dotory.board.service.BoardService;
import co.dotory.board.service.BoardVO;
import co.dotory.board.serviceImpl.BoardServiceImpl;
import co.dotory.common.Command;
import co.dotory.common.PageDTO;

public class BoardList implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		BoardService svc = new BoardServiceImpl();
		
		HttpSession session = req.getSession();
		
	
		
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		
		PageDTO dto = new PageDTO(Integer.parseInt(page), svc.totalCnt());
		
		List<BoardVO> list = svc.boardSelectList(Integer.parseInt(page));
		
		req.setAttribute("board", list);
		req.setAttribute("page", dto);
	
		return "board/boardList";
	}

}
