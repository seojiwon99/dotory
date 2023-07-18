package co.dotory.review.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.dotory.common.Command;
import co.dotory.review.service.ReviewService;
import co.dotory.review.service.ReviewVO;
import co.dotory.review.serviceImpl.ReviewServiceImpl;

public class AddReviewControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		String movieId = req.getParameter("movieId");
		String memberId = req.getParameter("memberId");
		String review = req.getParameter("review");
		String reviewLike = req.getParameter("reviewLike");
		ObjectMapper mapper = new ObjectMapper();
		String result = "Ajax:";
		ReviewVO vo = new ReviewVO();
		vo.setMovieId(Integer.parseInt(movieId));
		vo.setMemberId(memberId);
		vo.setReview(review);
		vo.setReviewLike(Integer.parseInt(reviewLike));
		ReviewService service = new ReviewServiceImpl();
		//ㅎㅇ
		
		if(service.addReview(vo)) {
			result += "1";
		} else {
			result += "0";
		}
		
		return result;
	}

}
