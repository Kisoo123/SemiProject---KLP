package com.kupid.feed.model.dao;

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

import com.kupid.feed.model.dto.Feed;
import com.kupid.feed.model.dto.LikeFeed;
import com.kupid.feed.model.dto.Reply;

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

	
	public int insertLikes(Connection conn,int memberNo,int feedNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertLikes"));
			pstmt.setInt(1,memberNo);
			pstmt.setInt(2,feedNo);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int selectLikes(Connection conn,int memberNo,int feedNo) {
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectLikes"));
			pstmt.setInt(1,memberNo);
			pstmt.setInt(2,feedNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result=rs.getInt(1);

				public List<Reply> selectFeedComment(Connection conn,int feedNo){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Reply> result = new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectFeedCount"));
			pstmt.setInt(1, feedNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Reply r=getReply(rs);
				result.add(r);

			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int selectFeedLikes(Connection conn,int feedNo) {
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectFeedLikes"));
			pstmt.setInt(1,feedNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int deleteLikes(Connection conn,int memberNo,int feedNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("deleteLikes"));
			pstmt.setInt(1,memberNo);
			pstmt.setInt(2,feedNo);
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int selectSeqFeed(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int seqFeed=0;
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
		return seqFeed;
	}
	
	public int insertFeedComment(Connection conn,int loginMember,String comment,int feedNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertFeedComment"));
			System.out.println(pstmt.toString());
			pstmt.setInt(1, feedNo);
			pstmt.setString(2, comment);
			pstmt.setInt(3, loginMember);
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int insertFeedFile(Connection conn, String filePath, int seq) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertFeedFile"));
			System.out.println(pstmt.toString());
			pstmt.setInt(1, seq);
			pstmt.setString(2, filePath);
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertFeed(Connection conn, Feed f, int seq) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertFeed"));
			pstmt.setInt(1,seq);
			pstmt.setString(2,"dsads");
			pstmt.setString(3,f.getFeedContent());
			pstmt.setInt(4,f.getLikes());
			pstmt.setInt(5,f.getReport());
			
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
	public static LikeFeed getLikeFeed(ResultSet rs) throws SQLException{
		return LikeFeed.builder()
				.memberNo(rs.getInt("MEMBERNO"))
				.feedNo(rs.getInt("FEED_NO"))
				.likes(rs.getInt("LIKES"))
				.likesSwitch(rs.getInt("LIKES_SWITCH"))
				.build();		
	public static Reply getReply(ResultSet rs) throws SQLException{
		return Reply.builder()
				.replyNumber(rs.getInt("reply_number"))
				.feedNo(rs.getInt("feed_no"))
				.replyDate(rs.getDate("reply_date"))
				.likes(rs.getInt("likes"))
				.memberNo(rs.getInt("memberno"))
				.replyContent(rs.getString("reply_content"))
				.build();
	}
}
