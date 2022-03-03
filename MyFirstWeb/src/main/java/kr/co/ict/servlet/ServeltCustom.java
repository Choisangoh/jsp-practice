package kr.co.ict.servlet;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServeltCustom
 */
@WebServlet("/visit")
public class ServeltCustom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServeltCustom() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("/visit 최초 접속!");
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		System.out.println("/visit 접속 시 생성된 객체는 서버 종료로 인해 파기된다.");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/visit 주소 접속 확인");
		// request.getParameter();를 이용해
		// "jsp", "boot"라는 이름으로 들어온 요소를 콘솔에 찍히도록 코드 작성
		// 확인하는 방법은 url에 ?jsp=값1&boot=값2 작성해서 확인가능
		String jsp = request.getParameter("jsp");
		String boot = request.getParameter("boot");
		System.out.println(jsp + " , " + boot);
		
		// "jpa"라는 이름으로 들어온 요소를 콘솔에 찍도록 추가하기
		String jpa = request.getParameter("jpa");
		System.out.println(jpa);	
		
		// 리다이렉트 방식은 페이지만 이동하고 데이터는 같이 전송하지 않는다.
		// response.sendRedirect("http://localhost:8181/MyFirstWeb/servletForm/visitResult.jsp");
	    
		// 포워딩 하기 전 request에 setAttribute();를 이용해 데이터를 저장한다.
		request.setAttribute("jsp", jsp);
		request.setAttribute("boot", boot);
		request.setAttribute("jpa", jpa);
		// 상단 변수를 함께 전달하기 위해 forward를 사용한다.
		// 목적지 주소는 'localhost:포트번호/프로젝트명'는 제외하고,
		// '/이후경로'만 입력하면 된다.
		RequestDispatcher dp = request.getRequestDispatcher("/servletForm/visitResult.jsp");
		dp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// doPost는 현재까지 배운 내용만 놓고 봤을 때, form에서 post방식으로 제출할떄 호출된다.
		System.out.println("/visit 주소 post방식으로 접속함");
		// 한글 안꺠지도록 설정
		request.setCharacterEncoding("utf-8");
		String jsp = request.getParameter("jsp");
		String boot = request.getParameter("boot");
		String jpa = request.getParameter("jpa");
		System.out.println("post방식 : " + jsp);
		System.out.println("post방식 : " + boot);
		System.out.println("post방식 : " + jpa);
		
		// 리다이렉트 방식은 페이지만 이동하고 데이터는 같이 전송하지 않는다.
		// response.sendRedirect("http://localhost:8181/MyFirstWeb/servletForm/visitResult.jsp");
		
		// 포워딩 하기 전 request에 setAttribute();를 이용해 데이터를 저장한다.
		request.setAttribute("jsp", jsp);
		request.setAttribute("boot", boot);
		request.setAttribute("jpa", jpa);
		// 상단 변수를 함께 전달하기 위해 forward를 사용한다.
		// 목적지 주소는 'localhost:포트번호/프로젝트명'는 제외하고,
		// '/이후경로'만 입력하면 된다.
		RequestDispatcher dp = request.getRequestDispatcher("/servletForm/visitResult.jsp");
		dp.forward(request, response);
	}
}
