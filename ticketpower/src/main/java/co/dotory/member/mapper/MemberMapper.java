package co.dotory.member.mapper;

import java.util.List;

import co.dotory.member.service.MemberVO;

public interface MemberMapper {
	List<MemberVO> memberSelectList();
	int memberUpdate(MemberVO vo);//U
	int memberDelete(MemberVO vo);//D
}
