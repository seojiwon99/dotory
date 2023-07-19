package co.dotory.board.service;

import java.util.List;

public interface ReplyService {
	
	// 댓글 목록 가져오기
	public List<ReplyVO> getReply(int boardId);
	
	// 댓글 등록
	public boolean replyAdd(ReplyVO vo);
	
	// 댓글 삭제
	public boolean replyDelte(int id);
	
	// 댓글 수정
	public boolean replyUpdate(ReplyVO vo);
	
	// 대댓글 등록
	public boolean commentAdd(ReplyVO vo);
	
	// 삭제
	public boolean replydDel(int replyId);
}
