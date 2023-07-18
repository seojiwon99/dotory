package co.dotory.movie.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dotory.common.Command;
import co.dotory.movie.service.MovieService;
import co.dotory.movie.service.MovieVO;
import co.dotory.movie.serviceImpl.MovieServiceImpl;

public class MovieListPageControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		
		MovieService service = new MovieServiceImpl();
		List<MovieVO> list = service.movieList();
		HttpSession session = req.getSession();
		
		session.getAttribute("id");
		req.setAttribute("movieList", list);
		
		
		return "movie/movieList";
	}

}
