package co.dotory.member.service;

import java.util.List;

public interface MemberService {
	List<MemberVO> memberList();
	List<MemberVO> memberList(String key, String val);
	
	MemberVO memberSelect(MemberVO vo);
	int memberInsert(MemberVO vo);
	int memberUpdate(MemberVO vo);
	int memberDelete(MemberVO vo);
	
	boolean ismemberIdCheck(String Id);
	
}
