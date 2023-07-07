package co.dotory.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.dotory.board.service.BoardVO;

public interface BoardMapper {
	
	// 게시판 목록
	public List<BoardVO> boardSelectList();
	
	// 게시판 목록(ajax)
	public List<BoardVO> boardSelectList(@Param("key") String key, @Param("val") String val);
}
