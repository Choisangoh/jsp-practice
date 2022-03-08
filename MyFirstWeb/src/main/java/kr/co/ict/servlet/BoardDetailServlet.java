package kr.co.ict.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;
import kr.co.ict.BoardVO;

/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/boarddetail")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request.getParameter를 이용해서 글번호부터 가져온다.(board_num으로 가져옴)
		String boardNum = request.getParameter("board_num");
		int bNum = Integer.parseInt(boardNum);
		System.out.println(bNum);
		
		// dao생성
		BoardDAO dao = BoardDAO.getInstance();
		
		// dao에서 해당 글번호에 대한 정보를 가져오고
		BoardVO board = dao.getBoardDetail(bNum);
		
		// 정보가 제대로 들어왔는지 디버깅 하기
		System.out.println(board);
		
		// 데이터 바인딩
		request.setAttribute("board", board);
		
		// 디테일페이지로 포워딩(boarddetail.jsp) 데이터 나오는지 체크
		RequestDispatcher dp = request.getRequestDispatcher("/board/boarddetail.jsp");
		dp.forward(request, response);
	}

}
