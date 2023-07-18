package co.dotory.movie.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;
import co.dotory.common.PageDTO;
import co.dotory.movie.service.MovieService;
import co.dotory.movie.service.MovieVO;
import co.dotory.movie.serviceImpl.MovieServiceImpl;

public class AdminMoviePageControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		MovieService svc = new MovieServiceImpl();

		List<MovieVO> list = svc.movieList();
		req.setAttribute("mvlist", list);
	
		
		return "admin/adminMovieList.tiles";
	}

}
