package kr.or.ddit.middle.controller.board;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/chatbotServlet.do")
public class ChatbotServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private Map<String, String> responses;

    public ChatbotServlet() {
        super();
        responses = new HashMap<>();
        responses.put("안녕하세요~", "안녕하세요!!! ");
        responses.put("지금 올라온 숙소 양도 가능 한가요?", "먼저 구매하겠다고 하신분이 있긴 했는데 결제 먼저 하는 사람이 우선이죠 ! ");
        responses.put("앗! 바로 결제할게요", "계좌번호 드릴테니까 입금해주시면 양도 도와드릴게요~~");
        responses.put("네 감사합니다", "네 좋은 하루 되세요~");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String userMessage = request.getParameter("message");
        String chatbotResponse = responses.get(userMessage);

        if (chatbotResponse == null) {
            chatbotResponse = "죄송해요, 잘 이해하지 못했어요.";
        }

        out.write(chatbotResponse);
        out.close();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}