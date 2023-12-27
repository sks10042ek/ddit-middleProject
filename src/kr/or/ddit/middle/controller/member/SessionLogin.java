package kr.or.ddit.middle.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.middle.service.member.MemberServiceImpl;
import kr.or.ddit.middle.vo.MemberVO;

@WebServlet("/sessionLogin.do")
public class SessionLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect(request.getContextPath()+"/Contents/index.jsp");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("userid");   //입력한값
		String pass = request.getParameter("userpass"); //입력한값
		String check = request.getParameter("check");
		
		System.out.println("check : "+check);
		
		MemberVO vo = new MemberVO();
		vo.setMem_id(id);
		vo.setMem_pass(pass);
		
		HttpSession session = request.getSession();
		Cookie cookie = new Cookie("cookieId",id);
		
		if(check !=null) {
			response.addCookie(cookie);
		}else {
			cookie.setMaxAge(0);
        	response.addCookie(cookie);
		}
		
		MemberServiceImpl service = MemberServiceImpl.getInstance();
		
		int cnt= service.checkInfo(vo);
		System.out.println(cnt);
		if(cnt>0) {
			session.setAttribute("LoginId", id);
			response.sendRedirect(request.getContextPath()+"/Contents/index.jsp");
		}else {
			response.sendRedirect(request.getContextPath()+"/Contents/login.jsp?param="+cnt);
		}
	}

}
