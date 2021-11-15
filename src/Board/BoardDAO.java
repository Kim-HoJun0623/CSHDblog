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
	
	//�⺻ ������
	public BoardDAO() {
		try {
			System.out.println("�����ͺ��̽�����");
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
	
	//�ۼ�����
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
	
	//�Խñ� ��ȣ �ο�
	public int getNext() {
		//���� �Խñ��� ������������ ��ȸ�Ͽ� ���� ������ ���� ��ȣ�� ���Ѵ�.
		String sql="select bId from board order by bId desc";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("��ȣ�ο�");
				return rs.getInt(1)+1;
			}	
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//�����ͺ��̽� ����
	}
	
	public int write(String bTitle,String loginid, String bContent) {
		String sql="insert into board values(?,?,?,?,?,?,?)";
		try {
			System.out.println("�۾���");
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bTitle);
			pstmt.setString(3, loginid);
			pstmt.setString(4,getDate());
			pstmt.setString(5, bContent);
			pstmt.setInt(6, 1);//���� ��ȣ��ȣ
			pstmt.setString(7, "�̱���");//���� ��ȣ��ȣ
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	//�Խñ� ����Ʈ
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
	//������ ó��
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
	
	//�Խñۺ���
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
	//�Խñ� ���� 
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
	
	//�Խñ� ����
	public int delete(int bId) {
		//���� �����͸� �����ϴ°��� �ƴ϶� �Խñ� ��ȿ���ڸ� 0���� ����
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
