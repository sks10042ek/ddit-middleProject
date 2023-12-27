package kr.or.ddit.middle.controller.member;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EmailController
 */
@WebServlet("/EmailController.do")
public class EmailController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 요청 URI를 얻어온다.
				String requestUri = request.getRequestURI();
				// contextPath를 얻어온다.
				// contextPath 요청시 Root를 뜻한다.
				String contextPath = request.getContextPath();
				// contextPath를 제와한 나머지 URL을 command라고 지칭한다.
				String command = requestUri.substring(contextPath.length());

				request.setCharacterEncoding("UTF-8"); // 인코딩 설정
				response.setCharacterEncoding("UTF-8"); // 인코딩 설정
		
		
		String memberId = request.getParameter("memberId");
		
		

		// 먼저 아이디로 회원정보를 받아오고 가져온 데이터에서 email값을 비교하여 존재하지 않으면 인증메일 보내지 못함
		/*
		 * Member m = new MemberService().memberLogin(memberId); if(m==null ||
		 * !m.getEmail().equals(email)) { req.setAttribute("msg",
		 * "아이디나 이메일 정보가 맞지 않습니다"); req.setAttribute("loc", "/member/searchPw");
		 * req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp); return;
		 * }
		 */
		// mail server 설정
		String host = "smtp.naver.com";
		String user = "alsl1597@naver.com"; // 자신의 네이버 계정
		String password = "alcl159753!";// 자신의 네이버 패스워드

		// 메일 받을 주소
		/* String to_email = m.getEmail(); */
		String to_email = request.getParameter("email"); 
		/*
		 * (String) request.getAttribute("email");
		 */

		// SMTP 서버 정보를 설정한다.
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.debug", "true");

		
	
		String num="12345";
		String AuthenticationKey = num.toString();
		System.out.println(AuthenticationKey);

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		// email 전송
		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(user, "Jejuouddea@jeju.com"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

			// 메일 제목
			msg.setSubject("안녕하세요  인증 메일입니다.");
			// 메일 내용	
			msg.setText("인증 번호는 :" + num);

			Transport.send(msg);
			System.out.println("이메일 전송");

		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		HttpSession saveKey = request.getSession();
		saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
		// 패스워드 바꿀때 뭘 바꿀지 조건에 들어가는 id
		/*
		 * req.setAttribute("id", memberId);
		 * req.getRequestDispatcher("/views/login_myPage/searchPasswordEnd.jsp").forward
		 * (req, resp);
		 */
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}

}
