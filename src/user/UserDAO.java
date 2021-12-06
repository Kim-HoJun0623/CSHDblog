package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn; //�옄諛붿� �뜲�씠�꽣踰좎씠�뒪瑜� �뿰寃�
	private PreparedStatement pstmt; //荑쇰━臾� ��湲� 諛� �꽕�젙
	private ResultSet rs; //寃곌낵媛� 諛쏆븘�삤湲�
	
	//湲곕낯 �깮�꽦�옄
	//UserDAO媛� �떎�뻾�릺硫� �옄�룞�쑝濡� �깮�꽦�릺�뒗 遺�遺�
	//硫붿냼�뱶留덈떎 諛섎났�릺�뒗 肄붾뱶瑜� �씠怨녹뿉 �꽔�쑝硫� 肄붾뱶媛� 媛꾩냼�솕�맂�떎
	
	public UserDAO() {
		try {
			String dbID = "root";
			String dbPassword = "root";
			String driver = "com.mysql.cj.jdbc.Driver";
			String dbURL = "jdbc:mysql://localhost:3306/blog";
			Class.forName(driver);
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//
		public int login(String userId, String userPassword) {
			String sql = "select userPassword from user where userId = ?";
			try {
				pstmt = conn.prepareStatement(sql); //sql 荑쇰━臾몄쓣 ��湲�
				pstmt.setString(1, userId); //泥ル쾲吏� '?'�뿉 留ㅺ컻蹂��닔濡� 諛쏆븘�삩 'userId'瑜� ���엯
				rs = pstmt.executeQuery(); //荑쇰━瑜� �떎�뻾�븳 寃곌낵瑜� rs�뿉 ���옣
				if(rs.next()) {
					if(rs.getString(1).equals(userPassword)) {
						return 1; //濡쒓렇�씤 �꽦怨�
					}else
						return 0; //鍮꾨�踰덊샇 ��由�
				}
				return -1; //�븘�씠�뵒 �뾾�쓬
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -2; //�뵒鍮� �뿰寃� 臾몄젣
		}
		public int join(UserVO userVO) {
			  String sql = "insert into user(userId, userPassword, userName, userGender, userEmail) values(?, ?, ?, ?, ?)";
			  try {
			    pstmt = conn.prepareStatement(sql);
			    pstmt.setString(1, userVO.getUserId());
			    pstmt.setString(2, userVO.getUserPassword());
			    pstmt.setString(3, userVO.getUserName());
			    pstmt.setString(4, userVO.getUserGender());
			    pstmt.setString(5, userVO.getUserEmail());
			    return pstmt.executeUpdate();
			  }catch (Exception e) {
			 	e.printStackTrace();
			  }
			  return -1;
			}
}
