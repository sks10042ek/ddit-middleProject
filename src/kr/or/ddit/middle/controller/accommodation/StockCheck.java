package kr.or.ddit.middle.controller.accommodation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.middle.service.accommodation.AccommodationServiceImpl;
import kr.or.ddit.middle.service.accommodation.IAccommodationService;

@WebServlet("/stockCheck.do")
public class StockCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		 String checkInDate = request.getParameter("checkInDate");
		 String checkOutDate = request.getParameter("checkOutDate");
		 String area = request.getParameter("area");
		 String roomCount = request.getParameter("roomCount");
		 String adultCount = request.getParameter("adultCount");
		 String childCount = request.getParameter("childCount");
		 
		 IAccommodationService service = AccommodationServiceImpl.getInstance();
		 
		 
	
	}

}
