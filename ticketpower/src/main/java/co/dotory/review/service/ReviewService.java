package co.dotory.review.service;

import java.util.List;

public interface ReviewService {
	List<ReviewVO> reviewList(int movieId);
	boolean addReview(ReviewVO vo);
	boolean delReview(ReviewVO vo);
	boolean modifyReview(ReviewVO vo);
	int totalCnt(ReviewVO vo);
	ReviewVO reviewOne(int reviewId);
	List<ReviewVO> pageReviewList(int movieId,int page);
}
