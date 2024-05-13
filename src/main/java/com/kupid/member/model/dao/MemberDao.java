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
		String path = MemberDao.class.getResource("/sql/member/sql_admin.properties").getPath();

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
	public static MemberDto memberBuilder(ResultSet rs) throws SQLException {
		return MemberDto.builder()
						.memberNo(rs.getInt("member_no"))
						.memberPw(rs.getString("member_pw"))
						.memberName(rs.getString("member_name"))
						.address(rs.getString("address"))
						.phone(rs.getString("phone"))
						.email(rs.getString("email"))
						.gender(rs.getString("gender"))
						.birth(rs.getDate("birth"))
						.introduce(rs.getString("introduce"))
						.nickname(rs.getString("nickname"))
						.profileImgOrigianl(rs.getString("profile_img_original"))
						.profileImgRenamed(rs.getString("profile_img_renamed"))
						.memberGrade(rs.getString("member_grade"))
						.enrollDate(rs.getDate("enrollDate"))
						.build();
	}
}
