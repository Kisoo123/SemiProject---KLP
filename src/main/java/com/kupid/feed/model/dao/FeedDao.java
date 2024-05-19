package com.kupid.feed.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kupid.feed.model.dto.Feed;

import static com.kupid.common.JDBCTemplate.close;

public class FeedDao {
	
	private Properties sql = new Properties();
	{
		String path=FeedDao.class.getResource("/sql/sql_feed.properties").getPath();
		try(FileReader fr=new FileReader(path)) {
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public int insertFeed(Connection conn, Feed f,String filePath) {
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int result = 0;
		int seqFeed=0;
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertFeed"));
			pstmt.setString(1,"dsads");
			pstmt.setString(2,f.getFeedContent());
			pstmt.setInt(3,f.getLikes());
			pstmt.setInt(4,f.getReport());
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectSeqFeed"));
			rs=pstmt.executeQuery();
			rs.next();
			seqFeed=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertFeedFile"));
			pstmt.setInt(1, seqFeed);
			pstmt.setString(2, filePath);
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
				
	}
	
	
//	public int insertFile(Connection conn,String filePath ) {
//		PreparedStatement pstmt = null;
//		int result = 0;
//		
//		
//		try {
//			pstmt = conn.prepareStatement(sql.getProperty("insertFeedFile"));
//			pstmt.setString(1, filePath);
//			result = pstmt.executeUpdate();
//			
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(pstmt);
//		}
//		return result;
//	}
	
	public int selectFeedCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectFeedCount"));
			rs=pstmt.executeQuery();
			rs.next();
			result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public List<Feed> selectFeedAll(Connection conn,int cPage,int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Feed> result=new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectFeedAll"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Feed f=getFeed(rs);
				result.add(f);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	public static Feed getFeed(ResultSet rs) throws SQLException{
		return Feed.builder()
				.feedNo(rs.getInt("FEED_NO"))
				.feedMemberName(rs.getString("MEMBER_NO"))
				.feedWriterName(rs.getString("WRITER_NAME"))
				.feedContent(rs.getString("CONTENT"))
				.feedWriteDate(rs.getDate("WRITEDATE"))
				.feedUpdateDate(rs.getDate("UPDATEDATE"))
				.likes(rs.getInt("LIKES"))
				.report(rs.getInt("REPORT"))
				.filePath(rs.getString("FILE_PATH"))
				.build();
	}
}
