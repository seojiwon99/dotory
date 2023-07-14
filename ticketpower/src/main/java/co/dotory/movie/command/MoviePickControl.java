package co.dotory.movie.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;
import co.dotory.member.service.PickService;
import co.dotory.member.service.PickVO;
import co.dotory.member.serviceImpl.PickServiceImpl;

public class MoviePickControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		String memberId = req.getParameter("memberId");
		String movieId = req.getParameter("movieId");
		String result = "Ajax:";
		
		PickService service = new PickServiceImpl();
		PickVO vo = service.moviePick(Integer.parseInt(movieId), memberId);
		
		
		if(vo == null) {
			PickVO pickVO = new PickVO();
			pickVO.setMemberId(memberId);
			pickVO.setMovieId(Integer.parseInt(movieId));
			service.moviePickCheck(pickVO);
			return result += "1";
		} else {
			service.moviePickUnCheck(vo);
			return result += "0";
		}
		
	}

}
