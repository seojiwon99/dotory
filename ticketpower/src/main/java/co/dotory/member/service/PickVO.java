package co.dotory.member.service;

import java.sql.Date;

import lombok.Data;

@Data
public class PickVO {
	private int pickId;
	private int movieId;
	private String memberId;
	private Date pickDate;
}
