package kr.co.ict.servlet;

import java.io.IOException;
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
		// TODO Auto-generated method stub
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
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
