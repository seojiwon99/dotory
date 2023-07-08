package co.dotory.movie.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;

public class adminMoviePageControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		return "admin/adminMovieList.tiles";
	}

}
