package kr.or.ddit.middle.controller.member;

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
import kr.or.ddit.middle.vo.MileageVO;

@WebServlet("/mil/*")
public class MileageCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IMypageService service = MyPageServiceImpl.getInstance();
	
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

		String goPage = ""; // 이동할 페이지

		if (command.equals("/mil/list.do")) {
			milList(request);
			milTotal(request);
		}else if(command.equals("/mil/milInsert.do")) {
			milInsert(request);
		}

		request.getRequestDispatcher("/Contents/mileage.jsp").forward(request, response);

		
	}
		
	private void milList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("LoginId");
		
		List<MileageVO> list = service.mileageInfo(id);
		request.setAttribute("milList", list);

	}
	
	private void milTotal(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("LoginId");
		
		String total=service.mileageTotal(id);
		request.setAttribute("milTotal", total);
		System.out.println(total);
	}
	
	private void  milInsert(HttpServletRequest request) {
		
	}

}
