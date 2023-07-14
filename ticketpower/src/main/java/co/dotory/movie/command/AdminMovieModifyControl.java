package co.dotory.movie.command;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;
import co.dotory.movie.service.MovieService;
import co.dotory.movie.service.MovieVO;
import co.dotory.movie.serviceImpl.MovieServiceImpl;

public class AdminMovieModifyControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		String posterimg = req.getParameter("movieposterimg");
		String name = req.getParameter("moviename");
		String genre = req.getParameter("moviegenre");
		String runtime = req.getParameter("movieruntime");
		String summary = req.getParameter("moviesummary");
		String backimg = req.getParameter("moviebackimg");
		String release = req.getParameter("movierelease");
		LocalDate releaseDate = LocalDate.parse(release, formatter);
		
		int id = Integer.parseInt(req.getParameter("movieid"));
		int age = Integer.parseInt(req.getParameter("movieage"));
		int like = Integer.parseInt(req.getParameter("movieLike"));
		
		MovieService svc = new MovieServiceImpl();
		MovieVO vo = new MovieVO();
		
		vo.setMoviePosterImg(posterimg);
		vo.setMovieId(id);
		vo.setMovieName(name);
		vo.setMovieGenre(genre);
		vo.setMovieRuntime(runtime);
		vo.setMovieSummary(summary);
		vo.setMovieBackImg(backimg);
		vo.setMovieAge(age);
		vo.setMovieLike(like);
		vo.setMovieRelease(Date.valueOf(releaseDate));
		
		svc.movieModify(vo);
			
		
		
		
		return "adminMoviePage.do";
	}

}
