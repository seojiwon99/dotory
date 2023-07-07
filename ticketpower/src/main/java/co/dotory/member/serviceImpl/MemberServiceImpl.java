package co.dotory.member.serviceImpl;

import java.util.List;



import org.apache.ibatis.session.SqlSession;

import co.dotory.common.DataSource;
import co.dotory.member.mapper.MemberMapper;
import co.dotory.member.service.MemberService;
import co.dotory.member.service.MemberVO;





public class MemberServiceImpl implements MemberService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
	@Override
	public List<MemberVO> memberSelectList() {
		return mapper.memberSelectList();
	}
	@Override
	public int memberUpdate(MemberVO vo) {
		return 0;
	}
	@Override
	public int memberDelete(MemberVO vo) {
		return 0;
	}

}
