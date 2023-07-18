package co.dotory.member.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.dotory.common.Command;
import co.dotory.member.service.MemberService;
import co.dotory.member.service.MemberVO;
import co.dotory.member.serviceImpl.MemberServiceImpl;

public class ImageUpload implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String savePath = req.getServletContext().getRealPath("/images");
		String enc = "UTF-8";
		int maxSize = 1024 * 1024 * 15;
		String result = "Ajax:";
		try {
			MemberService service = new MemberServiceImpl();
			MultipartRequest multi = new MultipartRequest(req, savePath, maxSize, enc, new DefaultFileRenamePolicy());
			String id= multi.getParameter("id");
			String fileName = multi.getFilesystemName("image");
			MemberVO vo = new MemberVO();
			vo.setMemberId(id);
			vo.setMemberImg(fileName);
			if(service.modifyImage(vo)) {
				//{"retCode": "Success", "path": "fileName"}
				result += fileName;
			} else {
				result += "0";
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

}
