package co.dotory.member.command;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dotory.common.Command;
import co.dotory.member.service.MemberVO;

public class UserModifyForm implements Command{
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		String id = req.getParameter("memberId");
		String name = req.getParameter("memberName");
		String tel = req.getParameter("memberTel");
		String addr = req.getParameter("memberAddr");
		String img = req.getParameter("memberImg");
		String eDate =req.getParameter("memberEdate");
		MemberVO vo = new MemberVO();
		vo.setMemberId(id);
		vo.setMemberName(name);
		vo.setMemberTel(tel);
		vo.setMemberAddr(addr);
		vo.setMemberImg(img);
		req.setAttribute("search",vo);
		req.setAttribute("eDate", eDate);
	
		
		return "user/userModify";
	}

}