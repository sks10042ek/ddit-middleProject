package kr.or.ddit.middle.controller.member;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import kr.or.ddit.middle.service.member.IMemberService;
import kr.or.ddit.middle.service.member.MemberServiceImpl;
import kr.or.ddit.middle.vo.MemberVO;
import kr.or.ddit.middle.vo.PhotoVO;


@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 10, //10메가
		maxFileSize = 1024 * 1024 * 30, //30메가
		maxRequestSize = 1024 * 1024 * 100 //100메가
		)
@WebServlet("/myInfo/*")
public class MyInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IMemberService service = MemberServiceImpl.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 요청 URI를 얻어온다.
		String requestUri = request.getRequestURI();
		// contextPath를 얻어온다.
		// contextPath 요청시 Root를 뜻한다.
		String contextPath = request.getContextPath();
		// contextPath를 제와한 나머지 URL을 command라고 지칭한다.
		String command = requestUri.substring(contextPath.length());

		request.setCharacterEncoding("UTF-8"); // 인코딩 설정



		if (command.equals("/myInfo/view.do")) {
			infoView(request);
		}

		request.getRequestDispatcher("/Contents/myinfo.jsp").forward(request, response);

	}

	private void infoView(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("LoginId");
		MemberVO memVO = service.memberInfo(id);
		request.setAttribute("memVO", memVO);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 요청 URI를 얻어온다.
		String requestUri = request.getRequestURI();
		// contextPath를 얻어온다.
		// contextPath 요청시 Root를 뜻한다.
		String contextPath = request.getContextPath();
		// contextPath를 제와한 나머지 URL을 command라고 지칭한다.
		String command = requestUri.substring(contextPath.length());

		System.out.println(requestUri); // /BoardWebProject/board/list.do
		System.out.println(contextPath); // /BoardWebProject
		System.out.println(command); // /board/list.do

		request.setCharacterEncoding("UTF-8"); // 인코딩 설정

		if (command.equals("/myInfo/updateInfo.do")) {
			int cnt = updateInfo(request);

			if (cnt > 0) { // 수정성공
				response.sendRedirect(contextPath + "/myInfo/view.do");
			} else {
				request.getRequestDispatcher("/Contents/myinfo.jsp").forward(request, response);
			}

		}else if(command.equals("/myInfo/updateInfoPass.do")) {
			int cnt = updateInfoPass(request);
			
			if (cnt > 0) { // 수정성공
				response.sendRedirect(contextPath + "/myInfo/view.do");
			} else {
				
				request.getRequestDispatcher("/Contents/myinfo.jsp").forward(request, response);
			}
		}else if(command.equals("/myInfo/profileInfo.do")) {
			 // 파일을 받아오기 위한 코드
	        Part filePart = request.getPart("profile"); // "file"은 formData.append("file", file)에서 사용한 파라미터 이름
	        String fileName = getFileName(filePart);

	        InputStream fileContent = filePart.getInputStream();
	        HttpSession session = request.getSession();
	        String id = (String)session.getAttribute("LoginId");
	        //업로드된 파일들이 저장될 폴더 설정
			String uploadPath = "C:\\profile";
			
			
			fileName = id;
			//저장될 폴더가 없으면 새로 만들어 놓는다.
			File f = new File(uploadPath);
			
			if(!f.exists()) {
				f.mkdirs();
			}
			
			if(!"".equals(fileName)) { //파일인지 검사
				//1개의 Upload파일 정보가 저장될 FileInfoVO객체 생성
				PhotoVO fileVo = new PhotoVO();
				
				//파일 이름은 id값
				fileVo.setPt_file(id);
				fileVo.setPt_type("프로필");
				
				try {
					// 파일을 저장한다. => Part객체의 write() 메서드 이용한다.
					// 형식) Part객체.write("저장될 경로/저장될 파일명")
					filePart.write(uploadPath + File.separator+fileVo.getPt_file()+".jpg"); //파일 저장
					request.setAttribute("result", "ok");
					request.getRequestDispatcher("/Contents/memberProfileCheck.jsp").forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
			}//if문끝
	        
		}
	}
	//업로드한 파일의 이름을 잘라온다.
	private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
            	System.out.println(token);
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
	
	private int updateInfo(HttpServletRequest request) {
		HttpSession session = request.getSession();

		String id = (String) session.getAttribute("LoginId");
		String photo = id;
		String birth = request.getParameter("mem_birth");
		String email = request.getParameter("mem_email");
		String tel = request.getParameter("mem_tel");

		MemberVO memVO = new MemberVO();
		memVO.setMem_id(id);
		memVO.setMem_birth(birth);
		memVO.setMem_email(email);
		memVO.setMem_tel(tel);
		memVO.setMem_photo(photo);
		
		return service.memberInfoUpdate(memVO);
	}
	
	private int updateInfoPass(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id=(String) session.getAttribute("LoginId");
		
		String pass=request.getParameter("new_pass");
		
		MemberVO memVO = new MemberVO();
		memVO.setMem_id(id);
		memVO.setMem_pass(pass);
		
		return service.memberPassUpdate(memVO);
	}

}
