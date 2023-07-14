package co.dotory.board.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
	
	private int boardId;
	private String boardTitle;
	private String boardContent;
	private int boardCnt;
	private String memberId;
	private int boardReply;
	private int boardGood;
	private int boardNum;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date boardDate;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date boardUpdate;
	
}	
