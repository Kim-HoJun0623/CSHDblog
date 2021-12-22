package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn; //占쎌쁽獄쏅뗄占� 占쎈쑓占쎌뵠占쎄숲甕곗쥙�뵠占쎈뮞�몴占� 占쎈염野껓옙
	private PreparedStatement pstmt; //�뜎�눖�봺�눧占� 占쏙옙疫뀐옙 獄쏉옙 占쎄퐬占쎌젟
	private ResultSet rs; //野껉퀗�궢揶쏉옙 獄쏆룇釉섓옙�궎疫뀐옙
	
	//疫꿸퀡�궚 占쎄문占쎄쉐占쎌쁽
	//UserDAO揶쏉옙 占쎈뼄占쎈뻬占쎈┷筌롳옙 占쎌쁽占쎈짗占쎌몵嚥∽옙 占쎄문占쎄쉐占쎈┷占쎈뮉 �겫占썽겫占�
	//筌롫뗄�꺖占쎈굡筌띾뜄�뼄 獄쏆꼶�궗占쎈┷占쎈뮉 �굜遺얜굡�몴占� 占쎌뵠�⑤끃肉� 占쎄퐫占쎌몵筌롳옙 �굜遺얜굡揶쏉옙 揶쏄쑴�꺖占쎌넅占쎈쭆占쎈뼄
	
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
				pstmt = conn.prepareStatement(sql); //sql �뜎�눖�봺�눧紐꾩뱽 占쏙옙疫뀐옙
				pstmt.setString(1, userId); //筌ｃ꺂苡뀐쭪占� '?'占쎈퓠 筌띲끆而삭퉪占쏙옙�땾嚥∽옙 獄쏆룇釉섓옙�궔 'userId'�몴占� 占쏙옙占쎌뿯
				rs = pstmt.executeQuery(); //�뜎�눖�봺�몴占� 占쎈뼄占쎈뻬占쎈립 野껉퀗�궢�몴占� rs占쎈퓠 占쏙옙占쎌삢
				if(rs.next()) {
					if(rs.getString(1).equals(userPassword)) {
						return 1; //嚥≪뮄�젃占쎌뵥 占쎄쉐�⑨옙
					}else
						return 0; //�뜮袁⑨옙甕곕뜇�깈 占쏙옙�뵳占�
				}
				return -1; //占쎈툡占쎌뵠占쎈탵 占쎈씨占쎌벉
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -2; //占쎈탵�뜮占� 占쎈염野껓옙 �눧紐꾩젫
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
