package kr.or.ddit.middle.controller.reservation;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.or.ddit.middle.service.member.MyPageServiceImpl;
import kr.or.ddit.middle.vo.Info_ReservVO;

@WebServlet("/reservationInfoCheck.do")
public class ReservationInfoCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		MyPageServiceImpl service = MyPageServiceImpl.getInstance();
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("LoginId");
		
		List<Info_ReservVO> list = service.resInfoCheck(id);
		
		request.setAttribute("ResList", list);
		
		request.getRequestDispatcher(request.getContextPath()+"/Contents/reservationlist.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
