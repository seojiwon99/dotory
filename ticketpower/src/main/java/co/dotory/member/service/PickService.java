package co.dotory.member.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface PickService {
	List<PickVO> userPickList(int page, String memberId);
	List<PickVO> userPickList(String key, String val, int page);
	PickVO pickSelect(PickVO vo);
	int pickInsert(PickVO vo);
	int pickDelete(PickVO vo);
	boolean ispickIdCheck(String Id);
	int totalCnt();

	PickVO moviePick(int movieId, String memberId);
	boolean moviePickCheck(PickVO vo);
	boolean moviePickUnCheck(PickVO vo);

	int totalCnt(String key,String val);

}
