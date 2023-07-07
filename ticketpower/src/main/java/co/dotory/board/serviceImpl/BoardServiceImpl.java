package co.dotory.board.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.dotory.board.mapper.BoardMapper;
import co.dotory.board.service.BoardService;
import co.dotory.board.service.BoardVO;
import co.dotory.common.DataSource;
import lombok.Data;

public class BoardServiceImpl implements BoardService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private BoardMapper map = sqlSession.getMapper(BoardMapper.class);
	
	@Override
	public List<BoardVO> boardSelectList() {
		return map.boardSelectList();
	}

	@Override
	public List<BoardVO> boardSelectList(String key, String val) {
		return map.boardSelectList(key, val);
	}

}
