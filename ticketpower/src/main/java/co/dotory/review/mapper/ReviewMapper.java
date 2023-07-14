package co.dotory.review.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.dotory.review.service.ReviewVO;

public interface ReviewMapper {
	List<ReviewVO> reviewList(int movieId);
	int addReview(ReviewVO vo);
	int delReview(ReviewVO vo);
	int modifyReview(ReviewVO vo);
	int totalCnt(ReviewVO vo);
	ReviewVO reviewOne(int reviewId);
	List<ReviewVO> pageReviewList(@Param("movieId") int movieId, @Param("page") int Page);
}
