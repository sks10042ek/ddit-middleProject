package kr.or.ddit.middle.controller.reservation;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.middle.service.member.IMemberService;
import kr.or.ddit.middle.service.member.IMypageService;
import kr.or.ddit.middle.service.member.MemberServiceImpl;
import kr.or.ddit.middle.service.member.MyPageServiceImpl;
import kr.or.ddit.middle.service.reservation.IReservationService;
import kr.or.ddit.middle.service.reservation.ReservationServiceImpl;
import kr.or.ddit.middle.vo.AccommodationVO;
import kr.or.ddit.middle.vo.Cp_HavingVO;
import kr.or.ddit.middle.vo.Info_CouponVO;
import kr.or.ddit.middle.vo.Info_ReservVO;
import kr.or.ddit.middle.vo.MemberVO;
import kr.or.ddit.middle.vo.MileageVO;
import kr.or.ddit.middle.vo.PaymentVO;
import kr.or.ddit.middle.vo.ReservationVO;
import kr.or.ddit.middle.vo.RoomVO;

/**
 * Servlet implementation class Reservation
 */
@WebServlet("/reserv/*")
public class ReservationInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IReservationService service = ReservationServiceImpl.getInstance();
	private IMemberService mService = MemberServiceImpl.getInstance();
	private IMypageService myService = MyPageServiceImpl.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		String requestUri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestUri.substring(contextPath.length());

		if (command.equals("/reserv/reserv.do")) {
			viewReservInfo(request);
			request.getRequestDispatcher(request.getContextPath()+"/Contents/reservation.jsp").forward(request, response);
		}
		
	
	}
	
	private void viewReservInfo(HttpServletRequest request) {
		
		HttpSession session=request.getSession();
		String uid=(String) session.getAttribute("LoginId");
		String a_code =(String)request.getParameter("a_code");
		String r_code =(String)request.getParameter("r_code");
		String checkInDate =(String)request.getParameter("checkInDate");
		String checkOutDate =(String)request.getParameter("checkOutDate");
	
		MemberVO mVO = mService.memberInfo(uid);
		AccommodationVO aVO=service.accomInfo(a_code);
		RoomVO rVO = service.roomInfo(r_code);
		List<Info_CouponVO> cList = myService.couponCheck(uid);
		String total=myService.mileageTotal(uid);
		
		request.setAttribute("memInfo", mVO);
		request.setAttribute("accomInfo", aVO);
		request.setAttribute("roomInfo", rVO);
		request.setAttribute("couponInfo", cList);
		request.setAttribute("milTotal", total);
		
	}
	
	
	private void milTotal(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("LoginId");
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		String requestUri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestUri.substring(contextPath.length());

		if (command.equals("/reserv/reservResult.do")) {
		
			insertReservation(request);
			insertMile(request);
			memCpdelete(request);
//			insertPayment(request);
			
			response.sendRedirect(request.getContextPath()+"/reservationInfoCheck.do");
		}
	
	}
	
	private int insertReservation(HttpServletRequest request) {
		
		//reservation
		//-예약번호, r_code, id, 체크인, 체크아웃, 메모, 예약상태
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("LoginId");
		String rCode = request.getParameter("r_code");
		String cIn = request.getParameter("checkInDate");
		String cOut = request.getParameter("checkOutDate");
		String memo = request.getParameter("requestment");
		String status = "예약완료";
		
		ReservationVO rVO = new ReservationVO();
		rVO.setMem_id(id);
		rVO.setR_code(rCode);
		rVO.setRes_cin(cIn);
		rVO.setRes_cout(cOut);
		rVO.setRes_memo(memo);
		rVO.setRes_status(status);
		
		int resCnt = service.resInsert(rVO);
		
		
		//payinsert
		int price = Integer.parseInt(request.getParameter("price"));
		String method = request.getParameter("pg");
		String mil = request.getParameter("useMilElement");
		String cCode = request.getParameter("cCodeElement");
		String resCode= rVO.getRes_code();
		
		PaymentVO pVO = new PaymentVO();
		pVO.setRes_code(resCode);
		pVO.setPay_price(price);
		pVO.setPay_method(method);
		pVO.setMil_use(mil);
		pVO.setCou_use(cCode);
		
		int payCnt=service.payInsert(pVO);
		
		return resCnt+payCnt;
	}
	
//	private int insertPayment(HttpServletRequest request) {
//		
//		int price = Integer.parseInt(request.getParameter("price"));
//		String method = request.getParameter("pg");
//		String mil = request.getParameter("useMilElement");
//		String cCode = request.getParameter("cCodeElement");
//		
//		PaymentVO pVO = new PaymentVO();
//		pVO.setPay_price(price);
//		pVO.setPay_method(method);
//		pVO.setMil_use(mil);
//		pVO.setCou_use(cCode);
//		
//		return service.payInsert(pVO);
//	}
	
	private int insertMile(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String id= (String)session.getAttribute("LoginId");
		String his="사용";
		int amt=Integer.parseInt(request.getParameter("useMilElement"));
		
		MileageVO mVO = new MileageVO();
		
		mVO.setMem_id(id);
		mVO.setMil_his(his);
		mVO.setMil_amt(amt);
		
		return service.milInsert(mVO);
	}
	
	private int memCpdelete(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("LoginId");
		String co_code = (String)request.getParameter("cCodeElement");
		
		Cp_HavingVO cVO = new Cp_HavingVO();
		
		cVO.setMem_id(id);
		cVO.setCo_code(co_code);
		
		return service.memCpdelete(cVO);
	}
	

}
