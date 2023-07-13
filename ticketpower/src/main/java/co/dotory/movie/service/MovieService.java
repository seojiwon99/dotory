package co.dotory.movie.service;

import java.util.List;

public interface MovieService {
	public List<MovieVO> movieList();
	public MovieVO movieDetail(int movieId);
	public int movieAdd(MovieVO vo);
}
