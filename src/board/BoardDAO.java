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
	


	public BoardDAO() {
		try {

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
		return "";
	}
	
	public int getNext() {
		

		String sql="select bId from board order by bId desc";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {

				System.out.println(rs.getInt(1));

				return rs.getInt(1)+1;
			}	
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}

		return -1;//�뜝�룞�삕�뜝�룞�삕�뜝�떢釉앹삕�뜝�떛�룞�삕 �뜝�룞�삕�뜝占�
	}
	
	public int write(String bTitle,String userId, String bContent,String filename,String category) {
		String sql="insert into board(bId,bTitle,userId,bDate,bContent,bAvailable,bcount,bimage,bcategory) values(?,?,?,?,?,?,?,?,?)";
		try {
//			System.out.println("�뜝�뙗�뼲�삕�뜝�룞�삕");
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bTitle);
			pstmt.setString(3, userId);
			pstmt.setString(4,getDate());
			pstmt.setString(5, bContent);
			pstmt.setInt(6, 1);
			pstmt.setInt(7, 0);
			pstmt.setString(8, filename);
			pstmt.setString(9, category);

			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}

		return -1; 
	}
	
	

	public ArrayList<BoardVO> getList(int pageNumber,String userId){
		String sql = "select * from board where bId < ? and userId=? order by bId desc";
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, userId);
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
	public ArrayList<BoardVO> GalleryList(String bcategory){//pageNumber 瑜� 遺꾨쪟 踰덊샇濡� 諛붽퓭�빞�븳�떎.
		String sql = "select bId,bimage from board where bId < ? and bAvailable=1 and bcategory like ? order by bId desc ";
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, '%'+bcategory+'%');
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO boardVO = new BoardVO();
				boardVO.setbId(rs.getInt(1));
				boardVO.setbimage(rs.getString(2));
				list.add(boardVO);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	//�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 泥섇뜝�룞�삕

	/*
	 * public boolean nextPage(int pageNumber) { String sql =
	 * "select * from board where bId < ? and bAvailable = 1"; try {
	 * PreparedStatement pstmt = conn.prepareStatement(sql);
	 * pstmt.setInt(1,getNext()-(pageNumber-1)*4); rs = pstmt.executeQuery();
	 * if(rs.next()) { return true; } }catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return false; }
	 */
	public int PageList(String userId) {
		int pageNumber=0;
		String sql = "select count(*) from board where userId=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pageNumber=rs.getInt(1);
				return pageNumber;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
			
		return pageNumber;
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
				bo.setBcategory(rs.getString(9));
				return bo;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public String imageprint(int bId) {
		String sql ="select substr(bimage,instr(bimage,'.')+1) from board where bId = ?";
		String str;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				str=rs.getString(1);
				return str;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	//�뜝�뙃�떆源띿삕 �뜝�룞�삕�뜝占� 
	public int update(int bId, String bTitle, String bContent, String filename,String bcategory) {
		String sql = "update board set bTitle = ?, bContent = ?, bimage = ?, bcategory=? where bId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,bTitle);
			pstmt.setString(2, bContent);
			pstmt.setString(3, filename);
			pstmt.setString(4, bcategory);
			pstmt.setInt(5, bId);
			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	

	//�뜝�뙃�떆源띿삕 �뜝�룞�삕�뜝占�
	public int delete(int bId) {
		//�뜝�룞�삕�뜝占� �뜝�룞�삕�뜝�룞�삕�뜝�떢紐뚯삕 �뜝�룞�삕�뜝�룞�삕黎귥㎏�뜝�룞�삕�뜝占� �뜝�떍�땲�씛�삕 �뜝�뙃�떆源띿삕 �뜝�떕�슱�삕�뜝�룞�삕獰롥뜝占� 0�뜝�룞�삕�뜝占� �뜝�룞�삕�뜝占�
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
	
	public ArrayList<BoardVO> getSearach(String searchField, String searchText){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		String sql = "select * from board where " + searchField.trim();
		try {
			if(searchText != null && !searchText.equals("") ){//�씠嫄� 鍮쇰㈃ �븞 �굹�삩�떎�뀥 �솢吏�?
                sql +=" LIKE '%"+searchText.trim()+"%' order by bId desc limit 10";
                
            }
			if(searchField.equals("0")) {
				sql = "select * from board where bTitle like '%" + searchText.trim() + "%' or userId like"
						+ " '%" + searchText.trim() + "%' order by bId desc limit 10";
			}
			//System.out.println(sql);
            PreparedStatement pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();//select
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
}
