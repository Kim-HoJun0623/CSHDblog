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
//			System.out.println("�뜲�씠�꽣踰좎씠�뒪�젒洹�");
			String driver = "com.mysql.cj.jdbc.Driver";
			String dbURL="jdbc:mysql://localhost:3306/blog";
			String dbID ="root";
			String dbPassword="root";
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
				return rs.getString(1);
			}
			
		}catch (Exception e){
			e.printStackTrace();
		}
		return "";//�뜲�씠�꽣踰좎씠�뒪 �삤瑜�
	}
	
	
	
	public int write(String cmContent,String userId,int bId) {
		String sql="insert into comment values(?,?,?,?,?,?)";
		try {
//			System.out.println("湲��벐湲�");
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cmContent);
			pstmt.setInt(2, getNext(bId));
			pstmt.setString(3,userId);
			pstmt.setString(4, getDate());
			pstmt.setInt(5, bId);
			pstmt.setInt(6, getNext(bId));
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	public int getNext(int bId) {
		
		String sql="select number from comment where bId=? order by number desc";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bId);
			rs = pstmt.executeQuery();
			if(rs.next()) {

				//System.out.println(rs.getInt(1));
				
				return rs.getInt(1)+1;
			}	
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}

		return -1;
	}
	public int getNext() {
		

		String sql="select cId from comment  order by cId desc";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {

				//System.out.println(rs.getInt(1));
				
				return rs.getInt(1)+1;
			}	
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}

		return -1;
	}
	public ArrayList<CommentVO> getList(int number,int bId){
		String sql = "select * from comment where number < ? and bId = ?  order by bId desc limit 10";
		//System.out.println("由ъ뒪�듃異쒕젰");
		ArrayList<CommentVO> list = new ArrayList<CommentVO>();
		try {		
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext(bId)-(number-1)*10);
			/*
			 * System.out.println(getNext(bId));
			 * System.out.println(getNext(bId)-(number-1)*10);
			 */
			pstmt.setInt(2,bId);
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
	public int commentcount(int bId) {
		String sql="select count(*) from comment where bId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bId);
			rs=pstmt.executeQuery();
			if(rs.next()) {//寃곌낵媛� �엳�떎硫�
				int count=rs.getInt(1);
				return count;
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int update(int bId,int cId,String cmContent) {
		String sql="update comment set cmContent = ?, cDate = ? where bId = ? and cId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cmContent);
			pstmt.setString(2, getDate());
			pstmt.setInt(3, bId);
			pstmt.setInt(4, cId);
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
	
	public CommentVO getComment(int cId) {//�븯�굹�쓽 �뙎湲� �궡�슜�쓣 遺덈윭�삤�뒗 �븿�닔
		String SQL="SELECT * from comment where cId = ?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, cId);
			rs=pstmt.executeQuery();//select
			if(rs.next()) {//寃곌낵媛� �엳�떎硫�
				CommentVO commentVO = new CommentVO();
				commentVO.setCmContent(rs.getString(1));
				//System.out.println(rs.getString(1));
				commentVO.setcId(rs.getInt(2));
				commentVO.setUserId(rs.getString(3));
				commentVO.setcDate(rs.getString(4));
				commentVO.setBid(rs.getInt(5));
				commentVO.setNumber(rs.getInt(6));
				return commentVO;
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
