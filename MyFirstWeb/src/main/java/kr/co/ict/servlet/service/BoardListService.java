package kr.co.ict.servlet.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ict.BoardDAO;
import kr.co.ict.BoardVO;

// BoardListService는 boardList 접속 시 사용하는 로직을 관리한다.
public class BoardListService implements IBoardService{
	
	@Override
   public void excute(HttpServletRequest request, HttpServletResponse response) {
	// 1. 접속시 BoardDAO생성
	BoardDAO dao = BoardDAO.getInstance();
			
	// 2. BoardDAO의 getAllBoardList() 호출해 전체 게시글 정보 받아오기
	List<BoardVO> boardList = dao.getAllBoardList();
			
	// 3. request.setAttribute로 바인딩하기
	// List<BoardVO> boardList를 바로 바인딩할수도 있습니다. 
	request.setAttribute("boardList", boardList);
	
	// 로그인 여부는 세션값을 저장한 다음, 바인딩해서 .jsp페이지에서 확인
	// 서블릿(서비스) 내부에서 세션 쓰는법
	// 1. 세션 객체 생성(.jsp 내부에서는 자동으로 생성되는 "내장 객체" 이지만 서블릿 로직에선 생성해야 쓸 수 있음)
	HttpSession session = request.getSession();
	// 2. .jsp의 스크립트릿 내부와 동일하게 세션값 얻어오기 가능(setAttribute로 저장 가능)
	String sId = (String)session.getAttribute("session_id");
	System.out.println("로그인 여부 : " + sId );
	// 세션값 체킹이 확인되면 바인딩해서 포워딩 시 세션값이 같이 넘어가도록 처리
	request.setAttribute("sId", sId);
   }
}
