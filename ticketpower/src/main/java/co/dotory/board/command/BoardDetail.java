package co.dotory.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.board.service.BoardService;
import co.dotory.board.service.BoardVO;
import co.dotory.board.serviceImpl.BoardServiceImpl;
import co.dotory.common.Command;

public class BoardDetail implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		BoardService svc = new BoardServiceImpl();
		String brdNo = req.getParameter("boardId");
		
		BoardVO vo = svc.getBoard(Integer.parseInt(brdNo));
		
		req.setAttribute("board", vo);
		
		return "board/boardDetail";
	}

}
