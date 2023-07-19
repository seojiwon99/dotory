package co.dotory.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.dotory.board.service.ReplyService;
import co.dotory.board.service.ReplyVO;
import co.dotory.board.serviceImpl.ReplyServiceImpl;
import co.dotory.common.Command;

public class ReplyEdit implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		String reply = req.getParameter("reply");
		System.out.println(reply);
		String replyId = req.getParameter("replyId");
		String result = "Ajax:";
		
		ReplyService svc = new ReplyServiceImpl();
		ObjectMapper mapper = new ObjectMapper();
		
		ReplyVO vo = new ReplyVO();
		vo.setReply(reply);
		vo.setReplyId(Integer.parseInt(replyId));
		
		
		if(svc.replyUpdate(vo)) {
			try {
				result += mapper.writeValueAsString(vo);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
		}else {
			System.out.println("오류");
		}
		
		return result;
	}

}
