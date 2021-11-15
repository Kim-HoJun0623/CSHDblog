package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn; //자바와 데이터베이스를 연결
	private PreparedStatement pstmt; //쿼리문 대기 및 설정
	private ResultSet rs; //결과값 받아오기
	
	//기본 생성자
	//UserDAO가 실행되면 자동으로 생성되는 부분
	//메소드마다 반복되는 코드를 이곳에 넣으면 코드가 간소화된다
	
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
				pstmt = conn.prepareStatement(sql); //sql 쿼리문을 대기
				pstmt.setString(1, userId); //첫번째 '?'에 매개변수로 받아온 'userId'를 대입
				rs = pstmt.executeQuery(); //쿼리를 실행한 결과를 rs에 저장
				if(rs.next()) {
					if(rs.getString(1).equals(userPassword)) {
						return 1; //로그인 성공
					}else
						return 0; //비밀번호 틀림
				}
				return -1; //아이디 없음
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -2; //디비 연결 문제
		}
		public int join(UserVO userVO) {
			  String sql = "insert into user(userId, userPassword, userName, userGender, userEmail) "
			  		+ "values(?, ?, ?, ?, ?)";
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
