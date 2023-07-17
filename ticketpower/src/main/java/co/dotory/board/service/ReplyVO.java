package co.dotory.board.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReplyVO {
	
	private int replyId;
	private String reply;
	private String memberId;
	private int boardId;
	private String replyLevel;
	private int parentNum;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date replyDate;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date replyUpdate;
}
