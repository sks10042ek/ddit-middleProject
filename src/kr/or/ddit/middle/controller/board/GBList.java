package kr.or.ddit.middle.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.middle.service.accommodation.AccommodationServiceImpl;
import kr.or.ddit.middle.service.accommodation.IAccommodationService;
import kr.or.ddit.middle.vo.GroupBuyingVO;


@WebServlet("/gBList.do")
public class GBList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  request.setCharacterEncoding("utf-8");
	  IAccommodationService service = AccommodationServiceImpl.getInstance();
	  
	  List<GroupBuyingVO> gblist = service.GBList();
	  
	  request.setAttribute("gblist", gblist);
	  
	  request.getRequestDispatcher("/Contents/groupBuying.jsp").forward(request, response);
	  
	  
  
  
  
  }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
