package co.dotory.movie.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.dotory.common.Command;
import co.dotory.movie.service.MovieService;
import co.dotory.movie.service.MovieVO;
import co.dotory.movie.serviceImpl.MovieServiceImpl;

public class AjaxMovieSearchList implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		MovieService svc = new MovieServiceImpl();
		List<MovieVO> vo = new ArrayList<>();
		
		ObjectMapper mapper = new ObjectMapper();
		String key = req.getParameter("key");
		String val = req.getParameter("val");
		vo = svc.movieSelectList(key, val);
		String str = "Ajax:";
		try {
			str += mapper.writeValueAsString(vo);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return str;
	}

}