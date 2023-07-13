package co.dotory.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.dotory.member.service.MemberVO;

public interface MemberMapper {
	List<MemberVO> memberList(int page);
	List<MemberVO> memberSelectList(@Param("key") String key,@Param("val") String val);
	MemberVO memberSelect(String vo);
	MemberVO memberLogin(MemberVO vo);
	int memberInsert(MemberVO vo);
	int memberUpdate(MemberVO vo);
	int memberDelete(String vo);
	public int updateImage(MemberVO member);	
	boolean ismemberIdCheck(String Id);
	
	
	//member갯수
	public int totalCnt();
}
