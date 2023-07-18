package co.dotory.board.mapper;

import java.util.List;

import co.dotory.board.service.ReplyVO;

public interface ReplyMapper {
	
	// 댓글 목록
	public List<ReplyVO> getReply(int boardId);
	
	// 댓글 등록
	public int replyAdd(ReplyVO vo);

	// 댓글 삭제
	public boolean replyDelete(int id);
	
	// 댓글 수정
	public int replyUpdate(ReplyVO vo);
	
	// 대댓글 등록
	public int commentAdd(ReplyVO replyvo);
	
	// 삭제
	public boolean replydDel(int replyId);
}
