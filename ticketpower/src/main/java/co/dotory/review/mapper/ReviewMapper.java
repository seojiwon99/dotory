package co.dotory.review.mapper;

import java.util.List;

import co.dotory.review.service.ReviewVO;

public interface ReviewMapper {
	List<ReviewVO> reviewList(int movieId);
	int addReview(ReviewVO vo);
	int delReview(ReviewVO vo);
	int modifyReview(ReviewVO vo);
}
