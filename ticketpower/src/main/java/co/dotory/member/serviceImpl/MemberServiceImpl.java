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
	public List<MemberVO> memberList(int page) {
		return map.memberList(page);
	}

	@Override
	public List<MemberVO> memberSelectList(String key, String val) {
		// TODO Auto-generated method stub
		return map.memberSelectList(key, val);
	}
	
	@Override
	public MemberVO memberLogin(String id, String pw) {
		MemberVO vo = new MemberVO();
		vo.setMemberId(id);
		vo.setMemberPw(pw);
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
		return map.memberUpdate(vo) == 1;
	}

	@Override
	public boolean memberDelete(String vo) {
		// TODO Auto-generated method stub
		return map.memberDelete(vo) == 1;
	}

	@Override
	public boolean ismemberIdCheck(String id) {
		// TODO Auto-generated method stub
		return map.ismemberIdCheck(id);
	}
	
	@Override
	public boolean modifyImage(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.updateImage(vo) == 1;
	}

	@Override
	public int totalCnt() {
		return map.totalCnt();
	}

}
