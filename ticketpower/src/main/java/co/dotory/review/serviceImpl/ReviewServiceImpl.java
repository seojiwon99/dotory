package co.dotory.review.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.dotory.common.DataSource;
import co.dotory.review.mapper.ReviewMapper;
import co.dotory.review.service.ReviewService;
import co.dotory.review.service.ReviewVO;

public class ReviewServiceImpl implements ReviewService{
	SqlSession session = DataSource.getInstance().openSession(true);
	ReviewMapper mapper = session.getMapper(ReviewMapper.class);
	@Override
	public List<ReviewVO> reviewList(int movieId) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean addReview(ReviewVO vo) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean delReview(ReviewVO vo) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean modifyReview(ReviewVO vo) {
		// TODO Auto-generated method stub
		return false;
	}
}
