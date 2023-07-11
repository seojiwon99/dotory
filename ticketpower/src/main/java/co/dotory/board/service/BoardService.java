package co.dotory.board.service;

import java.util.List;

public interface BoardService {
	
	// 게시판 목록(전체)
	public List<BoardVO> boardSelectList(int page);
	
	// 게시판 목록 검색(ajax)
	public List<BoardVO> boardSelectList(String key, String val);
	
	// 게시판 등록
	public int boardAdd(BoardVO vo);
	
	// 게시글 갯수
	public int totalCnt();
	
	// 게시글 상세보기
	public BoardVO getBoard(int boardId);
}
