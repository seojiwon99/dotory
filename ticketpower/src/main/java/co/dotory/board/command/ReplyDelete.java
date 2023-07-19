package co.dotory.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.board.service.ReplyService;
import co.dotory.board.serviceImpl.ReplyServiceImpl;
import co.dotory.common.Command;

public class ReplyDelete implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		String replyId = req.getParameter("replyId");
		
		ReplyService svc = new ReplyServiceImpl();
		String ajax = "Ajax:";
		if(svc.replydDel(Integer.parseInt(replyId))) {
			return ajax+="1";
		}else {
			return ajax+="0";
		}
		
	}

}
