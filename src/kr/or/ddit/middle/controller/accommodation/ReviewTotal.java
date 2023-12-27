package kr.or.ddit.middle.controller.accommodation;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import kr.or.ddit.middle.service.accommodation.AccommodationServiceImpl;
import kr.or.ddit.middle.service.accommodation.IAccommodationService;
import kr.or.ddit.middle.service.accommodation.IReviewService;
import kr.or.ddit.middle.service.accommodation.ReviewServiceImpl;
import kr.or.ddit.middle.service.reservation.IReservationService;
import kr.or.ddit.middle.service.reservation.ReservationServiceImpl;
import kr.or.ddit.middle.vo.MileageVO;
import kr.or.ddit.middle.vo.PhotoVO;
import kr.or.ddit.middle.vo.ReviewVO;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10, // 10MB
                 maxRequestSize = 1024 * 1024 * 50) // 50MB
@WebServlet("/reviewTotal/*")
public class ReviewTotal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
			
		// 요청 URI를 얻어온다.
		String requestUri = request.getRequestURI();
		// contextPath를 얻어온다.
		// contextPath 요청시 Root를 뜻한다.
		String contextPath = request.getContextPath();
		// contextPath를 제와한 나머지 URL을 command라고 지칭한다.
		String command = requestUri.substring(contextPath.length());
		System.out.println(command);
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		
		if (command.equals("/reviewTotal/insertMileage.do")) {
			 int cnt = milInsert(request);
			
		     PrintWriter out = response.getWriter();
	         out.print("{\"result\": " + cnt + "}");
	         out.flush();
		}
	}

	private int milInsert(HttpServletRequest request) {
		
		IReservationService service = ReservationServiceImpl.getInstance();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("LoginId");
		
		MileageVO mVO = new MileageVO();
		
		mVO.setMem_id(id);
		mVO.setMil_his("리뷰 작성");
		mVO.setMil_amt(1000);
		
		return service.milInsert(mVO);
		
		
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
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json");

		if (command.equals("/reviewTotal/reviewInsert.do")) {
			int cnt = revInsert(request);
			
		     
			
		     PrintWriter out = response.getWriter();
	         out.print("{\"result\": " + cnt + "}");
	         out.flush();
			
		}else if(command.equals("/reviewTotal/reviewPhoto.do")) {
			 // 파일을 받아오기 위한 코드
	        Part filePart = request.getPart("reviewfile"); // "file"은 formData.append("file", file)에서 사용한 파라미터 이름
	        String fileName = getFileName(filePart);	        
	        
	        InputStream fileContent = filePart.getInputStream();
	        
	        String resCode = (String)request.getParameter("resCode");
	        
	        IAccommodationService service = AccommodationServiceImpl.getInstance();
	        
	        String revCode = service.revCodeCheck();
	        System.out.println("revCode : " + revCode );
	        
	        //업로드된 파일들이 저장될 폴더 설정
			String uploadPath = "C:\\review";
			
			
			//저장될 폴더가 없으면 새로 만들어 놓는다.
			File f = new File(uploadPath);
			
			if(!f.exists()) {
				f.mkdirs();
			}
			
			if(!"".equals(fileName)) { //파일인지 검사
				fileName = revCode;
				
				//1개의 Upload파일 정보가 저장될 FileInfoVO객체 생성
				PhotoVO fileVo = new PhotoVO();
				
				//파일 이름은 id값
				fileVo.setPt_file(fileName);
				fileVo.setPt_type("리뷰");
				
				try {
					// 파일을 저장한다. => Part객체의 write() 메서드 이용한다.
					// 형식) Part객체.write("저장될 경로/저장될 파일명")
					filePart.write(uploadPath + File.separator+fileVo.getPt_file()+".jpg"); //파일 저장
					request.setAttribute("result", "ok");
					request.getRequestDispatcher("/Contents/reviewFileCheck.jsp").forward(request, response);
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
	

	

	private int revInsert(HttpServletRequest request) {
		String resCode = (String)request.getParameter("resCode");
		String title =(String)request.getParameter("title");
		int score =Integer.parseInt(request.getParameter("score"));
		String content =(String)request.getParameter("reviewContent");
		
		ReviewVO vo = new ReviewVO();
		
		vo.setRes_code(resCode);
		vo.setRev_title(title);
		vo.setRev_score(score);
		vo.setRev_content(content);
		
		IReviewService service = ReviewServiceImpl.getInstance();
		
		
		
		return service.reviewInsert(vo);
		
		
		
	}

}
