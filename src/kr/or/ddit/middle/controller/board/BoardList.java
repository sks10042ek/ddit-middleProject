package kr.or.ddit.middle.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.middle.service.board.BoardServiceImpl;
import kr.or.ddit.middle.service.board.IBoardService;
import kr.or.ddit.middle.vo.BoardVO;
import kr.or.ddit.middle.vo.View_BoardVO;

@WebServlet("/board/*")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IBoardService service = BoardServiceImpl.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 요청 URI를 얻어온다.
		String requestUri = request.getRequestURI();
		// contextPath를 얻어온다.
		// contextPath 요청시 Root를 뜻한다.
		String contextPath = request.getContextPath();
		// contextPath를 제와한 나머지 URL을 command라고 지칭한다.
		String command = requestUri.substring(contextPath.length());

		request.setCharacterEncoding("utf-8");

		String goPage = ""; // 이동할 페이지

		if (command.equals("/board/NoticeList.do")) { // 공지사항목록
			noticeCheck(request);
			request.getRequestDispatcher(request.getContextPath() +"/Contents/NoticeList.jsp").forward(request, response);
		
		}else if(command.equals("/board/noticeDetail.do")) { // 공지사항상세
			noticeDetail(request);
			request.getRequestDispatcher(request.getContextPath() +"/Contents/NoticeDetail.jsp").forward(request, response);
		
		}else if(command.equals("/board/inquiryList.do")) { // 1:1문의목록
			inquiryCheck(request);
			request.getRequestDispatcher(request.getContextPath() +"/Contents/NoticeBoard.jsp?").forward(request, response);
		
		}else if(command.equals("/board/inquiryDetail.do")) { // 1:1문의상세
			inquiryDetail(request);
			request.getRequestDispatcher(request.getContextPath() +"/Contents/Notice.jsp").forward(request, response);
			
		}else if(command.equals("/board/inquiryWrite.do")) { // 1:1문의작성
			inquiryDetail(request);
			request.getRequestDispatcher(request.getContextPath() +"/Contents/NoticeWrite.jsp").forward(request, response);
		
		}else if(command.equals("/board/updateForm.do")) { // 1:1문의수정
			boardUpdateView(request);
			request.getRequestDispatcher(request.getContextPath() +"/Contents/NoticeUpdate.jsp").forward(request, response);
			
		}else if(command.equals("/board/hoMarketList.do")) { // 양도마켓 리스트출력
			hoMarketList(request);
			request.getRequestDispatcher(request.getContextPath() +"/Contents/transferMarket.jsp").forward(request, response);
		
		}else if(command.equals("/board/adminBoardList.do")) { // 관리자 게시판관리 리스트출력
			adminBoardList(request);
			request.getRequestDispatcher(request.getContextPath() +"/Contents/AdminBoardMgmt.jsp").forward(request, response);
		
		}else if(command.equals("/board/noticeWrite.do")) { // 공지사항 작성
			noticeDetail(request);
			request.getRequestDispatcher(request.getContextPath() +"/Contents/NoticeInsert.jsp").forward(request, response);
		
		}
	  
	}
	
	// 관리자 게시판 조회
	private void adminBoardList(HttpServletRequest request) {
		
		List<View_BoardVO> list =  service.adminBoardCheck();
		request.setAttribute("adList", list);
	}
	
	
	private void hoMarketList(HttpServletRequest request) {
		
		List<View_BoardVO> list =  service.hoMarketCheck();
		request.setAttribute("hoList", list);
	}

	// 1:1문의수정
	private void boardUpdateView(HttpServletRequest request) {
		String bono = request.getParameter("bo_code");
		View_BoardVO board = service.inquiryDetail(bono);
		request.setAttribute("boardVO",  board);
	}
	
	// 공지사항목록
	private void noticeCheck(HttpServletRequest request) {

		List<View_BoardVO> list = service.noticeCheck();
		request.setAttribute("boardList", list);

	}
	
	// 공지사항상세
	private void noticeDetail(HttpServletRequest request) {
		
		String boCode = request.getParameter("param");	
		
		View_BoardVO vo = service.noticeDetail(boCode);
		request.setAttribute("viewVO", vo);
		
	}
	
	// 1:1문의목록
	private void inquiryCheck(HttpServletRequest request) {

		List<View_BoardVO> list = service.inquiryCheck();
		request.setAttribute("inquiryList", list);

	}
	
	 // 1:1문의상세
	private void inquiryDetail(HttpServletRequest request) {
		
		String boCode = request.getParameter("param");	
		
		View_BoardVO vo = service.inquiryDetail(boCode);
		request.setAttribute("viewVO", vo);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 요청 URI를 얻어온다.
		String requestUri = request.getRequestURI();
		// contextPath를 얻어온다.
		// contextPath 요청시 Root를 뜻한다.
		String contextPath = request.getContextPath();
		// contextPath를 제와한 나머지 URL을 command라고 지칭한다.
		String command = requestUri.substring(contextPath.length());

		request.setCharacterEncoding("utf-8");
		
		String goPage = ""; // 이동할 페이지
				
				
		
	     if(command.equals("/board/insert.do")) {
	    	  // 문의글  등록 처리 이벤트
	    	  int cnt = boardInsert(request);
	    	  if(cnt > 0) { //문의글 등록 성공
	    		  // 페이지 이동방식 선택해야함 :리다이렉트
	    		  response.sendRedirect(contextPath + "/board/inquiryList.do");
	    		  
	    	  }else { //등록실패
	    		  request.getRequestDispatcher("/Contents/board/NoticeWrite.jsp")
	    		  							.forward(request, response);
	    	  }
	      }else if(command.equals("/board/update.do")) {
	    	  String bono = request.getParameter("bo_code");
	    
	    	  int cnt = boardUpdate(request);
	    	  if(cnt > 0) { //문의글 수정성공
	    		  response.sendRedirect(contextPath + "/board/inquiryList.do");
	    	  }else {
	    		  request.getRequestDispatcher("/Contents/board/NoticeUpdate.jsp")
					.forward(request, response);
	    	  }
	    	  
	      }else if(command.equals("/board/delete.do")) {
	    	  String bono= request.getParameter("bo_code");
	    	  System.out.println(bono);
	    	  int cnt = boardDelete(request);
	    	  if(cnt>0) { //문의글 삭제성공
	    		  response.sendRedirect(contextPath + "/board/inquiryList.do");
	    	  }else {
	    		  request.getRequestDispatcher(contextPath + "/board/inquiryList.do?bo_code=" + bono);
					
	    	  }
	    	  
	      }else if(command.equals("/board/write.do")) {
	    	  // 공지사항 등록 처리 이벤트
	    	  int cnt = noticeInsert(request);
	    	  if(cnt > 0) { //등록 성공
	    		  // 페이지 이동방식 선택해야함 :리다이렉트
	    		  response.sendRedirect(contextPath + "/board/NoticeList.do");
	    		  
	    	  }else { //등록실패
	    		  request.getRequestDispatcher("/Contents/board/NoticeInsert.jsp")
	    		  							.forward(request, response);
	    	  }
	    	  
	      }else if(command.equals("/board/remove.do")) {
	    	  String bono= request.getParameter("bo_code");
	    	  System.out.println(bono);
	    	  int cnt = boardRemove(request);
	    	  if(cnt>0) { //공지사항 삭제성공
	    		  response.sendRedirect(contextPath + "/board/NoticeList.do");
	    	  }else {
	    		  request.getRequestDispatcher(contextPath + "/board/NoticeList.do?bo_code=" + bono);
					
	    	  }
	    	  
	      }
	     
	     
	     
	}
	
	// 1:1문의 글 삭제 
   private int boardDelete(HttpServletRequest request) {
		String bono = request.getParameter("bo_code");
		
		BoardVO boardVO = new BoardVO();
		boardVO.setBo_code(bono);
		boardVO.setBo_type("1:1문의"); 
		
		return service.inquiryDelete(boardVO);
	}
	
   // 1:1문의 글 수정 
   private int boardUpdate(HttpServletRequest request) {
		String no = request.getParameter("bo_code");
		String title = request.getParameter("bo_title");
		String content =request.getParameter("bo_content");
		
		View_BoardVO board = new View_BoardVO();
		board.setBo_code(no);
		board.setBo_title(title);
		board.setBo_content(content);
		
		return service.inquiryUpdate(board);
	}
		
	// 1:1문의 글 작성 
	private int boardInsert(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("LoginId");
		
		String title = request.getParameter("bo_title"); //제목
		String content = request.getParameter("bo_content"); //내용
		
		BoardVO boardVO = new BoardVO();
		boardVO.setMem_id(id);
		boardVO.setBo_title(title);
		boardVO.setBo_content(content);
		boardVO.setBo_type("1:1문의"); 
		
		return  service.BoardInsert(boardVO);
	}
	
	// 공지사항 글 작성 
	private int noticeInsert(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("LoginId");
		
		String title = request.getParameter("bo_title"); //제목
		String content = request.getParameter("bo_content"); //내용
		
		BoardVO boardVO = new BoardVO();
		boardVO.setMem_id(id);
		boardVO.setBo_title(title);
		boardVO.setBo_content(content);
		boardVO.setBo_type("공지사항"); 
		
		return  service.BoardInsert(boardVO);
	}
	
	// 공지사항 글 삭제 
	   private int boardRemove(HttpServletRequest request) {
			String bono = request.getParameter("bo_code");
			
			BoardVO boardVO = new BoardVO();
			boardVO.setBo_code(bono);
			boardVO.setBo_type("공지사항"); 
			
			return service.noticeDelete(boardVO);
		}
	

}
