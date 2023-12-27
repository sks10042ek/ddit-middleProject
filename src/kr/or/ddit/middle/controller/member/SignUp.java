package kr.or.ddit.middle.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.middle.service.member.MemberServiceImpl;
import kr.or.ddit.middle.vo.MemberVO;

@WebServlet("/signUp.do")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  request.setCharacterEncoding("utf-8");
		  
		  String id = request.getParameter("id");
			
		  MemberServiceImpl service = MemberServiceImpl.getInstance();
			
		  int cnt = service.checkDuple(id);
		  
		  System.out.println(cnt);
		  request.setAttribute("checkResult", cnt);
	    
		  request.getRequestDispatcher("/Contents/resultInput.jsp").forward(request, response);
		 
		
	  }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		request.setCharacterEncoding("utf-8");

		String id     = request.getParameter("id");
		String pass   = request.getParameter("pass");
		String name   = request.getParameter("name");
		String email  = request.getParameter("email");
		String tel    = request.getParameter("tel");
		String birth  = request.getParameter("birth");
		String gender = request.getParameter("gender");
		System.out.println(id+pass);
		
		MemberVO vo = new MemberVO();
		vo.setMem_id(id);
		vo.setMem_pass(pass);
		vo.setMem_name(name);
		vo.setMem_tel(tel);
		vo.setMem_email(email);
		vo.setMem_birth(birth);
		vo.setMem_gender(gender);
		
		MemberServiceImpl service = MemberServiceImpl.getInstance();
		int cnt = service.joinMember(vo);
		if(cnt>0) {
			out.print("<script>");
			out.print("alert('회원가입 성공!!');");
			out.print("window.location.href = '" + request.getContextPath() + "/Contents/index.jsp';");
			out.print("</script>");
//			response.sendRedirect(request.getContextPath()+"/Contents/index.jsp");
		}else {
			out.print("<script>");
			out.print("alert('회원가입에 실패하였습니다..')");
			out.print("window.location.href = '" + request.getContextPath() + "/Contents/index.jsp';");
			out.print("</script>");
		}
		out.flush();
	}
	
	

		

}
