package co.dotory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dotory.common.Command;

public class MainCommand implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {	
		return "main/main";
	}

}
