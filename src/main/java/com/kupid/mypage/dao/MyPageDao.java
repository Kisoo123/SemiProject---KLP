package com.kupid.mypage.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kupid.group.model.dto.GroupDto;
import com.kupid.member.model.dto.MemberDto;

public class MyPageDao {
	private Properties sql = new Properties();
	{
		String path = MyPageDao.class.getResource("/sql/member/mypage.properties").getPath();

		try (FileReader fr = new FileReader(path)){
			sql.load(fr);
		} catch(IOException e){
			e.printStackTrace();
		}
	}
	public MemberDto selectMember(Connection conn, String id) {
		PreparedStatement pstmt = null;
		MemberDto m = null;
		ResultSet rs = null;
		try{
			pstmt = conn.prepareStatement(sql.getProperty("selectMember"));
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m = memberBuilder(rs);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return m; 
	}
	//확장형 builder를 이용
	public List<MemberDto> selectMemberForProfile(Connection conn, String id) {
		PreparedStatement pstmt = null;
		List<MemberDto> result = new ArrayList<>();
		ResultSet rs = null;
		try{
			pstmt = conn.prepareStatement(sql.getProperty("selectMemberForProfile"));
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result.add((MemberDto)profileBuilder(rs));
			}
			System.out.println(result.size());
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return result; 
	}
	public List<MemberDto> selectMemberFavorite(Connection conn, int no) {
		PreparedStatement pstmt = null;
		List<MemberDto> m = new ArrayList<>();
		ResultSet rs = null;
		try{
			pstmt = conn.prepareStatement(sql.getProperty("selectMemberFavorite"));
//			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				m.add(favoriteGroupBuilder(rs));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return m; 
	}
	//닉네임 중복 조회: count(*)
	public int checkNickname(Connection conn, String nickname) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result =0;
		try{
			pstmt = conn.prepareStatement(sql.getProperty("checkNickname"));
			pstmt.setString(1, nickname);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("result");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return result; 
	}
	public int updateProfile(Connection conn,int no, String nickname, String introduce) {
		PreparedStatement pstmt = null;
		int result =0;
		try{
			pstmt = conn.prepareStatement(sql.getProperty("updateProfile"));
			pstmt.setString(1, nickname);
			pstmt.setString(2, introduce);
			pstmt.setInt(3, no);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return result; 
	}
	public int updateProfileImg(Connection conn,int no, String img) {
		PreparedStatement pstmt = null;
		int result =0;
		try{
			pstmt = conn.prepareStatement(sql.getProperty("updateProfileImg"));
			pstmt.setString(1, img);
			pstmt.setInt(2, no);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return result; 
	}
	public int deleteProfileImg(Connection conn,int no) {
		PreparedStatement pstmt = null;
		int result =0;
		try{
			pstmt = conn.prepareStatement(sql.getProperty("deleteProfileImg"));
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return result; 
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
	public static MemberDto profileBuilder(ResultSet rs) throws SQLException {
		return MemberDto.builder()
				.memberNo(rs.getInt("member_no"))
				.memberId(rs.getString("member_id"))
				.introduce(rs.getString("introduce"))
				.nickname(rs.getString("nickname"))
				.profileImgOriname(rs.getString("profile_img_oriname"))
				.groupNo(rs.getInt("group_no"))
				.groupName(rs.getString("group_name"))
				.groupImg(rs.getString("group_Img"))
				//.profileImgRenamed(rs.getString("profile_img_renamed"))
				.build();
	}
	public static MemberDto favoriteGroupBuilder(ResultSet rs) throws SQLException {
		return MemberDto.builder()
				.memberNo(rs.getInt("member_no"))
				.memberId(rs.getString("member_id"))
				.groupName(rs.getString("group_name"))
				.groupImg(rs.getString("group_img"))
				.build();
	}
	//임의 builder를 사용하는 메소드
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
