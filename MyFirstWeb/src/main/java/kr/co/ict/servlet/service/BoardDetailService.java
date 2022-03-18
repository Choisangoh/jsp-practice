package kr.co.ict.servlet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;
import kr.co.ict.BoardVO;

public class BoardDetailService implements IBoardService{
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		
		// request.getParameter를 이용해서 글번호부터 가져온다.(board_num으로 가져옴)
		String boardNum = request.getParameter("board_num");
		int bNum = Integer.parseInt(boardNum);
		System.out.println(bNum);
				
		// dao생성
		BoardDAO dao = BoardDAO.getInstance();
		
		// 조회수 올리기
		dao.upHit(bNum);
				
		// dao에서 해당 글번호에 대한 정보를 가져오고
		BoardVO board = dao.getBoardDetail(bNum);
				
	    // 정보가 제대로 들어왔는지 디버깅 하기
		// System.out.println(board);
				
		// 데이터 바인딩
		request.setAttribute("board", board);
				
	}
}
