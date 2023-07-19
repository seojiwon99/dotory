package co.dotory.board.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dotory.board.service.BoardService;
import co.dotory.board.service.BoardVO;
import co.dotory.board.service.ReplyService;
import co.dotory.board.service.ReplyVO;
import co.dotory.board.serviceImpl.BoardServiceImpl;
import co.dotory.board.serviceImpl.ReplyServiceImpl;
import co.dotory.common.Command;

public class BoardDetail implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		BoardService svc = new BoardServiceImpl();
		ReplyService replysvc = new ReplyServiceImpl();
		
		String brdNo = req.getParameter("boardId");
		
		HttpSession session = req.getSession();
		String memberId = (String) session.getAttribute("id");
		
		// 조회수
		 svc.addCnt(Integer.parseInt(brdNo)); 
		
		BoardVO vo = svc.getBoard(Integer.parseInt(brdNo));
		req.setAttribute("board", vo);
		int num = svc.goodChk(memberId,Integer.parseInt(brdNo));
		req.setAttribute("goodchk", num);
		
		// 댓글
		List<ReplyVO> reply = replysvc.getReply(Integer.parseInt(brdNo));
		req.setAttribute("reply",reply);
		
		return "board/boardDetail";
	}

}
