package co.dotory.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.MainCommand;
import co.dotory.board.command.AdminBoardDeleteControl;
import co.dotory.board.command.AdminBoardDetailControl;
import co.dotory.board.command.AdminBoardListControl;
import co.dotory.board.command.AdminReplyDeleteControl;
import co.dotory.board.command.BoardAdd;
import co.dotory.board.command.BoardDetail;
import co.dotory.board.command.BoardForm;
import co.dotory.board.command.BoardGood;
import co.dotory.board.command.BoardList;
import co.dotory.board.command.BoardSearch;
import co.dotory.board.command.ReplyAdd;
import co.dotory.board.command.ReplyAdd2;
import co.dotory.board.command.ReplyDelete;
import co.dotory.board.command.ReplyEdit;
import co.dotory.common.Command;
import co.dotory.member.command.AdminMainControl;
import co.dotory.member.command.AdminMemberDeleteControl;
import co.dotory.member.command.AdminMemberForm;
import co.dotory.member.command.AdminMemberModifyControl;
import co.dotory.member.command.AdminMemberPageControl;
import co.dotory.member.command.AjaxMemberSearchList;
import co.dotory.member.command.ImageUpload;
import co.dotory.member.command.MemberIdcheck;
import co.dotory.member.command.MemberLogin;
import co.dotory.member.command.MemberLoginForm;
import co.dotory.member.command.MemberLogout;
import co.dotory.member.command.MemberRegist;
import co.dotory.member.command.MemberRegistForm;
import co.dotory.member.command.MemberSearch;
import co.dotory.member.command.UserGoodList;
import co.dotory.member.command.UserInfo;
import co.dotory.member.command.UserMain;
import co.dotory.member.command.UserModify;
import co.dotory.member.command.UserModifyForm;
import co.dotory.member.command.UserPickList;
import co.dotory.movie.command.AdminMovieAddControl;
import co.dotory.movie.command.AdminMovieDeleteControl;
import co.dotory.movie.command.AdminMovieFormControl;
import co.dotory.movie.command.AdminMovieModifyControl;
import co.dotory.movie.command.AdminMoviePageControl;
import co.dotory.movie.command.AdminMoviePlusControl;
import co.dotory.movie.command.MovieDetailPageControl;
import co.dotory.movie.command.MovieListPageControl;
import co.dotory.movie.command.MoviePickControl;
import co.dotory.review.command.AddReviewControl;
import co.dotory.review.command.ModifyReviewControl;
import co.dotory.review.command.RemoveReviewControl;
import co.dotory.review.command.ShowReviewControl;



@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private Map<String,Command> map = new HashMap<>();
	    
    public FrontController() {
        super();
        
    }


	public void init(ServletConfig config) throws ServletException {
		map.put("/main.do", new MainCommand());
		map.put("/memberLoginForm.do", new MemberLoginForm());
		map.put("/memberLogin.do", new MemberLogin());
		map.put("/memberLogout.do", new MemberLogout());
		map.put("/memberRegistForm.do", new MemberRegistForm());
		map.put("/memberRegist.do", new MemberRegist());
		map.put("/memberIdcheck.do", new MemberIdcheck());
		map.put("/memberSearch.do", new MemberSearch());
		
		
		// board(jiwon)
		map.put("/boardList.do", new BoardList()); // 게시판 목록화면
		
		map.put("/boardForm.do", new BoardForm()); // 게시판 등록화면
		
		map.put("/boardAdd.do", new BoardAdd()); // 게시판 등록 로직

		map.put("/boardDetail.do", new BoardDetail()); // 게시판 상세보기
		
		map.put("/boardSearch.do", new BoardSearch()); // 게시글 검색
		
		map.put("/boardGood.do", new BoardGood()); // 좋아요
		
		map.put("/replyAdd.do", new ReplyAdd()); // 댓글 등록
		
		map.put("/replyAdd2.do",new ReplyAdd2());// 대댓글 등록
		
		map.put("/replyEdit.do", new ReplyEdit());// 댓글 수정
		
		map.put("/replyDelete.do",new ReplyDelete()); // 댓글 삭제
		
		//관리자 (호현)
		map.put("/adminMainPage.do", new AdminMainControl());
		map.put("/adminMemberPage.do", new AdminMemberPageControl());	
		map.put("/adminMemberForm.do", new AdminMemberForm());
		map.put("/adminMemberModify.do", new AdminMemberModifyControl());
		map.put("/adminMemberDelete.do", new AdminMemberDeleteControl());
		map.put("/ajaxMemberSearchList.do", new AjaxMemberSearchList());
		map.put("/adminMoviePage.do", new AdminMoviePageControl());
		map.put("/adminMovieAdd.do", new AdminMovieAddControl());
		map.put("/adminMovieAddControl.do", new AdminMoviePlusControl());
		map.put("/adminMovieForm.do", new AdminMovieFormControl());
	    map.put("/adminMovieModify.do", new AdminMovieModifyControl());
		map.put("/adminMovieDelete.do", new AdminMovieDeleteControl());
		map.put("/adminReplyDelte.do", new AdminReplyDeleteControl());
		map.put("/adminboardList.do", new AdminBoardListControl());
		map.put("/adminboardDetail.do", new AdminBoardDetailControl());
		map.put("/adminBoardDelete.do", new AdminBoardDeleteControl());
		
		//영화
		map.put("/movieListPage.do", new MovieListPageControl());
		map.put("/movieDetailPage.do", new MovieDetailPageControl());
		map.put("/moviePick.do", new MoviePickControl());
		
		//리뷰
		map.put("/showReview.do", new ShowReviewControl());
		map.put("/addReview.do", new AddReviewControl());
		map.put("/removeReview.do", new RemoveReviewControl());
		map.put("/modifyReview.do", new ModifyReviewControl());
		
		//사용자
		map.put("/userMain.do", new UserMain());
		map.put("/userInfo.do", new UserInfo());
		map.put("/userModify.do", new UserModify());
		map.put("/imageUpload.do", new ImageUpload());
		map.put("/userModifyForm.do", new UserModifyForm());
		map.put("/userGood.do", new UserGoodList());
		//좋아요
		map.put("/userPick.do", new UserPickList());
		//이미지 업로드
		map.put("/imageUpload.do", new ImageUpload());
	}
		
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("utf-8");
				String uri = request.getRequestURI();
				String contextPath = request.getContextPath();
				String page = uri.substring(contextPath.length());
				
				Command command = map.get(page);//~~.do를 보내면 뒤에값이 동작
				String viewPage = command.exec(request, response);
				
				if(!viewPage.endsWith(".do")) {//
					
					if(viewPage.startsWith("Ajax")) {//ajax=호출한페이지에서결과를받는것
						//Ajax처리
						response.setContentType("text/html; charset=UTF-8");
						response.getWriter().append(viewPage.substring(5));
						return;
					}
					viewPage += ".tiles";
				
					RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
					dispatcher.forward(request, response);
				}else {
					response.sendRedirect(viewPage);
				}
	}

}
