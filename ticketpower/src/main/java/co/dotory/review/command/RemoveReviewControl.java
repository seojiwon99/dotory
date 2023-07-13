package co.dotory.review.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;
import co.dotory.review.service.ReviewService;
import co.dotory.review.service.ReviewVO;
import co.dotory.review.serviceImpl.ReviewServiceImpl;

public class RemoveReviewControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		String reviewId = req.getParameter("reviewId");
		ReviewService service = new ReviewServiceImpl();
		ReviewVO vo = new ReviewVO();
		String result = "Ajax:";
		vo.setReviewId(Integer.parseInt(reviewId));
		
		if(service.delReview(vo)) {
			return result += "1";
		} else {
			return result += "0";
		}
	}

}
