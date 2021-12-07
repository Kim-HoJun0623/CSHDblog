package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CommentDAO {
	private Connection conn;
	private ResultSet rs;
	
	public CommentDAO() {
		try {
//			System.out.println("데이터베이스접근");
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
	
	public int getNext() {
		//현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다.
		String sql="select cId from comment order by cId desc";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("번호부여"+rs.getInt(1)+1);
				return rs.getInt(1)+1;
			}	
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	
	public int write(String cmContent,String userId,int bId) {
		String sql="insert into comment values(?,?,?,?,?)";
		try {
//			System.out.println("글쓰기");
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cmContent);
			pstmt.setInt(2, getNext());
			pstmt.setString(3,userId);
			pstmt.setString(4, getDate());
			pstmt.setInt(5, bId);
		
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	
	public ArrayList<CommentVO> getList(int bId){
		String sql = "select * from comment where bId = ?  order by bId desc limit 10";
		System.out.println("리스트출력");
		ArrayList<CommentVO> list = new ArrayList<CommentVO>();
		try {		
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,bId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				CommentVO commentVO = new CommentVO();
				commentVO.setCmContent(rs.getString(1));
				commentVO.setcId(rs.getInt(2));
				commentVO.setUserId(rs.getString(3));
				commentVO.setcDate(rs.getString(4));
				commentVO.setBid(rs.getInt(5));
				list.add(commentVO);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	public int update(int bId,int cId,String cmContent) {
		String sql="update comment set cmContent = ? where bId = ? and cId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cmContent);
			pstmt.setInt(2, bId);
			pstmt.setInt(3, cId);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int delete(int cId) {
		String sql = "delete from comment where cId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cId);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public CommentVO getComment(int cId) {//하나의 댓글 내용을 불러오는 함수
		String SQL="SELECT * from comment where cId = ?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, cId);
			rs=pstmt.executeQuery();//select
			if(rs.next()) {//결과가 있다면
				CommentVO commentVO = new CommentVO();
				commentVO.setCmContent(rs.getString(1));
				commentVO.setcId(rs.getInt(2));
				commentVO.setUserId(rs.getString(3));
				commentVO.setcDate(rs.getString(4));
				commentVO.setBid(rs.getInt(5));
				return commentVO;
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
