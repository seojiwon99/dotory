package co.dotory.member.service;

import java.util.List;

public interface MemberService {
	List<MemberVO> memberList();
	List<MemberVO> memberSelectList(String key, String val);
	
	MemberVO memberSelect(String vo);
	MemberVO memberLogin(MemberVO vo);
	int memberInsert(MemberVO vo);
	boolean memberUpdate(MemberVO vo);
	boolean memberDelete(String id);
	
	boolean ismemberIdCheck(String Id);
	
}
