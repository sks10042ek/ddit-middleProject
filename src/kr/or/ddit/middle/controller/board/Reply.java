package kr.or.ddit.middle.controller.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.or.ddit.middle.service.board.BoardServiceImpl;
import kr.or.ddit.middle.service.board.IBoardService;
import kr.or.ddit.middle.vo.ComentVO;


@WebServlet("/reply/*")
public class Reply extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			// 요청 URI를 얻어온다.
			String requestUri = request.getRequestURI();
					// contextPath를 얻어온다.
					// contextPath 요청시 Root를 뜻한다.
			String contextPath = request.getContextPath();
					// contextPath를 제와한 나머지 URL을 command라고 지칭한다.
			String command = requestUri.substring(contextPath.length());
					
			request.setCharacterEncoding("UTF-8"); // 인코딩 설정
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json; charset=utf-8");
			
			if (command.equals("/reply/replyInsert.do")) { // 공지사항목록
				int cnt= replyInsert(request);
				
				if(cnt>0) {
					 response.getWriter().write("{\"success\": true}");
				}else {
					 response.getWriter().write("{\"success\": false}");
				}

			}else if(command.equals("/reply/commentList.do")) {
			
				
				Gson gson = new Gson();
				// json 결과값 받을 변수
				String jsonData = null;
				List<ComentVO> list= commentList(request);
				
				
				
				// list를 json타입으로 만드는 과정
				jsonData=gson.toJson(list);
				

				PrintWriter out = response.getWriter();
				out.print(jsonData);
				response.flushBuffer();
 
			}else if(command.equals("/reply/updateComment.do")) {
				int cnt = updateComment(request);
				if(cnt>0) {
					 response.getWriter().write("{\"success\": true}");
				}else {
					 response.getWriter().write("{\"success\": false}");
				}
			}else if(command.equals("/reply/deleteComment.do")) {
				
				
				int cnt = deleteComment(request);
				if(cnt>0) {
					 response.getWriter().write("{\"success\": true}");
				}else {
					 response.getWriter().write("{\"success\": false}");
				}
			}
	}
	//댓글 삭제 메소드
	private int deleteComment(HttpServletRequest request) {
		String code = (String)request.getParameter("coCode");
		IBoardService service = BoardServiceImpl.getInstance();
		
		int cnt = service.CommentDelete(code);
		
		return cnt;
	}
	//댓글 수정 메소드
	private int updateComment(HttpServletRequest request) {
		String code = (String)request.getParameter("coCode");
		String content = (String)request.getParameter("coContent");
		
		IBoardService service = BoardServiceImpl.getInstance();
		
		
		ComentVO vo = new ComentVO();
		vo.setCo_code(code);
		vo.setCo_content(content);
		int cnt = service.CommentUpdate(vo);
        
		return cnt;
	}

	private List<ComentVO> commentList(HttpServletRequest request) {
		String bo_no=request.getParameter("param");
		
		IBoardService service = BoardServiceImpl.getInstance();
		
		List<ComentVO> list = service.commentCheck(bo_no);
		
		return list;
				
	}

	private int replyInsert(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("LoginId");
		String bo_code = request.getParameter("bo_num");
		String content = request.getParameter("replyContent");
		
		ComentVO vo = new ComentVO();
		
		vo.setBo_code(bo_code);
		vo.setCo_content(content);
		vo.setMem_name(id);
		
		IBoardService service = BoardServiceImpl.getInstance();
		
		return service.commentInsert(vo);
		
	}

}
