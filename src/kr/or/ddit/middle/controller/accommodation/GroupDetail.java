package kr.or.ddit.middle.controller.accommodation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.middle.service.accommodation.AccommodationServiceImpl;
import kr.or.ddit.middle.service.accommodation.IAccommodationService;
import kr.or.ddit.middle.vo.GroupBuyingVO;
import kr.or.ddit.middle.vo.Search_AccomVO;


@WebServlet("/groupDetail.do")
public class GroupDetail extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String code = request.getParameter("code");
		IAccommodationService service = AccommodationServiceImpl.getInstance();
		System.out.println(code);
		List<GroupBuyingVO> list = service.GBDetailList(code);
		
		request.setAttribute("GBList", list);
		
		request.getRequestDispatcher("/Contents/groupDetail.jsp").forward(request, response);
    } 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doGet(request,response);
		
	}

}

