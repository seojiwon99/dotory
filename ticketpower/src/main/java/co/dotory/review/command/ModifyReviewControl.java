package co.dotory.review.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;
import co.dotory.review.service.ReviewService;
import co.dotory.review.service.ReviewVO;
import co.dotory.review.serviceImpl.ReviewServiceImpl;

public class ModifyReviewControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		String review = req.getParameter("review");
		String reviewId = req.getParameter("reviewId");
		ReviewService service = new ReviewServiceImpl();
		ReviewVO vo = new ReviewVO();
		String result = "Ajax:";
		vo.setReview(review);
		vo.setReviewId(Integer.parseInt(reviewId));
		
		// 변경된것이 있으면 Ajax:1 없으면 Ajax:0 
		if(service.modifyReview(vo)) {
			return result += "1";
		} else {
			return result += "0";
		}
	}

}
