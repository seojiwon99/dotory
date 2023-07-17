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
	public List<BoardVO> boardSelectList(int page) {
		return map.boardSelectList(page);
	}

	@Override
	public List<BoardVO> boardSelectList(String key, String val, int page) {
		return map.boardSelectList(key, val, page);
	}

	@Override
	public int boardAdd(BoardVO vo) {
		return map.boardAdd(vo);
	}

	@Override
	public int totalCnt() {
		return map.totalCnt();
	}

	@Override
	public BoardVO getBoard(int boardId) {
		return map.getBoard(boardId);
	}

	@Override
	public boolean addCnt(int boardId) {
		return map.addCnt(boardId) == 1;
	}

	@Override
	public int totalCnt(String key, String val) {
		return map.totalCnt(key,val);
	}

	@Override
	public int goodChk(String memeberId, int boardId) {
		return map.goodChk(memeberId, boardId);
	}

	@Override
	public boolean insertGood(String memeberId, int boardId) {
		return map.insertGood(memeberId, boardId) == 1;
	}

	@Override
	public boolean deleteGood(String memeberId, int boardId) {
		return map.deleteGood(memeberId, boardId) == 1;
	}

	@Override
	public int getGood(int boardId) {
		return map.getGood(boardId);
	}

	@Override

	public boolean boardDel(int boardId) {
		return map.boardDel(boardId) == 1;
	}

	@Override
	public boolean boardUpdate(BoardVO vo) {
		return map.boardUpdate(vo) == 1;
	}
	
	@Override
	public boolean boardDelete(int boardid) {
		return map.boardDelete(boardid);
	}

	


}
