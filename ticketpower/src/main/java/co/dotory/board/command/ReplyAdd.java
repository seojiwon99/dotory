package co.dotory.board.command;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.dotory.board.service.ReplyService;
import co.dotory.board.service.ReplyVO;
import co.dotory.board.serviceImpl.ReplyServiceImpl;
import co.dotory.common.Command;

public class ReplyAdd implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		ReplyService svc = new ReplyServiceImpl();
		
		String result = "Ajax:";
		String reply = req.getParameter("reply");
		String boardId = req.getParameter("boardId");
	
		
		String memberId = (String) session.getAttribute("id");
		
		ObjectMapper mapper = new ObjectMapper();
		ReplyVO vo = new ReplyVO();
		vo.setBoardId(Integer.parseInt(boardId));
		vo.setReply(reply);
		vo.setMemberId(memberId);


       
        
		if(svc.replyAdd(vo)) {
			try {
				result += mapper.writeValueAsString(vo);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
		}else {
		
		}
		
		return result;
	}

}
