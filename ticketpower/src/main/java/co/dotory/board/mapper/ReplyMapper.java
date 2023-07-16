package co.dotory.board.mapper;

import java.util.List;

import co.dotory.board.service.ReplyVO;

public interface ReplyMapper {
	
	// 댓글 목록
	public List<ReplyVO> getReply(int boardId);
	
	// 댓글 등록
	public int replyAdd(ReplyVO vo);

	public boolean replyDelete(int id);
}
