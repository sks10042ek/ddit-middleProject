package kr.or.ddit.middle.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.middle.service.board.AttendenceServiceImpl;
import kr.or.ddit.middle.vo.Cp_HavingVO;

@WebServlet("/couponInsert.do")
public class CouponInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("LoginId");
		
		AttendenceServiceImpl service = AttendenceServiceImpl.getInstance();
		
		Cp_HavingVO vo = new Cp_HavingVO();
		
		vo.setCo_code("CO004");
		vo.setMem_id(id);
		vo.setCh_use(1);
		
		service.couponInsert(vo);

		response.sendRedirect(request.getContextPath()+"/Contents/eventPage.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
