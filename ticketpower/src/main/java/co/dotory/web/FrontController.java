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
import co.dotory.board.command.BoardList;
import co.dotory.common.Command;



@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private Map<String,Command> map = new HashMap<>();
	    
    public FrontController() {
        super();
        
    }


	public void init(ServletConfig config) throws ServletException {
		map.put("/main.do", new MainCommand());
		
		map.put("/boardList.do", new BoardList()); // 게시판 목록화면
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
