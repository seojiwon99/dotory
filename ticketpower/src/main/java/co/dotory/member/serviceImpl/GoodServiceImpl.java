package co.dotory.member.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.dotory.common.DataSource;
import co.dotory.member.mapper.GoodMapper;
import co.dotory.member.service.GoodService;
import co.dotory.member.service.GoodVO;

public class GoodServiceImpl implements GoodService{
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private GoodMapper map = sqlSession.getMapper(GoodMapper.class);
	
	@Override
	public List<GoodVO> userGoodList(int page, String memberId) {
		return map.userGoodList(page, memberId);
	}

	@Override
	public List<GoodVO> userGoodList(String key, String val, int page) {
		return map.userGoodList(key, val, page);
	}

	@Override
	public GoodVO goodSelect(GoodVO vo) {
		return map.goodSelect(vo);
	}

	@Override
	public int goodInsert(GoodVO vo) {
		return map.goodInsert(vo);
	}

	@Override
	public int goodDelete(GoodVO vo) {
		return map.goodDelete(vo);
	}

	@Override
	public boolean isgoodIdCheck(String Id) {
		return map.isgoodIdCheck(Id);
	}

	@Override
	public int totalCnt() {
		return map.totalCnt();
	}

	@Override
	public int totalCnt(String key, String val) {
		return map.totalCnt(key,val);
	}

}
