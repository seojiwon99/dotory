package co.dotory.member.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.dotory.common.DataSource;
import co.dotory.member.mapper.PickMapper;
import co.dotory.member.service.PickService;
import co.dotory.member.service.PickVO;

public class PickServiceImpl implements PickService{
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private PickMapper map = sqlSession.getMapper(PickMapper.class);
	
	@Override
	public List<PickVO> PickList() {
		return map.pickList();
	}

	@Override
	public List<PickVO> PickList(String key, String val) {
		return map.pickList(key, val);
	}

	@Override
	public PickVO pickSelect(PickVO vo) {
		return map.pickSelect(vo);
	}

	@Override
	public int pickInsert(PickVO vo) {
		return map.pickInsert(vo);
	}

	@Override
	public int pickDelete(PickVO vo) {
		return map.pickDelete(vo);
	}

	@Override
	public boolean ispickIdCheck(String Id) {
		return map.ispickIdCheck(Id);
	}

}
