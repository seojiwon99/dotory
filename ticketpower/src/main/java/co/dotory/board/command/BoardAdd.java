package co.dotory.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.board.service.BoardService;
import co.dotory.board.service.BoardVO;
import co.dotory.board.serviceImpl.BoardServiceImpl;
import co.dotory.common.Command;

public class BoardAdd implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		BoardService svc = new BoardServiceImpl();
		
		String memberid = req.getParameter("memberid");
		String brdtitle = req.getParameter("brdtitle");
		String brdcontent = req.getParameter("brdcontent");
		
		String result = "Ajax:";
		
		BoardVO vo = new BoardVO();
		vo.setMemberId(memberid);
		vo.setBoardTitle(brdtitle);
		vo.setBoardContent(brdcontent);
		
		if(svc.boardAdd(vo) == 0) {
			result += "0";
		}else {
			result += "1";
		}
		
		return result;
	}

}
