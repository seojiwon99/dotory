package co.dotory.member.service;

import java.util.List;

import co.dotory.member.service.MemberVO;

public interface MemberService {
	List<MemberVO> memberSelectList();//R
	int memberUpdate(MemberVO vo);//U
	int memberDelete(MemberVO vo);//D
	
	
}
