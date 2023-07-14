package co.dotory.movie.mapper;

import java.util.List;

import co.dotory.movie.service.MovieVO;

public interface MovieMapper {
	List<MovieVO> movieList();
	MovieVO movieDetail(int movieId);
	int movieAdd(MovieVO vo);
	int movieDelete(int id);
	MovieVO movieModify(MovieVO vo);
}
