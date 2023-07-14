package co.dotory.movie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import co.dotory.movie.service.MovieVO;

public interface MovieMapper {
	List<MovieVO> movieList();
	List<MovieVO> movieSelectList(@Param("key") String key,@Param("val") String val);
	MovieVO movieDetail(int movieId);
	int movieAdd(MovieVO vo);
	int movieDelete(int id);
	int movieModify(MovieVO vo);
	

}
