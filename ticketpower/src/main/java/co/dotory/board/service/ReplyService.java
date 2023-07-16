package co.dotory.board.service;

import java.util.List;

public interface ReplyService {
	
	// 댓글 목록 가져오기
	public List<ReplyVO> getReply(int boardId);
	
	// 댓글 등록
	public boolean replyAdd(ReplyVO vo);

	public boolean replyDelte(int id);
	
}
