package kr.or.ddit.middle.controller.accommodation;

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

import kr.or.ddit.middle.service.accommodation.AccommodationServiceImpl;
import kr.or.ddit.middle.service.accommodation.IAccommodationService;
import kr.or.ddit.middle.vo.Search_AccomVO;

@WebServlet("/accomMemberList.do")
public class AccomMemberList extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8"); // 인코딩 설정
      response.setCharacterEncoding("utf-8");
      response.setContentType("application/json; charset=utf-8");

      /*
       * // 요청 URI를 얻어온다. String requestUri = request.getRequestURI();
       * 
       * // contextPath를 얻어온다. // contextPath 요청시 Root를 뜻한다. String contextPath =
       * request.getContextPath();
       * 
       * // contextPath를 제와한 나머지 URL을 command라고 지칭한다. String command =
       * requestUri.substring(contextPath.length());
       * 
       * // String goPage = ""; //이동할 페이지
       */
      //String type = "";
      String type =request.getParameter("param");

      if (type.equals("hotel")) {
         type = "호텔";
      }else if(type.equals("pansion")) {
         type = "펜션";
      }else if(type.equals("gueha")) {
         type= "게하";
      }
   
      HttpSession session = request.getSession();
      String id = (String) session.getAttribute("LoginId");
      String[] flist = request.getParameterValues("flist");
       int flistNum = Integer.parseInt((request.getParameter("flistNum")));
      

        
        
      IAccommodationService service = AccommodationServiceImpl.getInstance();
      
      Search_AccomVO sa = new Search_AccomVO();
      sa.setA_type(type);
      sa.setMem_id(id);
      sa.setFlist(flist);
      sa.setFlistNum(flistNum);
      
      List<Search_AccomVO> list = null;
      
      
      if(id == null) {
         if(flist == null) {
         list= service.acCheck(type);
         }else {
         list = service.acServiceCheck(sa);
         }
      }else if(id != null){
         if(flist == null) {
         list= service.acCheckMem(sa);
         }else {
         list = service.acServiceCheckMem(sa);
         }
      }
      
      
      
      // json변환객체 선언
      Gson gson = new Gson();
      // json 결과값 받을 변수
      String jsonData = null;

      // list를 json타입으로 만드는 과정
      jsonData = gson.toJson(list);

      PrintWriter out = response.getWriter();
      out.write(jsonData);
      response.flushBuffer();

   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

   }

}