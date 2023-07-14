package co.dotory.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dotory.board.service.BoardService;
import co.dotory.board.serviceImpl.BoardServiceImpl;
import co.dotory.common.Command;

public class BoardGood implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		String result = "Ajax:";
		String id = (String) session.getAttribute("id");
		String boardId = req.getParameter("boardId");	
		BoardService svc = new BoardServiceImpl();
		int num = svc.goodChk(id, Integer.parseInt(boardId));
		
		if(num == 0) {
			svc.insertGood(id, Integer.parseInt(boardId));
			result += "0";
		}else if(num == 1) {
			svc.deleteGood(id, Integer.parseInt(boardId));
			result += "1";
		}
		
		req.setAttribute("good", svc.getGood(Integer.parseInt(boardId)));
		return result;
	}

}
