package com.kupid.mypage.service;

import static com.kupid.common.JDBCTemplate.close;
import static com.kupid.common.JDBCTemplate.commit;
import static com.kupid.common.JDBCTemplate.getConnection;
import static com.kupid.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kupid.group.model.dto.GroupDto;
import com.kupid.member.model.dto.MemberDto;
import com.kupid.mypage.dao.MyPageDao;

public class MyPageService {
	private MyPageDao dao = new MyPageDao();
	public MemberDto selectMember(String id) {
		Connection conn = getConnection();
		MemberDto m = dao.selectMember(conn, id);
		close(conn);
		return m;
	}
	public List<MemberDto> selectMemberForProfile(String id) {
		Connection conn = getConnection();
		List<MemberDto> result = dao.selectMemberForProfile(conn, id);
		close(conn);
		return result;
	}
	public List<MemberDto> selectMemberFavorite(int no) {
		Connection conn = getConnection();
		List<MemberDto> result = dao.selectMemberFavorite(conn, no);
		close(conn);
		return result;
	}
	public int checkNickname(String nickname) {
		Connection conn = getConnection();
		int result = dao.checkNickname(conn, nickname);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int updateProfile(String nickname, String introduce) {
		Connection conn = getConnection();
		int result = dao.updateProfile(conn, nickname, introduce);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
}
