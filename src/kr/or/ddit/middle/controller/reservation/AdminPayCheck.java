package kr.or.ddit.middle.controller.reservation;

import java.io.IOException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.middle.service.reservation.IReservationService;
import kr.or.ddit.middle.service.reservation.ReservationServiceImpl;

import kr.or.ddit.middle.vo.PaymentVO;

@WebServlet("/adminPay/*")
public class AdminPayCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IReservationService service = ReservationServiceImpl.getInstance();
       
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
			
			if (command.equals("/adminPay/adminPayList.do")) { // 공지사항목록
				adminPayList(request);
				adminSalseList(request);
				request.getRequestDispatcher(request.getContextPath() +"/Contents/AdminSalesMgmt.jsp").forward(request, response);
			
			}

	}
	
	private void adminPayList(HttpServletRequest request) {
		List<PaymentVO> list = service.adminPayCheck();
		request.setAttribute("adList", list);
	}
	
	private void adminSalseList(HttpServletRequest request) {
		List<PaymentVO> salesList = service.adminSalesCheck();
		request.setAttribute("sales", salesList);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
