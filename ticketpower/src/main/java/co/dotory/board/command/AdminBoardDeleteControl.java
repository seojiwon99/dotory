package co.dotory.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.board.service.BoardService;
import co.dotory.board.serviceImpl.BoardServiceImpl;
import co.dotory.common.Command;

public class AdminBoardDeleteControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("boardid"));
		BoardService svc = new BoardServiceImpl();
		String ajax = "Ajax:";
		if(svc.boardDelete(id)) {
			return ajax+="1";
		}else {
			return ajax+="0";
		}
		
		
	}

}
