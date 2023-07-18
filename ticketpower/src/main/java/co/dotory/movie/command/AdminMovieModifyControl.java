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

public class AdminMovieModifyControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		String savePath = req.getServletContext().getRealPath("/images");
		int maxSize = 1024 * 1024 * 10;
		String enc = "UTF-8";
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		try {
			MultipartRequest multi = new MultipartRequest(req, savePath, maxSize, enc, new DefaultFileRenamePolicy());
			String posterimg = multi.getFilesystemName("movieposterimg");
			String name = multi.getParameter("moviename");
			String genre = multi.getParameter("moviegenre");
			String runtime = multi.getParameter("movieruntime");
			String summary = multi.getParameter("moviesummary");
			String backimg = multi.getFilesystemName("moviebackimg");
			String release = multi.getParameter("movierelease");
			LocalDate releaseDate = LocalDate.parse(release, formatter);
			int id = Integer.parseInt(multi.getParameter("movieid"));
			int age = Integer.parseInt(multi.getParameter("movieage"));

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
			vo.setMovieRelease(Date.valueOf(releaseDate));

			if (svc.movieModify(vo) == 0) {
				return "adminMovieModify.do";
			} else {
				return "adminMoviePage.do";
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;

	}

}
