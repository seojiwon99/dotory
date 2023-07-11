package co.dotory.member.service;

import java.util.List;

public interface PickService {
	List<PickVO> PickList();
	List<PickVO> PickList(String key, String val);
	
	PickVO pickSelect(PickVO vo);
	int pickInsert(PickVO vo);
	int pickDelete(PickVO vo);
	
	boolean ispickIdCheck(String Id);
}
