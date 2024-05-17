package com.kupid.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kupid.member.model.dto.MemberDto;

public class MemberDao {
	private Properties sql = new Properties();
	{
		String path = MemberDao.class.getResource("/sql/member/member.properties").getPath();

		try (FileReader fr = new FileReader(path)){
			sql.load(fr);
		} catch(IOException e){
			e.printStackTrace();
		}
	}
	//임의 builder를 사용하는 메소드 DB가 생기면 아래 내용으로 바꾸자.
//	public MemberDto selectMember(Connection conn, String id) {
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		MemberDto m = null;	
//		try {
//				m= memberBuilder();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		return m;
//	}
	public MemberDto selectMember(Connection conn, String id) {
		PreparedStatement pstmt = null;
		MemberDto m = null;
		ResultSet rs = null;
		try{
			pstmt = conn.prepareStatement(sql.getProperty("selectMember"));
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("rs.next");
				m = memberBuilder(rs);
				System.out.println(m.toString());
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return m; 
	}
	public static MemberDto memberBuilder(ResultSet rs) throws SQLException {
		return MemberDto.builder()
						.memberNo(rs.getInt("member_no"))
						.memberId(rs.getString("member_id"))
						.memberPw(rs.getString("member_pw"))
						.memberName(rs.getString("member_name"))
						.gender(rs.getString("gender"))
						.phone(rs.getString("phone"))
						.address(rs.getString("address"))
						.addressDetail(rs.getString("address_detail"))
						.email(rs.getString("email"))
						.birth(rs.getDate("birth"))
						.introduce(rs.getString("introduce"))
						.nickname(rs.getString("nickname"))
						.profileImgOriname(rs.getString("profile_img_oriname"))
						//.profileImgRenamed(rs.getString("profile_img_renamed"))
						.memberGrade(rs.getString("member_grade"))
						.enrollDate(rs.getDate("enroll_date"))
						.build();
	}
	//db생기기 전 사용한 빌더
//	public static MemberDto memberBuilder() throws SQLException {
//		//임의 날짜 생성
//		Date birth = new Date(1234567890000L);
//		Date now = new Date(System.currentTimeMillis());
//		return MemberDto.builder()
//						.memberNo(1)
//						.memberId("qwerty")
//						.memberPw("1234")
//						.memberName("유저일")
//						.address("경기도 어딘가")
//						.phone("01033333333")
//						.email("qwerty@qwert.com")
//						.gender("F")
//						.birth(birth)
//						.introduce("안녕하세욤!!!!")
//						.nickname("이것이닉네임이다")
//						.profileImgOriname("아이유셀카.jpg")
//						.profileImgRenamed("")
//						.memberGrade("1") //일단 임의 숫자 넣음
//						.enrollDate(now)
//						.build();
//	}
}
