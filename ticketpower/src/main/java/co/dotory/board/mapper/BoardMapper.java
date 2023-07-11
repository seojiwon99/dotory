package co.dotory.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.dotory.board.service.BoardVO;

public interface BoardMapper {
	
	// 게시판 목록
	public List<BoardVO> boardSelectList(int page);
	
	// 게시판 목록(ajax)
	public List<BoardVO> boardSelectList(@Param("key") String key, @Param("val") String val, @Param("page") int page);

	// 게시글 등록
	public int boardAdd(BoardVO vo);
	
	// 게시글 갯수
	public int totalCnt();

	public int totalCnt(@Param("key")String key, @Param("val") String val);
	
	// 게시글 상세보기
	public BoardVO getBoard(int boardId);
	
	public int addCnt(int boardId);
	
}
