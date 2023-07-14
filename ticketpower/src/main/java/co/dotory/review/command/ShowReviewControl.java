package co.dotory.review.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.dotory.common.Command;
import co.dotory.review.service.ReviewService;
import co.dotory.review.service.ReviewVO;
import co.dotory.review.serviceImpl.ReviewServiceImpl;

public class ShowReviewControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		ObjectMapper mapper = new ObjectMapper();
		
		String id = req.getParameter("movieId");
		String page = req.getParameter("page");
		ReviewService service = new ReviewServiceImpl();
		List<ReviewVO> list = service.pageReviewList(Integer.parseInt(id),Integer.parseInt(page));
		String result = "Ajax:";
		
		try {
			result += mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

}
