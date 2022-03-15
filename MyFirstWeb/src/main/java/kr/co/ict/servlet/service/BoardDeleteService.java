package kr.co.ict.servlet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;

public class BoardDeleteService implements IBoardService{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		String boardNum = request.getParameter("board_num");
		int bNum = Integer.parseInt(boardNum);
		
		// dao 생성
		BoardDAO dao = BoardDAO.getInstance();
		// 삭제로직 실행
		dao.deleteBoard(bNum);		
	}
}
