package co.dotory.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.dotory.member.service.PickVO;
import co.dotory.movie.service.MovieVO;

public interface PickMapper {
	List<PickVO> userPickList(@Param("page") int page, @Param("memberId") String memberId);
	List<PickVO> userPickList(@Param("key") String key, @Param("val") String val, @Param("page") int page);
	PickVO pickSelect(PickVO vo);
	int pickInsert(PickVO vo);
	int pickDelete(PickVO vo);
	boolean ispickIdCheck(String Id);
	MovieVO movieDetail(int movieId);
	int moviePickCheck(PickVO vo);
	int moviePickUnCheck(PickVO vo);
	public int totalCnt();
	public int totalCnt(@Param("key")String key, @Param("val") String val);
	PickVO moviePick(@Param("movieId") int movieId, @Param("memberId") String memberId);

}
