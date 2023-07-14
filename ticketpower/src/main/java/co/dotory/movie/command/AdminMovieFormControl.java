package co.dotory.movie.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;
import co.dotory.movie.service.MovieService;
import co.dotory.movie.service.MovieVO;
import co.dotory.movie.serviceImpl.MovieServiceImpl;

public class AdminMovieFormControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("movieid"));
		MovieVO vo = new MovieVO();
		MovieService svc = new MovieServiceImpl();
		vo = svc.movieDetail(id);
		
		req.setAttribute("search", vo);
		return "admin/adminMovieForm.tiles";
	}

}
