package co.dotory.board.service;

import java.util.List;

public interface BoardService {
	
	// 게시판 목록(전체)
	public List<BoardVO> boardSelectList(int page);
	
	// 게시판 목록 검색(ajax)
	public List<BoardVO> boardSelectList(String key, String val, int page);
	
	// 게시판 등록
	public int boardAdd(BoardVO vo);
	
	// 게시글 수정
	public boolean boardDel(int boardId);
	
	public boolean boardUpdate(BoardVO vo);
	
	// 게시글 갯수
	public int totalCnt();
	
	public int totalCnt(String key,String val);
	
	// 게시글 상세보기
	public BoardVO getBoard(int boardId);
	
	// 조회수 추가
	public boolean addCnt(int boardId);
	
	// 좋아요 여부
	public int goodChk(String memeberId, int boardId);
	
	// 좋아요 여부 넣기
	public boolean insertGood(String memeberId, int boardId);
	
	// 좋아요 여부 삭제
	public boolean deleteGood(String memeberId, int boardId);
	
	// 좋아요 수 가져오기
	public int getGood(int boardId);

	public boolean boardDelete(int boardid);

	// 좋아요 수 수정
	/* public boolean updateGood(String memeberId, int boardId); */
}
