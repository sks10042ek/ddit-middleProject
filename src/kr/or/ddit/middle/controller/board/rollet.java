package kr.or.ddit.middle.controller.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.middle.service.board.BoardServiceImpl;
import kr.or.ddit.middle.service.board.IBoardService;

/**
 * Servlet implementation class rollet
 */
@WebServlet("/rollet/*")
public class rollet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IBoardService service = BoardServiceImpl.getInstance();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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


		if (command.equals("/rollet/rollet.do")) {
			rCouponCheck(request);
		}

		request.getRequestDispatcher("/Contents/rollet.jsp").forward(request, response);

	}
	
	private void rCouponCheck(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("LoginId");
		int cnt = service.rCouponCheck(id);
		
		System.out.println(cnt);
		
		request.setAttribute("coCount", cnt);
		
	}


}
