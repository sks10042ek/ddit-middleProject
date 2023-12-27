package kr.or.ddit.middle.controller.member;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;

import kr.or.ddit.middle.service.accommodation.AccommodationServiceImpl;
import kr.or.ddit.middle.service.accommodation.IAccommodationService;
import kr.or.ddit.middle.service.accommodation.IRoomService;
import kr.or.ddit.middle.service.accommodation.RoomServiceImpl;
import kr.or.ddit.middle.service.member.IMemberService;
import kr.or.ddit.middle.service.member.MemberServiceImpl;
import kr.or.ddit.middle.vo.AccommodationVO;
import kr.or.ddit.middle.vo.MemberVO;
import kr.or.ddit.middle.vo.PhotoVO;
import kr.or.ddit.middle.vo.RoomVO;


@WebServlet("/adminMem/*")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024, // 파일 임시 저장에 사용되는 메모리 임계값 (1MB)
	    maxFileSize = 1024 * 1024 * 10, // 업로드 파일 최대 크기 (10MB)
	    maxRequestSize = 1024 * 1024 * 50 // 전체 요청 크기 (50MB)
	)
public class AdminMemCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

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

		request.setCharacterEncoding("utf-8");

		

		if (command.equals("/adminMem/adminMemList.do")) { // 공지사항목록
			adminMemList(request);
			request.getRequestDispatcher(request.getContextPath() + "/Contents/AdminMbrMgmt.jsp").forward(request,
					response);

		} 
	}

	

	private void adminMemList(HttpServletRequest request) {
		List<MemberVO> list = service.adminMemCheck();
		request.setAttribute("adList", list);
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
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");

		if (command.equals("/adminMem/insertAccom.do")) { // 숙소등록
			IAccommodationService service = AccommodationServiceImpl.getInstance();
			int cnt = insertAccom(request);

			String aCode=service.aCodeCheck();
			
			//System.out.println("aCode 진짜 안나옴녀 뒤진다."+aCode);
			
			Gson gson = new Gson();
			List<String> jsonData = new ArrayList<>();
			jsonData.add(gson.toJson(cnt));
			jsonData.add(gson.toJson(aCode));

			PrintWriter out = response.getWriter();
			out.write(jsonData.toString());
			response.flushBuffer();
			/*
			 * if (cnt > 0) { PrintWriter out = response.getWriter();
			 * 
			 * out.print(aCode);
			 * 
			 * }
			 */

		}else if (command.equals("/adminMem/accomPhoto.do")) {
				String aCode = request.getParameter("aCode");
			 	Part filePart1 = request.getPart("image0");
		        Part filePart2 = request.getPart("image1");
		        Part filePart3 = request.getPart("image2");

		        String fileName1 = getFileName(filePart1);
		        String fileName2 = getFileName(filePart2);
		        String fileName3 = getFileName(filePart3);

		    InputStream fileContent1 = null;
		    InputStream fileContent2 = null;
		    InputStream fileContent3 = null;

		    if (filePart1 != null) {
		        fileContent1 = filePart1.getInputStream();
		    }

		    if (filePart2 != null) {
		        fileContent2 = filePart2.getInputStream();
		    }

		    if (filePart3 != null) {
		        fileContent3 = filePart3.getInputStream();
		    }

		    // 업로드된 파일들이 저장될 폴더 설정
		    String uploadPath = "C:\\accom";
			fileName1 = aCode + "_1";
			fileName2 = aCode + "_2";
			fileName3 = aCode + "_3";
			// 저장될 폴더가 없으면 새로 만들어 놓는다.
			File f = new File(uploadPath);

			if (!f.exists()) {
				f.mkdirs();
			}

			String[] fileNames = { fileName1, fileName2, fileName3 };
			Part[] fileParts = {filePart1,filePart2,filePart3};
			for (int i = 0; i < fileNames.length; i++) {
				String fileName = fileNames[i];
				

				if (fileParts[i] != null && fileParts[i].getSize() > 0) {
					PhotoVO fileVo = new PhotoVO();
					fileVo.setPt_file(fileName);
					fileVo.setPt_type("숙소");

					try {
						fileParts[i].write(uploadPath + File.separator + fileVo.getPt_file() + ".jpg");
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}

			request.setAttribute("result", "ok");
			request.getRequestDispatcher("/Contents/accomFileCheck.jsp").forward(request, response);

		}else if(command.equals("/adminMem/delete.do")) {
	    	  String memno= request.getParameter("mem_id");
	    	 
	    	  
	    	  int cnt = service.memberDelete(memno);
	    
	    	  if (cnt > 0) { // 삭제 성공
	    		    response.getWriter().write("success");
	    		} else {
	    		    // 삭제 실패 처리
	    		    response.getWriter().write("failure");
	    		}
	    }else if(command.equals("/adminMem/insertRoom.do")) {
	        IAccommodationService service = AccommodationServiceImpl.getInstance();
	    	
	    	List<Integer> list = new ArrayList<Integer>();
	    	List<String> rCode = new ArrayList<String>();;
	    	Gson gson = new Gson();
	    	String aCode = service.aCodeCheck();	    	   
	    	 
	    	try {
	    	    // JSON 데이터를 문자열로 읽어옴
	    	    BufferedReader reader = request.getReader();
	    	    StringBuilder stringBuilder = new StringBuilder();
	    	    String line;
	    	    while ((line = reader.readLine()) != null) {
	    	        stringBuilder.append(line);
	    	    }

	    	    String jsonData = stringBuilder.toString();

	    	    // Gson을 사용하여 JSON 문자열을 List<RoomVO> 형태로 변환
	    	    
	    	    TypeToken<List<RoomVO>> typeToken = new TypeToken<List<RoomVO>>() {};
	    	    List<RoomVO> roomVOList = gson.fromJson(jsonData, typeToken.getType());

	    	    IRoomService rService = RoomServiceImpl.getInstance();
	    	   

	    	    for (RoomVO roomVO : roomVOList) {
	    	        int r_min = roomVO.getR_min();
	    	        int r_max = roomVO.getR_max();
	    	        int r_price = roomVO.getR_price();
	    	        String r_type = roomVO.getR_type();

	    	        RoomVO vo = new RoomVO();
	    	        vo.setR_inven(5); // 객실재고
	    	        vo.setA_code(aCode); // 숙박업체코드
	    	        vo.setR_min(r_min); // 최소인원
	    	        vo.setR_max(r_max); // 최대인원
	    	        vo.setR_price(r_price); // 룸가격
	    	        vo.setR_type(r_type); // 룸 타입
	    	        //for문을 돌면서 room을 한개씩 인서트
	    	        list.add(rService.roomInsert(vo));
	    	        //인서트된 r_code를 뽑아서 저장
	    	        rCode.add(rService.roomCodeCheck());
	    	    }
	    	    	for(String s : rCode) {
	    	    		System.out.println("값있잖아 : "+s);
	    	    	}
	    	    	System.out.println();
	    	 
	    	} catch (Exception e) {
	    	    e.printStackTrace();
	    	    // 처리 중 에러가 발생한 경우 예외 처리
	    	    response.setContentType("application/json");
	    	    response.getWriter().write("{\"result\": \"error\"}");
	    	}

	    	
	    	
	    	int cnt =0;
	    	for(int i : list) {
	    		if(i==1) {
	    			cnt++;
	    		}
	    	}
	    	
	    	if(cnt==4) {
	    		cnt =1;
	    	}else {
	    		cnt=0;
	    	}

			
			List<String> jsonData = new ArrayList<>();
			jsonData.add(gson.toJson(cnt));
			jsonData.add(gson.toJson(rCode));
			PrintWriter out = response.getWriter();
			out.print(jsonData);
			response.flushBuffer();
	    
	    }else if(command.equals("/adminMem/RoomPhoto.do")) {
	   
	    	String rCode = request.getParameter("rCode");
		 	Part filePart = request.getPart("image");
		 	String fileName = getFileName(filePart);
		 	InputStream fileContent = null;
		 	
		 	if (filePart != null) {
		        fileContent = filePart.getInputStream();
		    }
		 	//업로드 경로
		 	String uploadPath = "C:\\room";
		 	File f = new File(uploadPath);
		 	if (!f.exists()) {
				f.mkdirs();
			}
		 	if (filePart != null) {
				PhotoVO fileVo = new PhotoVO();
				fileName=rCode;
				fileVo.setPt_file(fileName);
				fileVo.setPt_type("객실");

				try {
					filePart.write(uploadPath + File.separator + fileVo.getPt_file() + ".jpg");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		 	request.setAttribute("result", "ok");
			request.getRequestDispatcher("/Contents/roomFileCheck.jsp").forward(request, response);
		 	
	    }
	}
	


	private String getFileName(Part part) {
	    if (part == null) {
	        return ""; // 파일이 없는 경우 빈 문자열 반환
	    }
	    
	    String contentDisp = part.getHeader("content-disposition");
	    String[] tokens = contentDisp.split(";");
	    for (String token : tokens) {
	        if (token.trim().startsWith("filename")) {
	            return token.substring(token.indexOf("=") + 2, token.length() - 1);
	        }
	    }
	    return "";
	}

	private int insertAccom(HttpServletRequest request) {
		IAccommodationService service = AccommodationServiceImpl.getInstance();
		AccommodationVO vo = new AccommodationVO();
		
		try {
//			map으로 받아서 일치하는값을 vo에 하나씩 자동으로 넣어줌
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {	
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	
		
		return service.acInsert(vo);

	}

}
