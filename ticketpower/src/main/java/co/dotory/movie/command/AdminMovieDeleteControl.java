package co.dotory.movie.command;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;
import co.dotory.movie.service.MovieService;
import co.dotory.movie.serviceImpl.MovieServiceImpl;

public class AdminMovieDeleteControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		
		String[] id = req.getParameterValues("check");	
		MovieService svc = new MovieServiceImpl();
		 for (int i = 0; i < id.length; i++) {
			 svc.movieDelete(Integer.parseInt(id[i]));
	      }
		return "adminMoviePage.do";
	}

}
