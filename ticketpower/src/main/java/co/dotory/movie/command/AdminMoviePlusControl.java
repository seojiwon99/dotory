package co.dotory.movie.command;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.dotory.common.Command;
import co.dotory.movie.service.MovieService;
import co.dotory.movie.service.MovieVO;
import co.dotory.movie.serviceImpl.MovieServiceImpl;

public class AdminMoviePlusControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		String savePath = req.getServletContext().getRealPath("/images");
		int maxSize = 1024 * 1024 * 10;
		String enc = "UTF-8";
		
		try {
			MultipartRequest multi = new MultipartRequest(req, savePath, maxSize, enc, new DefaultFileRenamePolicy());

			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String name = multi.getParameter("name");
			String age = multi.getParameter("age");
			int age1 = Integer.parseInt(age);

			String genre = multi.getParameter("genre");
			String runtime = multi.getParameter("runtime");
			String summary = multi.getParameter("summary");
			String posterimg = multi.getFilesystemName("posterimg");
			String backimg = multi.getFilesystemName("backimg");
			String release = multi.getParameter("release");
		

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
				
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "adminMoviePage.do";
	}

}
