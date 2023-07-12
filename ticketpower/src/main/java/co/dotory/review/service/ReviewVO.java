package co.dotory.review.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewVO {
	private int reviewId;
	private String review;
	private Date reviewDate;
	private Date reviewUpdate;
	private int movieId;
	private String memberId;
	private int reviewLike;
}
