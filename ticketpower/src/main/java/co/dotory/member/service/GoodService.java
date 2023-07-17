package co.dotory.member.service;

import java.util.List;

public interface GoodService {
	List<GoodVO> userGoodList(int page, String memberId);
	List<GoodVO> userGoodList(String key, String val, int page);
	GoodVO goodSelect(GoodVO vo);
	int goodInsert(GoodVO vo);
	int goodDelete(GoodVO vo);
	boolean isgoodIdCheck(String Id);
	int totalCnt();
	int totalCnt(String key,String val);
}
