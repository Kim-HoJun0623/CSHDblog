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
//			System.out.println("�����ͺ��̽�����");
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
				System.out.println("�ۼ�����");
				return rs.getString(1);
			}
			
		}catch (Exception e){
			e.printStackTrace();
		}
		return "";//�����ͺ��̽� ����
	}
	
	public int getNext() {
		//���� �Խñ��� ������������ ��ȸ�Ͽ� ���� ������ ���� ��ȣ�� ���Ѵ�.
		String sql="select cId from comment order by cId desc";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("��ȣ�ο�"+rs.getInt(1)+1);
				return rs.getInt(1)+1;
			}	
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//�����ͺ��̽� ����
	}
	
	public int write(String cmContent,String userId,int bId) {
		String sql="insert into comment values(?,?,?,?,?)";
		try {
//			System.out.println("�۾���");
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
		return -1; //�����ͺ��̽� ����
	}
	
	
	public ArrayList<CommentVO> getList(int bId){
		String sql = "select * from comment where bId = ?  order by bId desc limit 10";
		System.out.println("����Ʈ���");
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
	
	public CommentVO getComment(int cId) {//�ϳ��� ��� ������ �ҷ����� �Լ�
		String SQL="SELECT * from comment where cId = ?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, cId);
			rs=pstmt.executeQuery();//select
			if(rs.next()) {//����� �ִٸ�
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
