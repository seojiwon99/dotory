package co.dotory.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;

public class BoardForm implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		
		return "board/boardForm";
	}

}
