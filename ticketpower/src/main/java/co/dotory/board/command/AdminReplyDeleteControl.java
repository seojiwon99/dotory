package co.dotory.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.board.service.ReplyService;
import co.dotory.board.serviceImpl.ReplyServiceImpl;
import co.dotory.common.Command;

public class AdminReplyDeleteControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		int replyid = Integer.parseInt(req.getParameter("replyid"));
		ReplyService svc = new ReplyServiceImpl();
		String ajax = "Ajax:";
		if(svc.replyDelte(replyid)) {
			System.out.println("삭제성공");
			return ajax+="1";
		}
		else {
			System.out.println("삭제실패");
			return ajax+="0";
		}
		
		
	}

}
