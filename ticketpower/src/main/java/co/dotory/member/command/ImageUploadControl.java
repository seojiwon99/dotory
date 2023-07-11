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

public class ImageUploadControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String savePath = req.getServletContext().getRealPath("/images");
		String enc = "UTF-8";
		int maxSize = 1024 * 1024 * 15;
		String json = "";
		try {
			MultipartRequest multi = new MultipartRequest(req, savePath, maxSize, enc, new DefaultFileRenamePolicy());
			String id= multi.getParameter("id");
			String fileName = multi.getFilesystemName("image");
			
			MemberVO vo = new MemberVO();
			vo.setMemberId(id);
			vo.setMemberImg(fileName);
			
			MemberService service = new MemberServiceImpl();
			
			if(service.modifyImage(vo)) {
				//{"retCode": "Success", "path": "fileName"}
				json = "{\"retCode\": \"Success\", \"path\": \""+ fileName +" \"}";
			} else {
				json = "{\"retCode\": \"Fail\"}";
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return json + ".json";
	}

}
