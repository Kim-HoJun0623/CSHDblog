package Board;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class BoardDAO {
	private Connection conn;
	private ResultSet rs;
	
	//기본 생성자
	public BoardDAO() {
		try {
			System.out.println("데이터베이스접근");
			String driver = "com.mysql.cj.jdbc.Driver";
			String dbURL="jdbc:mysql://localhost:3306/blog";
			String dbID ="root";
			String dbPassword="1234";
			Class.forName(driver);
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}	
	}
	
	//작성일자
	public String getDate() {
		String sql="select now()";
		try {
			PreparedStatement pstmt= conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("작성일자");
				return rs.getString(1);
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		return "";//데이터베이스 오류
	}
	
	//게시글 번호 부여
	public int getNext() {
		//현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다.
		String sql="select bId from board order by bId desc";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("번호부여");
				return rs.getInt(1)+1;
			}	
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	
	public int write(String bTitle,String loginid, String bContent) {
		String sql="insert into board values(?,?,?,?,?,?,?)";
		try {
			System.out.println("글쓰기");
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bTitle);
			pstmt.setString(3, loginid);
			pstmt.setString(4,getDate());
			pstmt.setString(5, bContent);
			pstmt.setInt(6, 1);//글의 유호번호
			pstmt.setString(7, "미구현");//글의 유호번호
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	//게시글 리스트
	public ArrayList<BoardVO> getList(int pageNumber){
		String sql = "select * from board where bId < ? and bAvailable=1 order by bId desc limit 10";
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO boardVO = new BoardVO();
				boardVO.setbId(rs.getInt(1));
				boardVO.setbTitle(rs.getString(2));
				boardVO.setLoginid(rs.getString(3));
				boardVO.setbDate(rs.getString(4));
				boardVO.setbContent(rs.getString(5));
				boardVO.setbAvailable(rs.getInt(6));
				list.add(boardVO);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	//페이지 처리
	public boolean nextPage(int pageNumber) {
		String sql = "select * from board where bId < ? and bAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,getNext()-(pageNumber-1)*10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
			
		return false;
	}
	
	//게시글보기
	public BoardVO getBoardVO(int bId) {
		String sql ="select * from board where bId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				BoardVO bo = new BoardVO();
				bo.setbId(rs.getInt(1));
				bo.setbTitle(rs.getString(2));
				bo.setLoginid(rs.getString(3));
				bo.setbDate(rs.getString(4));
				bo.setbContent(rs.getString(5));
				bo.setbAvailable(rs.getInt(6));
				return bo;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	//게시글 수정 
	public int update(int bId, String bTitle, String bContent) {
		String sql = "update board set bTitle = ?, bContent = ? where bId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,bTitle);
			pstmt.setString(2, bContent);
			pstmt.setInt(3, bId);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//게시글 삭제
	public int delete(int bId) {
		//실제 데이터를 삭제하는것이 아니라 게시글 유효숫자를 0으로 수정
		String sql = "update board set bAvailable = 0 where bId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bId);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
