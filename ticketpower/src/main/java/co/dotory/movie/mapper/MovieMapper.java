package co.dotory.movie.mapper;

import java.util.List;

import co.dotory.movie.service.MovieVO;

public interface MovieMapper {
	List<MovieVO> movieList();
	MovieVO movieDetail(int movieId);
}
