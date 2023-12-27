package kr.or.ddit.middle.controller.reservation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.middle.service.accommodation.AccommodationServiceImpl;
import kr.or.ddit.middle.service.accommodation.IAccommodationService;
import kr.or.ddit.middle.service.reservation.IReservationService;
import kr.or.ddit.middle.service.reservation.ReservationServiceImpl;
import kr.or.ddit.middle.vo.Info_ReservVO;

@WebServlet("/reservation/*")
public class ReservationCancle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String id;
	private String code;
	private String pay_no;
	Info_ReservVO vo = new  Info_ReservVO();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		request.setCharacterEncoding("utf-8");
		// 요청 URI를 얻어온다.
		String requestUri = request.getRequestURI();
		// contextPath를 얻어온다.
		// contextPath 요청시 Root를 뜻한다.
		String contextPath = request.getContextPath();
		// contextPath를 제와한 나머지 URL을 command라고 지칭한다.
		String command = requestUri.substring(contextPath.length());
		
		if(command.equals("/reservation/reservationCheck.do")){
			reservCheck(request);
			request.getRequestDispatcher(request.getContextPath()+"/Contents/reservationDetail.jsp").forward(request, response);
		}else if(command.equals("/reservation/reservationCancel.do")) {
			int cnt = reservCancle(request);
			if(cnt>0) {
				out.print("<script>");
				out.print("alert('예약이 취소되었습니다.');");
				out.print("window.location.href = '" + request.getContextPath() + "/reservationInfoCheck.do';");
				out.print("</script>");
			}
		}
	
	}
	
		
		//예약취소
		private int reservCancle(HttpServletRequest request) {
			
			int cnt =0;
			
			IReservationService service = ReservationServiceImpl.getInstance();
			code = request.getParameter("res_code");
			cnt = service.resStatusUpdate(code);
			if(cnt>0) {
				
			}	
			return cnt;
		}

		//예약 상세조회
		private void reservCheck(HttpServletRequest request) {
		
			HttpSession session = request.getSession();
			
			id = (String)session.getAttribute("LoginId");
			code = request.getParameter("res_code");
			
			IAccommodationService service = AccommodationServiceImpl.getInstance();
			
			//데이터 넘길 id와 res_code 값 jsp모달에서 받아와서 vo에 셋팅
			vo.setMem_id(id);
			vo.setRes_code(code);
			
			Info_ReservVO resvo = service.resDetailCheck(vo);
			
			request.setAttribute("resVo", resvo);
			
		}
}
