package kr.co.ict;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	// DAO 코드 재활용하기.
	// 1. UserDAO에서 주석처리가 안 된 부분만
	// getInstance() 메서드까지 가져옴
	
	// 2. ~~~DAO 로 되어있는 부분을 전부 현재 DAO클래스명으로 변경
	// 예) UserDAO -> BoardDAO로 전환중이므로 UserDAO라고 적힌 부분을 전부 BoardDAO로 변경
	private DataSource ds = null;
	
	private static BoardDAO dao = new BoardDAO();
	
	private BoardDAO() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static BoardDAO getInstance() {
		if(dao == null) {
			dao = new BoardDAO();
		}
		return dao;
	}
	
	// 3. 필요로 하는 로직과 유사한 메서드를 복사해옵니다.
	// 게시판 글 전체 목록 가져오기 -> 회원 전체 목록 가져오기를 이용해 수정
	// 회원 전체 목록을 가져오는 getAllUserList를 수정해 getAllBoardList()를 생성해보겠습니다.
	
	// 3-1.UserVO는 userInfo테이블에 맞춰서 생성된 것이므로
	// boardTbl에 맞춰서 처리하기 위해 UserVO를 사용하는 부분을 전부 BoardVO로 수정해줍니다.
	
	// 3-2. 쿼리문을 boardtbl 테이블에서 데이터를 가져오도록 수정합니다.
	
	// 3-3. while문 내부에서 BoardVO 세팅이 가능하도록 rs에서 데이터 가져오는 부분을 수정합니다.
	// 페이징 처리를 위해 페이지 번호를 추가로 입력받기
	public List<BoardVO> getAllBoardList(int pageNum){
		// try블럭 진입 전 Connection, PreparedStatement, ResultSet 선언
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 페이징 처리시 페이지당 글 개수
		final int BOARD_COUNT = 10;
		// try블럭 진입 전에 ArrayList 선언
		List<BoardVO> boardList = new ArrayList<>();
		try {
			// Connection, PreparedStatement, ResultSet을 선언합니다.
			con = ds.getConnection();
			int limitNum = ((pageNum-1) * BOARD_COUNT);
			
			// SELECT * FROM userinfo 실행 및 ResultSet에 저장
			// LIMIT 뒤쪽 숫자가 페이지당 보여줄 글 개수이므로 DTO의 상수와 함께 고쳐야 함
			String sql = "SELECT * FROM boardinfo ORDER BY board_num DESC limit ?, ?";			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, limitNum);
			pstmt.setInt(2, BOARD_COUNT);
			
			rs = pstmt.executeQuery();

			// BoardVO ArrayList에 rs에 든 모든 자료를 저장해주세요.
			while(rs.next()) {
				// 7개 컬럼 값을 받아서 변수로 저장받으시고
				int boardNum = rs.getInt("board_num");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				Date bDate = rs.getDate("bdate");
				Date mDate = rs.getDate("mdate");
				int hit = rs.getInt("hit");
				// int board_num, String title, String content, String writer, Date bDate, Date mDate, int hit
				// 해당 변수를 이용해 BoardVO를 생성해주시면 됩니다.
				BoardVO boardData = new BoardVO(boardNum, title, content, writer, bDate, mDate, hit);
				boardList.add(boardData);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstmt.close();
				rs.close();
			} catch(SQLException se) {
				se.printStackTrace();
			}
		}	
		return boardList;
	}

	// insertBoard 내부 쿼리문 실행시 필요한 3개 요소인 글제목, 본문, 글쓴이를 입력해야만 실행할 수 있게 설계한다.
	public void insertBoard(String title, String content, String writer) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			// INSERT의 경우 두 가지 유형
			// 전체컬럼요소 다넣기 INSERT INTO boardTbl VALUES(null, ?, ?, ?, now(), now(), 0); 
			// 일부요소만 넣기 INSERT INTO boardTbl(title, content, writer) VALUES(?, ?, ?);
			String sql = "INSERT INTO boardinfo(title, content, writer) VALUES(?, ?, ?)";
			pstmt = con.prepareStatement(sql);// 쿼리문 세팅
			// 실행 전 상단 쿼리문 ? 채워넣기
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, writer);
			// 실행하기
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
				pstmt.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
	}

    // 글 한개만 필요한 상황이므로 BoardVO 하나면 처리 가능
	public BoardVO getBoardDetail(int board_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		BoardVO board = null;
		try {
            con = ds.getConnection();
			
			String sql = "SELECT * FROM boardinfo WHERE board_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int boardNum = rs.getInt("board_num");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				Date bDate = rs.getDate("bdate");
				Date mDate = rs.getDate("mdate");
				int hit = rs.getInt("hit");
				
				board = new BoardVO(boardNum, title, content, writer, bDate, mDate, hit);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				con.close();
				pstmt.close();
				rs.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
		}
		return board;
    }
	
	// deleteBoard에 메서드를 만들어서 삭제처리가 되도록하고
	// 서블릿에서 해당 메서드를 호출해 실제로 삭제버튼을 누르면 DB에서 해당 번호 글이 삭제되도록 하기
	public void deleteBoard(int boardNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();	
			    
			 String sql = "DELETE FROM boardinfo WHERE board_num=?";
			 pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1, boardNum);
			 
			 pstmt.executeUpdate();
			 
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				con.close();
			    pstmt.close();
			    
				}catch(Exception e) {
					e.printStackTrace();
			}
		}
	}	

    // update도 select가 아니므로 void리턴 자료형을 가진다
	public void boardUpadate(String title, String content, int boardNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();	
			    
			 String sql = "UPDATE boardinfo SET title=?, content=?, mdate=now() WHERE board_num=?";
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, title);
			 pstmt.setString(2, content);
			 pstmt.setInt(3, boardNum);
			 
			 pstmt.executeUpdate();
			 
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				con.close();
			    pstmt.close();
			    
				}catch(Exception e) {
					e.printStackTrace();
			}
		}
	}		

    // 서비스가 아닌 getBoardDetail 실행시 자동으로 같이 조회수가 올라가도록 실행되게 처리하기
	// 글 제목을 클릭할때마다 조회수 상승시키는 메서드
	public void upHit(int bId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			
			String sql = "UPDATE boardinfo SET hit = (hit + 1) WHERE board_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bId);
			pstmt.executeUpdate();			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			    pstmt.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
		}
	}
	
	// 페이징 처리를 위해 글 전체 개수를 구해오기
	// 하단에 public int getPageNum() 작성
	// 쿼리문은 SELECT count(*) FROM boardinfo; 사용
	public int getPageNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		int pageNum = 0;
		try {
            con = ds.getConnection();
			
			String sql = "SELECT count(*) FROM boardinfo";
			pstmt = con.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pageNum = rs.getInt(1);
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				con.close();
				pstmt.close();
				rs.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
		}
		return pageNum;
    }
}	
