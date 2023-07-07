package co.dotory.board.service;

import java.util.List;

public interface BoardService {
	
	// 회원 목록(전체)
	public List<BoardVO> boardSelectList();
	
	// 회원 목록 검색(ajax)
	public List<BoardVO> boardSelectList(String key, String val);
	

}
