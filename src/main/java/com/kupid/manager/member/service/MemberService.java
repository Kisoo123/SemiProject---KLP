package com.kupid.manager.member.service;

import static com.kupid.common.JDBCTemplate.close;
import static com.kupid.common.JDBCTemplate.commit;
import static com.kupid.common.JDBCTemplate.getConnection;
import static com.kupid.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kupid.manager.member.model.dao.MemberDAO;
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
	
	public MemberDto selectMemberByNo(int no) {
		Connection conn=getConnection();
		MemberDto member=dao.selectMemberByNo(conn,no);
		close(conn);
		return member;
	}
	
	
	public int deleteMember(int no) {
		Connection conn=getConnection();
		int result=dao.deleteMember(conn,no);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<MemberDto> searchMember(String type,String keyword,int cPage,int numPerpage){
		Connection conn=getConnection();
		List<MemberDto> members=dao.searchMember(conn,type,keyword,cPage,numPerpage);
		close(conn);
		return members;
	}
	
	public int searchMemberCount(String type,String keyword) {
		Connection conn=getConnection();
		int count=dao.searchMemberCount(conn,type,keyword);
		close(conn);
		return count;
	}
	
	public List<MemberDto> selectSubscribeByNo(int no){
		Connection conn=getConnection();
		List<MemberDto> members=dao.selectSubscribeByNo(conn,no);
		close(conn);
		return members;
	}
	
	public List<MemberDto> selectMembershipByNo(int no){
		Connection conn=getConnection();
		List<MemberDto> members=dao.selectMembershipByNo(conn,no);
		close(conn);
		return members;
	}
	
}
