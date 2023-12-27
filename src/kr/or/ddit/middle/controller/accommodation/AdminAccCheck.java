package kr.or.ddit.middle.controller.accommodation;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.middle.service.accommodation.AccommodationServiceImpl;
import kr.or.ddit.middle.service.accommodation.IAccommodationService;
import kr.or.ddit.middle.vo.AccommodationVO;

@WebServlet("/AdminAcc/*")
public class AdminAccCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IAccommodationService service = AccommodationServiceImpl.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
			// 요청 URI를 얻어온다.
			String requestUri = request.getRequestURI();
			// contextPath를 얻어온다.
			// contextPath 요청시 Root를 뜻한다.
			String contextPath = request.getContextPath();
			// contextPath를 제와한 나머지 URL을 command라고 지칭한다.
			String command = requestUri.substring(contextPath.length());
			
			request.setCharacterEncoding("utf-8");

			String goPage = ""; // 이동할 페이지
			
			if (command.equals("/AdminAcc/adminAccList.do")) { // 공지사항목록
				adminAccList(request);
				request.getRequestDispatcher(request.getContextPath() +"/Contents/AdminCmpnyMgmt.jsp").forward(request, response);
			
			}

	}

	private void adminAccList(HttpServletRequest request) {
		List<AccommodationVO> list = service.adminAccCheck();
		request.setAttribute("adList", list);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
