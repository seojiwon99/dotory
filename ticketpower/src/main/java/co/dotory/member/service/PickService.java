package co.dotory.member.service;

import java.util.List;

public interface PickService {
	List<PickVO> UserPickList(int page);
	List<PickVO> UserPickList(String key, String val, int page);
	PickVO pickSelect(PickVO vo);
	int pickInsert(PickVO vo);
	int pickDelete(PickVO vo);
	boolean ispickIdCheck(String Id);
	int totalCnt();
	
}
