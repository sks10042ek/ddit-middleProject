package kr.or.ddit.middle.controller.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.middle.service.reservation.IReservationService;
import kr.or.ddit.middle.service.reservation.ReservationServiceImpl;
import kr.or.ddit.middle.vo.MileageVO;

/**
 * Servlet implementation class game
 */
@WebServlet("/game.do")
public class Game extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		IReservationService service = ReservationServiceImpl.getInstance();
		
		String id = (String)session.getAttribute("LoginId");
		
		MileageVO mVO = new MileageVO();
		
		mVO.setMem_id(id);
		mVO.setMil_his("익룡 포인트");
		mVO.setMil_amt(1000);
		
		int cnt = service.milInsert(mVO);
		
		response.sendRedirect(request.getContextPath()+"/Contents/eventPage.jsp");
		
	}

}
