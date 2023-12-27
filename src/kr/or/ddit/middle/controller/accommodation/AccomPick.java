package kr.or.ddit.middle.controller.accommodation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.middle.service.accommodation.AccommodationServiceImpl;
import kr.or.ddit.middle.service.accommodation.IAccommodationService;
import kr.or.ddit.middle.vo.Search_AccomVO;

@WebServlet("/accomPick.do")
public class AccomPick extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		response.setContentType("application/json; charset=utf-8");
		
		String type = (String)request.getParameter("param");
		if(type.equals("hotel")) {
			type="호텔";
		}
		
		
		IAccommodationService service = AccommodationServiceImpl.getInstance();
		
		List<Search_AccomVO> list = service.acCheck(type);
		
		System.out.println(list);
		//json변환객체 선언
		Gson gson = new Gson();
		//json 결과값 받을 변수
		String jsonData =null;
		
		
		//list를 json타입으로 만드는 과정
		jsonData = gson.toJson(list);
		
		//데이터 들어가나 확인용
		System.out.println("jsonData => "+jsonData);
		
		//이 세가지 요소를 통해서 success의 결과 변수에 값을 보냄
		PrintWriter out = response.getWriter();
		out.write(jsonData);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
