package co.dotory.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;

public class adminMemberPageControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		return "admin/adminMemberList.tiles";
	}

}
