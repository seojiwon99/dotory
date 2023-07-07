package co.dotory.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.dotory.member.service.MemberVO;

public interface MemberMapper {
	List<MemberVO> memberList();
	List<MemberVO> memberList(@Param("key") String key,@Param("val") String val);
	
	MemberVO memberSelect(MemberVO vo);
	int memberInsert(MemberVO vo);
	int memberUpdate(MemberVO vo);
	int memberDelete(MemberVO vo);
	
	boolean ismemberIdCheck(String Id);
}
