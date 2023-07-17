package co.dotory.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.dotory.member.service.GoodVO;

public interface GoodMapper {
	List<GoodVO> userGoodList(@Param("page") int page, @Param("memberId") String memberId);
	List<GoodVO> userGoodList(@Param("key") String key, @Param("val") String val, @Param("page") int page);
	GoodVO goodSelect(GoodVO vo);
	int goodInsert(GoodVO vo);
	int goodDelete(GoodVO vo);
	boolean isgoodIdCheck(String Id);
	public int totalCnt();
	public int totalCnt(@Param("key")String key, @Param("val") String val);
}
