package kr.or.ddit.middle.controller.member;

import java.io.IOException;
import java.util.Properties;

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

import kr.or.ddit.middle.service.member.IMemberService;
import kr.or.ddit.middle.service.member.MemberServiceImpl;
import kr.or.ddit.middle.vo.MemberVO;
import oracle.jdbc.connector.OracleConnectionRequestInfo;

/**
 * Servlet implementation class SearchInfo
 */
@WebServlet("/findInfo/*")
public class SearchInfo extends HttpServlet {

	private IMemberService service = MemberServiceImpl.getInstance();

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
		response.setCharacterEncoding("UTF-8"); // 인코딩 설정

		String goPage = ""; // 이동할 페이지

		if (command.equals("/findInfo/id.do")) {
			findId(request);
			goPage = "/Contents/idSearchResult.jsp";
		} else if (command.equals("/findInfo/pass.do")) {
			int cnt = findPass(request);
			goPage = "/Contents/pwSearchResult.jsp";
			if (cnt > 0) {
				request.setAttribute("state", "성공");
				sendVerificationEmail(request);
				updatePass(request);

			} else {
				request.setAttribute("state", "실패");
			}
		}

		request.getRequestDispatcher(goPage).forward(request, response);

	}

	private void findId(HttpServletRequest request) {

		String email = request.getParameter("mail");

		String id = service.findId(email);
		request.setAttribute("findId", id);

	}

	private int findPass(HttpServletRequest request) {

		String id = request.getParameter("uid");
		String email = request.getParameter("uemail");

		MemberVO memVO = new MemberVO();
		memVO.setMem_id(id);
		memVO.setMem_email(email);
//		request.setAttribute("email", email);
		return service.findPass(memVO);

	}

	private void sendVerificationEmail(HttpServletRequest request) {
//		String uemail = (String) request.getAttribute("email");

		// 이메일 전송 로직 작성
		// mail server 설정
		String host = "smtp.naver.com";
		String user = "alsl1597@naver.com"; // 자신의 네이버 계정
		String password = "alcl159753!";// 자신의 네이버 패스워드

		// 메일 받을 주소
		String to_email=request.getParameter("uemail");	
		/* String to_email = (String) request.getAttribute("email"); */

		// SMTP 서버 정보를 설정한다.
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.debug", "true");

		String num = "0000";	
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
		
		

	}
	
	private int updatePass(HttpServletRequest request) {
		
		String id=request.getParameter("uid");
		
		return service.updatePass(id);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
