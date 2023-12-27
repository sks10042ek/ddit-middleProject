package kr.or.ddit.middle.controller.member;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/imageView.do")
public class ImageView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		//파라미터로 넘어온 파일 번호를 구한다.
		String filename = (String)session.getAttribute("LoginId");
		//이미지가 저장된 폴더 설정
		String filePath = "C:/profile";
		
		//폴더안에있는 저장된 이름으로 가져오기
		File file = new File(filePath+ File.separator+filename + ".jpg");
		
		BufferedInputStream bin =null;
		BufferedOutputStream bout = null;
		
		//해당 파일이 있으면..
		if(file.exists()) {
			try {
				
				//파일 입력용 스트림객체 생성
				bin = new BufferedInputStream(new FileInputStream(file));
				
				//출력용 스트림객체 생성
				bout = new BufferedOutputStream(response.getOutputStream());
				
				byte[] temp = new byte[1024];
				int len =0;
				while((len = bin.read(temp))>0) {
					bout.write(temp,0,len);
				}
				bout.flush();
				
			} catch (Exception e) {
				System.out.println("입출력오류 : "+e.getMessage());
			} finally {
				if(bin!=null)try {bin.close();}catch(IOException e) {}
				if(bout!=null)try {bout.close();}catch(IOException e) {}
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
