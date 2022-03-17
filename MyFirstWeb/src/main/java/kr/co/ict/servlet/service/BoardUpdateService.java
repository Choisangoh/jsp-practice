package kr.co.ict.servlet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ict.BoardDAO;

public class BoardUpdateService implements IBoardService{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		String sbNum = request.getParameter("board_num");
		int bNum = Integer.parseInt(sbNum);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.boardUpadate(title, content, bNum);	
	}
}
