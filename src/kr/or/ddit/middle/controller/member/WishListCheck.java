package kr.or.ddit.middle.controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.SendResult;

import kr.or.ddit.middle.service.member.IMypageService;
import kr.or.ddit.middle.service.member.MyPageServiceImpl;
import kr.or.ddit.middle.vo.View_BoardVO;
import kr.or.ddit.middle.vo.View_PhotoVO;


@WebServlet("/wish/*")
public class WishListCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IMypageService service = MyPageServiceImpl.getInstance();

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
		
		if (command.equals("/wish/wishList.do")) {
			wishListCheck(request);
			request.getRequestDispatcher(request.getContextPath() +"/Contents/wishList.jsp").forward(request, response);
		
		}
	
	}
	
	private void wishListCheck(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("LoginId");
		List<View_PhotoVO> list = service.wishListCheck(id);
		request.setAttribute("wishList", list);

	}

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
