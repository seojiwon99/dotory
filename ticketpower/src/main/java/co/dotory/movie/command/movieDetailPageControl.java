package co.dotory.movie.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;
import co.dotory.movie.service.MovieService;
import co.dotory.movie.service.MovieVO;
import co.dotory.movie.serviceImpl.MovieServiceImpl;
import co.dotory.review.service.ReviewService;
import co.dotory.review.service.ReviewVO;
import co.dotory.review.serviceImpl.ReviewServiceImpl;

public class movieDetailPageControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(req.getParameter("movieId"));
		MovieService movieService = new MovieServiceImpl();
		ReviewService reviewService = new ReviewServiceImpl();
		
		//영화디테일
		MovieVO movie = movieService.movieDetail(id);
		
		//리뷰 리스트
		List<ReviewVO> review = reviewService.reviewList(id);
	
		
		req.setAttribute("movieDetail", movie);
		req.setAttribute("reviewList", review);
		return "movie/movieDetail";
	}

}
