package kr.or.ddit.middle.controller.accommodation;

import java.io.IOException;
//import java.net.URLDecoder;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import kr.or.ddit.middle.service.accommodation.AccommodationServiceImpl;
//import kr.or.ddit.middle.service.accommodation.IAccommodationService;
//import kr.or.ddit.middle.vo.Info_ReservVO;
//import kr.or.ddit.middle.vo.RoomVO;
//
//
//@WebServlet("/totalAccomList.do")
//public class TotalAccomList extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		HttpSession session = request.getSession();
//		String id = (String)session.getAttribute("LoginId");
//		//인코딩 한것 받아와서 디코딩해줌
//		String encodedCheckInDate = request.getParameter("checkInDate");
//		String encodedCheckOutDate = request.getParameter("checkOutDate");
//	
//	
//		String area = request.getParameter("location");
//        String roomCount = request.getParameter("roomCount");
//        int adultCount = Integer.parseInt(request.getParameter("adultCount"));
//        String childCount = request.getParameter("childCount");
//        
//
//        // URL 디코딩
//        String checkInDate = URLDecoder.decode(encodedCheckInDate, "UTF-8");
//        String checkOutDate = URLDecoder.decode(encodedCheckOutDate, "UTF-8");
//        
//      
//		
//		IAccommodationService service = AccommodationServiceImpl.getInstance();
//		
//		Info_ReservVO vo = new Info_ReservVO();
//		vo.setA_addr(area);
//		vo.setR_max(adultCount);
//		vo.setRes_cin(checkInDate);
//		vo.setRes_cout(checkOutDate);
//		vo.setMem_id(id);
//	
//	
//		//현재 객실재고 - 예약된 객실수를 저장할 변수값
//		int totalInven = 0;
//		
//		
//		//검색값을 받아와서 처리한 코드
//		List<Info_ReservVO> list = service.totalListCheck(vo); //검색값을 받아와서 리스트를 뿌려준다.
//		
//		//이건 하다가 시간없어서 그냥 넘어감 list만 뿌려주기로함
//		
//		//for문으로 리스트를 뽑아주는 가장 큰 for문 각각의 a_code를 가져와야한다.
//		for(Info_ReservVO resVo : list) {
//			//해당 acode에 대한 각각의 객실
//	List<RoomVO> rList = service.searchRoom(resVo.getA_code());
//			
//		for(RoomVO rVo : rList) {
//			
//				//현재 객실 재고
//				int rInven = resVo.getR_inven();
//	
//			//각각의 객실코드를 받아 예약의 갯수를 판별함
//				RoomVO rv = new RoomVO();
//				rv.setA_code(resVo.getA_code());
//				rv.setR_code(rVo.getR_code());
//				rv.setCin(checkInDate);
//				rv.setCout(checkOutDate);
//				
//				int cnt = service.invenCountRoomNType(rv);
//				
//				totalInven = rInven-cnt;
//				
//				
//			}
//			
//			
//			
//			
//		}
//		
//		
//		
//		request.setAttribute("totalList", list);
//		
//		request.getRequestDispatcher("/Contents/AccomSearchList.jsp").forward(request, response);;
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
//
//}
