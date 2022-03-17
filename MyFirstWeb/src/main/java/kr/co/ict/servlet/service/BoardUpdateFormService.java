package kr.co.ict.servlet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ict.BoardDAO;
import kr.co.ict.BoardVO;

public class BoardUpdateFormService implements IBoardService{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		String boardNum = request.getParameter("board_num");
		int bNum = 0;
		if(boardNum != null) {
		   bNum = Integer.parseInt(boardNum);
		}
		BoardDAO dao = BoardDAO.getInstance();
			
	    BoardVO board = dao.getBoardDetail(bNum);
			
		request.setAttribute("board", board);		
	}
}