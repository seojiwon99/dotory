package co.dotory.board.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.dotory.board.service.BoardService;
import co.dotory.board.service.BoardVO;
import co.dotory.board.serviceImpl.BoardServiceImpl;
import co.dotory.common.Command;
import co.dotory.common.PageDTO;

public class BoardSearch implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		BoardService svc = new BoardServiceImpl();
		ObjectMapper mapper = new ObjectMapper();
		
		String key = req.getParameter("key");
		String val = req.getParameter("val");
		
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		
		PageDTO dto = new PageDTO(Integer.parseInt(page), svc.totalCnt());
		
		List<BoardVO> vo = svc.boardSelectList(key, val, Integer.parseInt(page));
		
		String str = "Ajax:";
		
		try {
			str += mapper.writeValueAsString(vo);
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return str;
	}

}
