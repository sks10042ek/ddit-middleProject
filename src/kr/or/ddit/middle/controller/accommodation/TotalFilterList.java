package kr.or.ddit.middle.controller.accommodation;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.or.ddit.middle.service.accommodation.AccommodationServiceImpl;
import kr.or.ddit.middle.service.accommodation.IAccommodationService;
import kr.or.ddit.middle.vo.Search_AccomVO;

@WebServlet("/total/*")
public class TotalFilterList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 요청 URI를 얻어온다.
		String requestUri = request.getRequestURI();
				// contextPath를 얻어온다.
				// contextPath 요청시 Root를 뜻한다.
		String contextPath = request.getContextPath();
				// contextPath를 제와한 나머지 URL을 command라고 지칭한다.
		String command = requestUri.substring(contextPath.length());
				
		request.setCharacterEncoding("UTF-8"); // 인코딩 설정
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		
		if (command.equals("/total/totalFilterList.do")) { // 공지사항목록
			totalFilterList(request);
			request.getRequestDispatcher("/Contents/AccomSearchList.jsp").forward(request, response);
		}else if(command.equals("/total/totalFilterSortList.do")) {
			String jData = totalFilterSortList(request);

			PrintWriter out = response.getWriter();
			out.write(jData);
			response.flushBuffer();
			
		}	

	}

	private String totalFilterSortList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("LoginId");
		String tCheckIn ="";
		String tCheckOut="";
		try {
			tCheckIn = URLDecoder.decode(request.getParameter("tCheckIn"), "UTF-8");
			tCheckOut = URLDecoder.decode(request.getParameter("tCheckOut"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        String tArea = request.getParameter("tArea");
        int tRoomCount =Integer.parseInt(request.getParameter("tRoomCount"));
        int tAdultCount = Integer.parseInt(request.getParameter("tAdultCount"));
        int tChildCount = Integer.parseInt(request.getParameter("tChildCount"));
		
		
		IAccommodationService service = AccommodationServiceImpl.getInstance();		
		
		Search_AccomVO vo = new Search_AccomVO(); 
		
		
		vo.setMem_id(id);
		vo.setR_max(tAdultCount);		
		vo.setA_addr(tArea);
		
		
		List<Search_AccomVO> list = null;
		if(id == null) {
			list = service.totalAcCheck(vo);
		}else if(id != null){
			list = service.totalUserListCheck(vo);
		}
		Gson gson = new Gson();
		// json 결과값 받을 변수
		String jsonData = null;

		// list를 json타입으로 만드는 과정
		jsonData=gson.toJson(list);
		
		
		return jsonData;
		
		
	}

	private void totalFilterList(HttpServletRequest request) {
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("LoginId");
			//인코딩 한것 받아와서 디코딩해줌
			String encodedCheckInDate = request.getParameter("checkInDate");
			String encodedCheckOutDate = request.getParameter("checkOutDate");
		
		
			String area = request.getParameter("area");
	        int adultCount = Integer.parseInt(request.getParameter("adultCount"));
	        int childCount = Integer.parseInt(request.getParameter("childCount"));
	       
	        
	        Search_AccomVO vo = new Search_AccomVO(); 
			
			vo.setMem_id(id);
			vo.setR_max(adultCount);
			vo.setA_addr(area);

	        // URL 디코딩
	        try {
				String checkInDate = URLDecoder.decode(encodedCheckInDate, "UTF-8");
				String checkOutDate = URLDecoder.decode(encodedCheckOutDate, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        
	    	IAccommodationService service = AccommodationServiceImpl.getInstance();
			
			
			List<Search_AccomVO> list = null;
			if(id == null) {
				list = service.totalAcCheck(vo);
			}else if(id != null){
				list = service.totalUserListCheck(vo);
			}
			
			request.setAttribute("Alist", list);
	        
		
	}


	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}

