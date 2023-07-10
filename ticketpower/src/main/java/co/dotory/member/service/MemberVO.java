package co.dotory.member.service;



import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MemberVO {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberTel;
	private String memberAddr;
	private String memberAuthor;
	private String memberImg;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING , pattern="yyyy-MM-dd")
	private Date memberEdate;
	@JsonFormat(shape=JsonFormat.Shape.STRING , pattern="yyyy-MM-dd")
	private Date memberDdate;
}
