package board;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class BoardDAO {
	private Connection conn;
	private ResultSet rs;
	

	//占썩본 占쏙옙占쏙옙占쏙옙
	public BoardDAO() {
		try {
//			System.out.println("占쏙옙占쏙옙占싶븝옙占싱쏙옙占쏙옙占쏙옙");
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
	

	//占쌜쇽옙占쏙옙占쏙옙

	public String getDate() {
		String sql="select now()";
		try {
			PreparedStatement pstmt= conn.prepareStatement(sql);

			rs=pstmt.executeQuery();
			if(rs.next()) {
//				System.out.println("占쌜쇽옙占쏙옙占쏙옙");
				return rs.getString(1);
			}
			
		}catch (Exception e){
			e.printStackTrace();
		}
		return "";//占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占�
	}
	
	//占쌉시깍옙 占쏙옙호 占싸울옙
	public int getNext() {
		//占쏙옙占쏙옙 占쌉시깍옙占� 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占싫몌옙臼占� 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙호占쏙옙 占쏙옙占싼댐옙.

		String sql="select bId from board order by bId desc";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {

//				System.out.println("占쏙옙호占싸울옙");

				return rs.getInt(1)+1;
			}	
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}

		return -1;//占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占�
	}
	
	public int write(String bTitle,String userId, String bContent,String filename) {
		String sql="insert into board values(?,?,?,?,?,?,?)";
		try {
//			System.out.println("占쌜억옙占쏙옙");
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bTitle);
			pstmt.setString(3, userId);
			pstmt.setString(4,getDate());
			pstmt.setString(5, bContent);
			pstmt.setInt(6, 1);//占쏙옙占쏙옙 占싫ｏ옙占싫�
			pstmt.setString(7, filename);//占쏙옙占쏙옙占싱몌옙

			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}

		return -1; //占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占�
	}
	
	//占쌉시깍옙 占쏙옙占쏙옙트

	public ArrayList<BoardVO> getList(int pageNumber){
		String sql = "select * from board where bId < ? and bAvailable=1 order by bId desc limit 4";
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
//			System.out.println(pageNumber);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext()-(pageNumber-1)*4);
//			System.out.println(getNext()-(pageNumber-1)*4);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO boardVO = new BoardVO();
				boardVO.setbId(rs.getInt(1));
				boardVO.setbTitle(rs.getString(2));
				boardVO.setuserId(rs.getString(3));
				boardVO.setbDate(rs.getString(4));
				boardVO.setbContent(rs.getString(5));
				boardVO.setbAvailable(rs.getInt(6));
				boardVO.setbimage(rs.getString(8));
				list.add(boardVO);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	public ArrayList<BoardVO> GalleryList(int pageNumber){//pageNumber 를 분류 번호로 바꿔야한다.
		String sql = "select bimage from board where bId < ? and bAvailable=1 order by bId desc ";
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
//			System.out.println(pageNumber);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
//			System.out.println(getNext()-(pageNumber-1)*4);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO boardVO = new BoardVO();
				boardVO.setbimage(rs.getString(1));
				list.add(boardVO);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	//占쏙옙占쏙옙占쏙옙 처占쏙옙

	public boolean nextPage(int pageNumber) {
		String sql = "select * from board where bId < ? and bAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,getNext()-(pageNumber-1)*4);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
			
		return false;
	}
	

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
				bo.setuserId(rs.getString(3));
				bo.setbDate(rs.getString(4));
				bo.setbContent(rs.getString(5));
				bo.setbAvailable(rs.getInt(6));
				int bcount = rs.getInt(7);
				bo.setBcount(bcount);
				bcount++;
				countUpdate(bcount,bId);
				bo.setbimage(rs.getString(8));
				return bo;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	//占쌉시깍옙 占쏙옙占� 
	public int update(int bId, String bTitle, String bContent, String filename) {
		String sql = "update board set bTitle = ?, bContent = ?, bimage = ? where bId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,bTitle);
			pstmt.setString(2, bContent);
			pstmt.setString(3, filename);
			pstmt.setInt(4, bId);
			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	

	//占쌉시깍옙 占쏙옙占�
	public int delete(int bId) {
		//占쏙옙占� 占쏙옙占쏙옙占싶몌옙 占쏙옙占쏙옙求째占쏙옙占� 占싣니띰옙 占쌉시깍옙 占싫울옙占쏙옙美占� 0占쏙옙占� 占쏙옙占�
		String sql = "delete from board where bId = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bId);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int countUpdate(int bcount, int bId) {
		String sql = "update board set bcount = ? where bId = ?";
		try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bcount);
				pstmt.setInt(2, bId);
				return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
