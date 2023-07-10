package co.dotory.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.dotory.member.service.PickVO;

public interface PickMapper {
	List<PickVO> pickList();
	List<PickVO> pickList(@Param("key") String key,@Param("val") String val);
	
	PickVO pickSelect(PickVO vo);
	int pickInsert(PickVO vo);
	int pickDelete(PickVO vo);
	boolean ispickIdCheck(String Id);
}
