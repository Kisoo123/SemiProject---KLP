package com.kupid.member.model.dao;

import static com.kupid.common.JDBCTemplate.close;

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
	
	public MemberDto selectMemberById(Connection conn, String userId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberDto m=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectMemberById"));
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) m=memberBuilder(rs);
			System.out.println(rs.getString("member_pw")+"daasd");
			System.out.println(m.getMemberPw());
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}
		
	public static MemberDto memberBuilder(ResultSet rs) throws SQLException {
//		String email,phone,addressDetail,address,memberPw;
//					try {
//						email=AESEncryptor.decryptData(rs.getString("email"));
//					}catch(Exception e) {
//						email=rs.getString("email");
//					}
//					try {
//						email=AESEncryptor.decryptData(rs.getString("address"));
//					}catch(Exception e) {
//						email=rs.getString("address");
//					}
//					try {
//						memberPw=AESEncryptor.decryptData(rs.getString("member_pw"));
//					}catch(Exception e) {
//						memberPw=rs.getString("MEMBER_PW");
//					}
//					
//					try {
//						phone=AESEncryptor.decryptData(rs.getString("phone"));
//					}catch(Exception e) {
//						phone=rs.getString("phone");
//					}
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
}