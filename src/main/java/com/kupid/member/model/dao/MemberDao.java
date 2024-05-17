package com.kupid.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kupid.member.model.dto.MemberDto;

public class MemberDao {
	private Properties sql = new Properties();
//	{
//		String path = MemberDao.class.getResource("/sql/member/sql_admin.properties").getPath();
//
//		try (FileReader fr = new FileReader(path)){
//			sql.load(fr);
//		} catch(IOException e){
//			e.printStackTrace();
//		}
//	}
	//임의 builder를 사용하는 메소드 DB가 생기면 아래 내용으로 바꾸자.
	public MemberDto selectMember(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDto m = null;	
		try {
				m= memberBuilder();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return m;
	}
//	public MemberDto selectMember(Connection conn, String id) {
//		PreparedStatement pstmt = null;
//		MemberDto m = null;
//		ResultSet rs = null;
//		try{
//			pstmt = conn.prepareStatement(sql.getProperty("selectMember"));
//			pstmt.setString(1, id);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				m = memberBuilder(rs);
//			}
//		} catch(SQLException e) {
//			e.printStackTrace();
//		}
//		return m; 
//	}
//	public static MemberDto memberBuilder(ResultSet rs) throws SQLException {
//		return MemberDto.builder()
//						.memberNo(rs.getInt("member_no"))
//						.memberPw(rs.getString("member_pw"))
//						.memberName(rs.getString("member_name"))
//						.address(rs.getString("address"))
//						.phone(rs.getString("phone"))
//						.email(rs.getString("email"))
//						.gender(rs.getString("gender"))
//						.birth(rs.getDate("birth"))
//						.introduce(rs.getString("introduce"))
//						.nickname(rs.getString("nickname"))
//						.profileImgOriginal(rs.getString("profile_img_original"))
//						.profileImgRenamed(rs.getString("profile_img_renamed"))
//						.memberGrade(rs.getString("member_grade"))
//						.enrollDate(rs.getDate("enrollDate"))
//						.build();
//	}
	//db생기기 전까진 빌더에 임의 데이터 넣음
	public static MemberDto memberBuilder() throws SQLException {
		//임의 날짜 생성
		Date birth = new Date(1234567890000L);
		Date now = new Date(System.currentTimeMillis());
		return MemberDto.builder()
						.memberNo(1)
						.memberId("qwerty")
						.memberPw("1234")
						.memberName("유저일")
						.address("경기도 어딘가")
						.phone("01033333333")
						.email("qwerty@qwert.com")
						.gender("F")
						.birth(birth)
						.introduce("안녕하세욤!!!!")
						.nickname("이것이닉네임이다")
						.profileImgOriginal("아이유셀카.jpg")
						.profileImgRenamed("")
						.memberGrade("1") //일단 임의 숫자 넣음
						.enrollDate(now)
						.build();
	}
}
