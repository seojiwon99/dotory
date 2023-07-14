package co.dotory.movie.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.dotory.common.DataSource;
import co.dotory.movie.mapper.MovieMapper;
import co.dotory.movie.service.MovieService;
import co.dotory.movie.service.MovieVO;

public class MovieServiceImpl implements MovieService{
	SqlSession session = DataSource.getInstance().openSession(true);
	MovieMapper mapper = session.getMapper(MovieMapper.class);
	@Override
	public List<MovieVO> movieList() {
		// TODO Auto-generated method stub
		return mapper.movieList();
	}
	@Override
	public MovieVO movieDetail(int movieId) {
		// TODO Auto-generated method stub
		return mapper.movieDetail(movieId);
	}
	@Override
	public int movieAdd(MovieVO vo) {
		return mapper.movieAdd(vo);
	}
	@Override
	public int movieDelete(int id) {
		return mapper.movieDelete(id);
	}
	@Override
	public int movieModify(MovieVO vo) {
		return mapper.movieModify(vo);
	}
	@Override
	public List<MovieVO> movieSelectList(String key, String val) {
		return mapper.movieSelectList(key, val);
	}

}
