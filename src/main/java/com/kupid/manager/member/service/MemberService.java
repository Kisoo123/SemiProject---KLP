package com.kupid.manager.member.service;

import static com.kupid.common.JDBCTemplate.close;
import static com.kupid.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kupid.manager.member.model.dao.MemberDAO;
import com.kupid.manager.notice.model.dto.Notice;
import com.kupid.member.model.dto.MemberDto;

public class MemberService {
	
	MemberDAO dao=new MemberDAO();
	
	public List<MemberDto> selectMemberAll(int cPage,int numPerpage){
		Connection conn=getConnection();
		List<MemberDto> member=dao.selectMemberAll(conn,cPage,numPerpage);
		close(conn);
		return member;
	}
	
	public int selectMemberAllCount() {
		Connection conn=getConnection();
		int result=dao.selectMemberAllCount(conn);
		close(conn);
		return result;
	}
	
}
