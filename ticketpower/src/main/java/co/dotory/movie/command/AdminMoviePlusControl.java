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

public class AdminMoviePlusControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		DateTimeFormatter formatter= DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		int age1 = Integer.parseInt(age);
		
		String genre = req.getParameter("genre");
		String runtime = req.getParameter("runtime");
		String summary = req.getParameter("summary");
		String posterimg = req.getParameter("posterimg");
		String backimg = req.getParameter("backimg");
		
		String release = req.getParameter("release");
		LocalDate releaseDate = LocalDate.parse(release, formatter); 
		MovieService svc = new MovieServiceImpl();
		MovieVO vo = new MovieVO();
		
		vo.setMovieName(name);
		vo.setMovieAge(age1);
		vo.setMovieGenre(genre);
		vo.setMovieRuntime(runtime);
		vo.setMovieSummary(summary);
		vo.setMoviePosterImg(posterimg);
		vo.setMovieBackImg(backimg);
		vo.setMovieRelease(Date.valueOf(releaseDate));
		
		svc.movieAdd(vo);
		
		System.out.println("등록완료");
		
		
		
		return "adminMoviePage.do";
	}

}
