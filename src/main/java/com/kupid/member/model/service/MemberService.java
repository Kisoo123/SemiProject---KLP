package com.kupid.member.model.service;

import static com.kupid.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kupid.member.model.dao.MemberDao;
import com.kupid.member.model.dto.MemberDto;


public class MemberService {
	private MemberDao dao = new MemberDao();
	public MemberDto selectMemberById(String userId,String password) {
		Connection conn=getConnection();
		MemberDto m=dao.selectMemberById(conn, userId);
		if(m==null||!m.getMemberPw().equals(password)) m=null;
		
		close(conn);
		return m;
	}
	
}
