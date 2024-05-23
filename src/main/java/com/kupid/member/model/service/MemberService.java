package com.kupid.member.model.service;

import static com.kupid.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kupid.member.model.dao.MemberDao;
import com.kupid.member.model.dto.MemberDto;

public class MemberService {
	private MemberDao dao = new MemberDao();
	public MemberDto selectMember(String id) {
		Connection conn = getConnection();
		MemberDto m = dao.selectMember(conn, id);
		close(conn);
		return m;
	}
	public int checkNickname(String nickname) {
		Connection conn = getConnection();
		int result = dao.checkNickname(conn, nickname);
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
