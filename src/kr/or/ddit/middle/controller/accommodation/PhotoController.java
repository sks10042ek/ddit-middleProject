package kr.or.ddit.middle.controller.accommodation;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/photo/*")
public class PhotoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		// 요청 URI를 얻어온다.
		String requestUri = request.getRequestURI();
		// contextPath를 얻어온다.
		// contextPath 요청시 Root를 뜻한다.
		String contextPath = request.getContextPath();
		// contextPath를 제와한 나머지 URL을 command라고 지칭한다.
		String command = requestUri.substring(contextPath.length());

		if (command.equals("/photo/accomPhoto.do")) {

			String filename = request.getParameter("param");
			String filePath = "C:/accom";

			// 폴더안에있는 저장된 이름으로 가져오기
			File file = new File(filePath + File.separator + filename + "_1.jpg");

			BufferedInputStream bin = null;
			BufferedOutputStream bout = null;

			// 해당 파일이 있으면..
			if (file.exists()) {
				try {

					// 파일 입력용 스트림객체 생성
					bin = new BufferedInputStream(new FileInputStream(file));

					// 출력용 스트림객체 생성
					bout = new BufferedOutputStream(response.getOutputStream());

					byte[] temp = new byte[1024];
					int len = 0;
					while ((len = bin.read(temp)) > 0) {
						bout.write(temp, 0, len);
					}
					bout.flush();

				} catch (Exception e) {
					System.out.println("입출력오류 : " + e.getMessage());
				} finally {
					if (bin != null)
						try {
							bin.close();
						} catch (IOException e) {
						}
					if (bout != null)
						try {
							bout.close();
						} catch (IOException e) {
						}
				}
			}

		} else if (command.equals("/photo/accomDetail.do")) {

			String filename1 = request.getParameter("param1");
			String filename2 = request.getParameter("param2");
			String filename3 = request.getParameter("param3");

			String filePath = "C:/accom";

			if (filename1 != null) {
				serveImage(filename1, filePath, "_1", response);
			}

			if (filename2 != null) {
				serveImage(filename2, filePath, "_2", response);
			}

			if (filename3 != null) {
				serveImage(filename3, filePath, "_3", response);
			}

		} else if (command.equals("/photo/roomPhoto.do")) {
			String filename = request.getParameter("param");
			String filePath = "C:/room";
			
		
			// 폴더안에있는 저장된 이름으로 가져오기
			File file = new File(filePath + File.separator + filename + ".jpg");

			BufferedInputStream bin = null;
			BufferedOutputStream bout = null;

			// 해당 파일이 있으면..
			if (file.exists()) {
				try {
					// 파일 입력용 스트림객체 생성
					bin = new BufferedInputStream(new FileInputStream(file));

					// 출력용 스트림객체 생성
					bout = new BufferedOutputStream(response.getOutputStream());

					byte[] temp = new byte[1024];
					int len = 0;
					while ((len = bin.read(temp)) > 0) {
						bout.write(temp, 0, len);
					}
					bout.flush();

				} catch (Exception e) {
					System.out.println("입출력오류 : " + e.getMessage());
				} finally {
					if (bin != null)
						try {
							bin.close();
						} catch (IOException e) {
						}
					if (bout != null)
						try {
							bout.close();
						} catch (IOException e) {
						}
				}
			}
		}else if (command.equals("/photo/reviewPhoto.do")) {
			String filename = request.getParameter("param");
			String filePath = "C:/review";
			System.out.println(filename);
		
			// 폴더안에있는 저장된 이름으로 가져오기
			File file = new File(filePath + File.separator + filename + ".jpg");

			BufferedInputStream bin = null;
			BufferedOutputStream bout = null;

			// 해당 파일이 있으면..
			if (file.exists()) {
				
				try {
					// 파일 입력용 스트림객체 생성
					bin = new BufferedInputStream(new FileInputStream(file));

					// 출력용 스트림객체 생성
					bout = new BufferedOutputStream(response.getOutputStream());

					byte[] temp = new byte[1024];
					int len = 0;
					while ((len = bin.read(temp)) > 0) {
						bout.write(temp, 0, len);
					}
					bout.flush();

				} catch (Exception e) {
					System.out.println("입출력오류 : " + e.getMessage());
				} finally {
					if (bin != null)
						try {
							bin.close();
						} catch (IOException e) {
						}
					if (bout != null)
						try {
							bout.close();
						} catch (IOException e) {
						}
				}
			}
		}
	}

	private void serveImage(String filename, String filePath, String suffix, HttpServletResponse response)
			throws IOException {
		
		
		File file = new File(filePath + File.separator + filename + suffix + ".jpg");

		if (file.exists()) {
			try (BufferedInputStream bin = new BufferedInputStream(new FileInputStream(file));
				BufferedOutputStream bout = new BufferedOutputStream(response.getOutputStream())) {

				byte[] temp = new byte[1024];
				int len;
				while ((len = bin.read(temp)) > 0) {
					bout.write(temp, 0, len);
				}
				bout.flush();
			} catch (IOException e) {
				System.out.println("입출력오류 : " + e.getMessage());
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
