package co.dotory.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.dotory.member.service.PickVO;

public interface PickMapper {
	List<PickVO> userPickList(int page);
	List<PickVO> userPickList(@Param("key") String key,@Param("val") String val, @Param("page") int page);
	
	PickVO pickSelect(PickVO vo);
	int pickInsert(PickVO vo);
	int pickDelete(PickVO vo);
	boolean ispickIdCheck(String Id);
	
	PickVO moviePick(@Param("movieId") int movieId, @Param("memberId") String memberId );
	int moviePickCheck(PickVO vo);
	int moviePickUnCheck(PickVO vo);
}
