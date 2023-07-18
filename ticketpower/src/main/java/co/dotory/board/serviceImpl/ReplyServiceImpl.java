package co.dotory.board.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.dotory.board.mapper.ReplyMapper;
import co.dotory.board.service.ReplyService;
import co.dotory.board.service.ReplyVO;
import co.dotory.common.DataSource;

public class ReplyServiceImpl implements ReplyService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private ReplyMapper map = sqlSession.getMapper(ReplyMapper.class);
	
	@Override
	public List<ReplyVO> getReply(int boardId) {
		return map.getReply(boardId);
	}
	
	@Override
	public boolean replyAdd(ReplyVO vo) {
		return map.replyAdd(vo) == 1;
	}

	@Override
	public boolean replyDelte(int id) {
		return map.replyDelete(id); 
	}

	@Override
	public boolean replyUpdate(ReplyVO vo) {
		return map.replyUpdate(vo) == 1;
	}

	@Override
	public boolean commentAdd(ReplyVO vo) {
		return map.commentAdd(vo) == 1;
	}

	@Override
	public boolean replydDel(int replyId) {
		return map.replydDel(replyId);
	}

}
