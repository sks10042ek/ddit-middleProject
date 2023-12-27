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
import kr.or.ddit.middle.vo.ReservationVO;
import kr.or.ddit.middle.vo.RoomVO;
import kr.or.ddit.middle.vo.Search_AccomVO;
import kr.or.ddit.middle.vo.WishListVO;					//왜 난되는건데?

@WebServlet("/accommFilter/*")
public class AccommFilter extends HttpServlet {
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

		String jsonData = null;

		

		if (command.equals("/accommFilter/dateLoad.do")) {
			jsonData = dateLoad(request);
		} else if (command.equals("/accommFilter/searchRoom.do")) {
			jsonData = searchRoom(request);
		} else if (command.equals("/accommFilter/invenCountRoom.do")) {
			jsonData = invenCountRoom(request);
		} else if (command.equals("/accommFilter/wishInsert.do")) {
			jsonData = wishInsert(request);
		} else if (command.equals("/accommFilter/wishDelete.do")) {
			jsonData = wishDelete(request);
		}

	

		PrintWriter out = response.getWriter();
		out.write(jsonData);
		response.flushBuffer();

	}

	private String wishDelete(HttpServletRequest request) {
	
		String acode = (String) request.getParameter("a_code");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("LoginId");

		WishListVO wv = new WishListVO();
		wv.setA_code(acode);
		wv.setMem_id(id);
		
		
		System.out.println(acode);
		System.out.println(id);

		IAccommodationService service = AccommodationServiceImpl.getInstance();
		int cnt = service.wishDelete(wv);

		// json변환객체 선언
		Gson gson = new Gson();
		// json 결과값 받을 변수
		String jsonData = null;

		// list를 json타입으로 만드는 과정
		jsonData = gson.toJson(cnt);
	
		return jsonData;
	}

	private String wishInsert(HttpServletRequest request) {
	
		String acode = (String) request.getParameter("a_code");
	
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("LoginId");

		WishListVO wv = new WishListVO();
		wv.setA_code(acode);
		wv.setMem_id(id);
		
		
		System.out.println(acode);
		System.out.println(id);

		IAccommodationService service = AccommodationServiceImpl.getInstance();
		int cnt = service.wishInsert(wv);

		// json변환객체 선언
		Gson gson = new Gson();
		// json 결과값 받을 변수
		String jsonData = null;

		// list를 json타입으로 만드는 과정
		jsonData = gson.toJson(cnt);
	
		return jsonData;
		
	}

	private String invenCountRoom(HttpServletRequest request) {
		System.out.println("메소드에 잘 ~ 도착했수다");
		String acode = (String) request.getParameter("acode");
		String rcode = (String) request.getParameter("rcode");
		String atype = (String) request.getParameter("atype");
		String cin = (String) request.getParameter("cin");
		String decoded_checkInDate = "";
		try {
			decoded_checkInDate = URLDecoder.decode(cin, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String cout = (String) request.getParameter("cout");
		String decoded_checkOutDate = "";
		try {
			decoded_checkOutDate = URLDecoder.decode(cout, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		IAccommodationService service = AccommodationServiceImpl.getInstance();

		RoomVO rv = new RoomVO();
		rv.setA_code(acode);
		rv.setR_code(rcode);
		rv.setA_type(atype);
		rv.setCin(decoded_checkInDate);
		rv.setCout(decoded_checkOutDate);

		int cnt = service.invenCountRoom(rv);

		// json변환객체 선언
		Gson gson = new Gson();
		// json 결과값 받을 변수
		String jsonData = null;

		// list를 json타입으로 만드는 과정
		jsonData = gson.toJson(cnt);
	
		return jsonData;
	}

	private String searchRoom(HttpServletRequest request) {
		String acode = (String) request.getParameter("acode");
		int rmax = Integer.parseInt(request.getParameter("rmax"));
		IAccommodationService service = AccommodationServiceImpl.getInstance();

		RoomVO rv = new RoomVO();

		rv.setA_code(acode);
		rv.setR_max(rmax);

		List<RoomVO> list = service.searchRoom(rv);

		// json변환객체 선언
		Gson gson = new Gson();
		// json 결과값 받을 변수
		String jsonData = null;

		// list를 json타입으로 만드는 과정
		jsonData = gson.toJson(list);
		return jsonData;

	}

	private String dateLoad(HttpServletRequest request) {
		String checkInDate = (String) request.getParameter("goCheckInDate");
		String decoded_checkInDate = "";
		try {
			decoded_checkInDate = URLDecoder.decode(checkInDate, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String checkOutDate = (String) request.getParameter("goCheckOutDate");
		String decoded_checkOutDate = "";
		try {
			decoded_checkOutDate = URLDecoder.decode(checkOutDate, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		IAccommodationService service = AccommodationServiceImpl.getInstance();

		ReservationVO rv = new ReservationVO();
		rv.setRes_cin(decoded_checkInDate);
		rv.setRes_cout(decoded_checkOutDate);

		List<ReservationVO> list = service.CheckInOutFilter(rv);

		// json변환객체 선언
		Gson gson = new Gson();
		// json 결과값 받을 변수
		String jsonData = null;

		// list를 json타입으로 만드는 과정
		jsonData = gson.toJson(list);
		return jsonData;

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
