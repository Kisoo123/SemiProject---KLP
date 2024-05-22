package com.kupid.manager.report.model.dao;

import static com.kupid.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kupid.manager.report.model.dto.Report;


public class ReportDAO {
	Properties sql=new Properties();
	
	{
		String path=ReportDAO.class.getResource("/sql/sql_report.properties").getPath();
		try(FileReader fr=new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	
	
	
	public List<Report> selectReportAll(Connection conn,int cPage,int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Report> report=new ArrayList<Report>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectReportAll"));
			pstmt.setInt(1,(cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				report.add(getReport(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return report;
	}
	
	public int selectReportAllCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectReportAllCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}
	
//	public List<Report> selectReporting(Connection conn) {
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//		List<Report> report=new ArrayList<Report>();
//		try {
//			pstmt=conn.prepareStatement(sql.getProperty("selectReporting"));
//			rs=pstmt.executeQuery();
//			while(rs.next()) {
//				report.add(Report.builder().reportingId(rs.getString("member_id")).build());
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(pstmt);
//			close(rs);
//		}
//		System.out.println(report);
//		return report;
//	}
	
	
	public static Report getReport(ResultSet rs) throws SQLException {
		return Report.builder()
				.reportNo(rs.getInt("report_no"))
				.reportCategory(rs.getString("report_category"))
				.reportContent(rs.getString("report_content"))
				.reportDate(rs.getDate("report_date"))
				.reportingMember(rs.getInt("reporting_member"))//신고한 회원
				.reportedMember(rs.getInt("reported_member"))//신고받은 회원
				.reportResource(rs.getString("report_resource"))
				.reportedId(rs.getString(10))//인덱스 번호 10 신고받은 회원
				.reportingId(rs.getString(11))//인덱스 번호 11 신고한 회원
				.build();
	}
	
}
