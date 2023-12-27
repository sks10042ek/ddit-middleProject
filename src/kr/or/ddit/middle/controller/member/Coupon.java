package kr.or.ddit.middle.controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.middle.service.member.MyPageServiceImpl;
import kr.or.ddit.middle.vo.Info_CouponVO;

@WebServlet("/coupon.do")
public class Coupon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		MyPageServiceImpl service = MyPageServiceImpl.getInstance();
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("LoginId");
		System.out.println(id);
		List<Info_CouponVO> list = service.couponTotalCheck(id);
		for(Info_CouponVO vo : list) {
			vo.getCp_use();
		}
		request.setAttribute("copList", list);
		
		request.getRequestDispatcher(request.getContextPath()+"/Contents/coupone.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
