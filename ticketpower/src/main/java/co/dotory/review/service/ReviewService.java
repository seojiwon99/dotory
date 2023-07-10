package co.dotory.review.service;

import java.util.List;

public interface ReviewService {
	List<ReviewVO> reviewList(int movieId);
	boolean addReview(ReviewVO vo);
	boolean delReview(ReviewVO vo);
	boolean modifyReview(ReviewVO vo);
}
