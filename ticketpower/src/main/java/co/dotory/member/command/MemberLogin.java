package co.dotory.member.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dotory.common.Command;
import co.dotory.member.service.MemberService;
import co.dotory.member.service.MemberVO;
import co.dotory.member.serviceImpl.MemberServiceImpl;

public class MemberLogin implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		MemberService memberService = new MemberServiceImpl();
		MemberVO memberVO = new MemberVO();
		
		HttpSession session = req.getSession();
		
		String id = req.getParameter("memberId");
		String pw = req.getParameter("memberPw");
		
		memberVO=memberService.memberLogin(id, pw);
		
		
		if (memberVO != null) {
			session.setAttribute("id", memberVO.getMemberId());
			session.setAttribute("pw", memberVO.getMemberPw());
			session.setAttribute("name", memberVO.getMemberName());
			session.setAttribute("edate", memberVO.getMemberDdate());
			session.setAttribute("author", memberVO.getMemberAuthor());
			System.out.println(memberVO.getMemberId());
			if (memberVO.getMemberAuthor().equals("ADMIN")) {
				return "adminMainPage.do";
			}
			else if (memberVO.getMemberAuthor().equals("USER")) {
				return "movieListPage.do";
			}
		}else{
			res.setCharacterEncoding("EUC-KR");
			PrintWriter writer;
			try {
				writer = res.getWriter();
				writer.println("<script type = 'text/javascript'>");
				writer.println("alert('아이디 비밀번호를 확인해주세요')");
				writer.println("<'/script'>");
				return "memberLoginForm.do";
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		return null;
	}

}