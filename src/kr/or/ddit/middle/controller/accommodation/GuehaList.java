package kr.or.ddit.middle.controller.accommodation;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.middle.service.accommodation.AccommodationServiceImpl;
import kr.or.ddit.middle.service.accommodation.IAccommodationService;
import kr.or.ddit.middle.vo.Search_AccomVO;

@WebServlet("/guehaList.do")
public class GuehaList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		// 요청 URI를 얻어온다.
		String requestUri = request.getRequestURI();
		
		// contextPath를 얻어온다.
		// contextPath 요청시 Root를 뜻한다.
		String contextPath = request.getContextPath();
		
		// contextPath를 제와한 나머지 URL을 command라고 지칭한다.
		String command = requestUri.substring(contextPath.length());
		
		
		//String goPage = "/Contents/RoomList.jsp"; //이동할 페이지
		
		String type = (String)request.getParameter("param");
		
		if(type.equals("gueha")) {
		 type = "게하";
		}
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("LoginId");
		
		IAccommodationService service = AccommodationServiceImpl.getInstance();
		Search_AccomVO sa = new Search_AccomVO();
		sa.setA_type(type);
		sa.setMem_id(id);

		List<Search_AccomVO> list = null;
		
		if(id==null) {
		
		list= service.acCheck(type);
		
		}else {
			
		list= service.accomListCheck(sa);
		}
		
		
		request.setAttribute("guestList", list);
		request.getRequestDispatcher(request.getContextPath()+"/Contents/RoomList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
