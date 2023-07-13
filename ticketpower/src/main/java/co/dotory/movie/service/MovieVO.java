package co.dotory.movie.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MovieVO {
	private int movieId;
	private String movieName;
	private int movieAge;
	private String movieRuntime;
	private double movieLike;
	private String movieGenre;
	private String movieSummary;
	private String moviePosterImg;
	private String movieBackImg;
	private Date movieRelease;
}
