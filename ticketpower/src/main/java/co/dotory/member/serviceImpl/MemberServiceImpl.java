package co.dotory.member.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.dotory.common.DataSource;
import co.dotory.member.mapper.MemberMapper;
import co.dotory.member.service.MemberService;
import co.dotory.member.service.MemberVO;

public class MemberServiceImpl implements MemberService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private MemberMapper map = sqlSession.getMapper(MemberMapper.class);
	@Override
	public List<MemberVO> memberList() {
		return map.memberList();
	}

	@Override
	public List<MemberVO> memberSelectList(String key, String val) {
		// TODO Auto-generated method stub
		return map.memberSelectList(key, val);
	}
	
	@Override
	public MemberVO memberLogin(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.memberLogin(vo);
	}
	@Override
	public MemberVO memberSelect(String vo) {
		// TODO Auto-generated method stub
		return map.memberSelect(vo);
	}

	@Override
	public int memberInsert(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.memberInsert(vo);
	}

	@Override
	public boolean memberUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.memberUpdate(vo);
	}

	@Override
	public boolean memberDelete(String vo) {
		// TODO Auto-generated method stub
		return map.memberDelete(vo);
	}

	@Override
	public boolean ismemberIdCheck(String Id) {
		// TODO Auto-generated method stub
		return map.ismemberIdCheck(Id);
	}

}
