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
	
	// 게시글 삭제
	public int boardDel(int boardId);
	
	// 게시글 수정
	public int boardUpdate(BoardVO vo);

	public int totalCnt(@Param("key")String key, @Param("val") String val);
	
	// 게시글 상세보기
	public BoardVO getBoard(int boardId);
	
	// 게시글 조회수
	public int addCnt(int boardId);
	
	// 좋아요 여부
	public int goodChk(@Param("memberId") String memberId , @Param("boardId") int boardId);
	
	// 좋아요 기록 추가
	public int insertGood(@Param("memberId") String memberId , @Param("boardId") int boardId);
	
	// 좋아요 기록 삭제
	public int deleteGood(@Param("memberId") String memberId , @Param("boardId") int boardId);
	
	// 좋아요 수 가져오기
	public int getGood(@Param("boardId") int boardId);
	

	//관리자 게시글삭제
	public boolean boardDelete(int boardid);

}
