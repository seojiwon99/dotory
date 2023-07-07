package co.dotory.member.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.dotory.common.Command;
import co.dotory.member.service.MemberService;
import co.dotory.member.service.MemberVO;
import co.dotory.member.serviceImpl.MemberServiceImpl;

public class MemberSearch implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse res) {
		MemberService memberService = new MemberServiceImpl();
		List<MemberVO> members = new ArrayList<>();
		ObjectMapper mapper = new ObjectMapper();
		
		String key = req.getParameter("key");
		String val = req.getParameter("val");
		members = memberService.memberList(key,val);
		
		String str = "Ajax:";
		try {
			str += mapper.writeValueAsString(members);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return str;
	}

}
