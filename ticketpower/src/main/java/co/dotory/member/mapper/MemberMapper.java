package co.dotory.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.dotory.member.service.MemberVO;

public interface MemberMapper {
	List<MemberVO> memberList(int page);
	List<MemberVO> memberSelectList(@Param("key") String key,@Param("val") String val);
	
	MemberVO memberSelect(String vo);
	int memberInsert(MemberVO vo);
	boolean memberUpdate(MemberVO vo);
	boolean memberDelete(String vo);
	
	boolean ismemberIdCheck(String Id);
	
	//member갯수
	public int totalCnt();
}
