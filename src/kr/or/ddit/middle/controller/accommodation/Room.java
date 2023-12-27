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
import kr.or.ddit.middle.service.accommodation.IReviewService;
import kr.or.ddit.middle.service.accommodation.ReviewServiceImpl;
import kr.or.ddit.middle.vo.AccommodationVO;
import kr.or.ddit.middle.vo.RoomVO;
import kr.or.ddit.middle.vo.View_PhotoVO;
import kr.or.ddit.middle.vo.View_ReviewVO;

/**
 * Servlet implementation class RoomDetail
 */
@WebServlet("/room/*")
public class Room extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IAccommodationService service = AccommodationServiceImpl.getInstance();
	private IReviewService rService = ReviewServiceImpl.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String requestUri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestUri.substring(contextPath.length());

		if (command.equals("/room/detail.do")) {
			viewRoomDetail(request);
			viewReview(request);
			request.getRequestDispatcher("/Contents/RoomDetail.jsp").forward(request, response);
		}else if(command.equals("/room/transRoomDetail.do")) {
			viewRoomDetail(request);
			viewReview(request);
			request.getRequestDispatcher("/Contents/transferDetail.jsp").forward(request, response);
		}

		

	}

	private void viewRoomDetail(HttpServletRequest request) {
		
		String aCode = (String)request.getParameter("param");
		
		System.out.println(aCode);
		
	
		
		AccommodationVO aVO = service.accomDetail(aCode);
		List<RoomVO> rVO = service.roomDetail(aCode);
		List<View_PhotoVO> aPhotoList = service.accomPhotoCheck(aCode);

		request.setAttribute("accomDetail", aVO);
		request.setAttribute("roomDetail", rVO);
		request.setAttribute("accomPhotoL", aPhotoList);
		
	}
	
	private void viewReview(HttpServletRequest request) {
		//리뷰에 필요한거
		//점수, 타이틀, 내용, 날짜
		String aCode = (String)request.getParameter("param");
		
		List<View_ReviewVO> reviewList = rService.reviewCheck(aCode);
		
		request.setAttribute("reviewList", reviewList);
		
	}
	
	/*
	 * private viewTransRoom(HttpServletRequest request) {
	 * 
	 * }
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
