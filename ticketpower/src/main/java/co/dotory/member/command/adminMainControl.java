package co.dotory.member.command;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;


public class adminMainControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		System.out.println(123);
		return "admin/adminMain.tiles";
	}

}