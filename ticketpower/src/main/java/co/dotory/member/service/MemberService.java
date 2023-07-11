package co.dotory.member.service;

import java.util.List;

public interface MemberService {
	List<MemberVO> memberList();
	List<MemberVO> memberSelectList(String key, String val);
	MemberVO memberSelect(String vo);
	int memberInsert(MemberVO vo);
	boolean memberUpdate(MemberVO vo);
	boolean memberDelete(String id);
	public boolean modifyImage(MemberVO vo);
	boolean ismemberIdCheck(String id);
	
}
