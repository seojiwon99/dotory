package co.dotory.movie.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dotory.common.Command;
import co.dotory.common.PageDTO;
import co.dotory.member.service.PickService;
import co.dotory.member.service.PickVO;
import co.dotory.member.serviceImpl.PickServiceImpl;
import co.dotory.movie.service.MovieService;
import co.dotory.movie.service.MovieVO;
import co.dotory.movie.serviceImpl.MovieServiceImpl;
import co.dotory.review.service.ReviewService;
import co.dotory.review.service.ReviewVO;
import co.dotory.review.serviceImpl.ReviewServiceImpl;

public class MovieDetailPageControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		int id = Integer.parseInt(req.getParameter("movieId"));
		String memberId = (String) session.getAttribute("id");
		MovieService movieService = new MovieServiceImpl();
		ReviewService reviewService = new ReviewServiceImpl();
		ReviewVO vo = new ReviewVO();
		vo.setMovieId(id);
		//영화디테일
		MovieVO movie = movieService.movieDetail(id);
		
		//좋아요 유무
		PickService pickService = new PickServiceImpl();
		PickVO pickVo = pickService.moviePick((id), memberId);
		
		//리뷰 리스트
		List<ReviewVO> review = reviewService.reviewList(id);
		
		PageDTO page = new PageDTO(1, reviewService.totalCnt(vo));
		req.setAttribute("page",page);
		
		req.setAttribute("movieDetail", movie);
		req.setAttribute("reviewList", review);
		req.setAttribute("pickVo", pickVo);
		return "movie/movieDetail";
	}

}
