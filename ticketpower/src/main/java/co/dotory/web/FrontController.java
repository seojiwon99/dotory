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

import co.dotory.board.command.BoardAdd;
import co.dotory.board.command.BoardDetail;
import co.dotory.board.command.BoardForm;
import co.dotory.board.command.BoardList;

import co.dotory.common.Command;
import co.dotory.member.command.AjaxMemberSearchList;
import co.dotory.member.command.MemberIdcheck;
import co.dotory.member.command.MemberLogin;
import co.dotory.member.command.MemberLoginForm;
import co.dotory.member.command.MemberLogout;
import co.dotory.member.command.MemberRegist;
import co.dotory.member.command.MemberSearch;
import co.dotory.member.command.adminMainControl;
import co.dotory.member.command.adminMemberDeleteControl;
import co.dotory.member.command.adminMemberForm;
import co.dotory.member.command.adminMemberModifyControl;
import co.dotory.member.command.adminMemberPageControl;
import co.dotory.movie.command.adminMoviePageControl;



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
		map.put("/memberRegist.do", new MemberRegist());
		map.put("/memberIdcheck.do", new MemberIdcheck());
		map.put("/memberSearch.do", new MemberSearch());
		
		
		// board(jiwon)
		map.put("/boardList.do", new BoardList()); // 게시판 목록화면
		
		map.put("/boardForm.do", new BoardForm()); // 게시판 등록화면
		
		map.put("/boardAdd.do", new BoardAdd()); // 게시판 등록 로직

		map.put("/boardDetail.do", new BoardDetail());
		
		//관리자 (호현)
		map.put("/adminMainPage.do", new adminMainControl());
		map.put("/adminMemberPage.do", new adminMemberPageControl());	
		map.put("/adminMemberForm.do", new adminMemberForm());
		map.put("/adminMemberModify.do", new adminMemberModifyControl());
		map.put("/adminMemberDelete.do", new adminMemberDeleteControl());
		map.put("/ajaxMemberSearchList.do", new AjaxMemberSearchList());
		map.put("/adminMoviePage.do", new adminMoviePageControl());
		
		


	}

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("utf-8");
				String uri = request.getRequestURI();
				String contextPath = request.getContextPath();
				String page = uri.substring(contextPath.length());
				
				Command command = map.get(page);//~~.do를 보내면 뒤에값이 동작
				String viewPage = command.exec(request, response);
				
				if(!viewPage.endsWith(".do")) {//
					
					if(viewPage.startsWith("Ajax:")) {//ajax=호출한페이지에서결과를받는것
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
