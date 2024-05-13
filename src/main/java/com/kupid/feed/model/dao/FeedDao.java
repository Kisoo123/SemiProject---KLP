package com.kupid.feed.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kupid.feed.model.dto.Feed;
import static com.kupid.common.JDBCTemplate.close;

public class FeedDao {
	
	private Properties sql = new Properties();
	{
		String path=FeedDao.class.getResource("/sql/feed/sql_feed.properties").getPath();
		try(FileReader fr=new FileReader(path)) {
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public int insertFeed(Connection conn, Feed f) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertFeed"));
			pstmt.setString(1,"dsads");
			pstmt.setString(2,f.getFeedContent());
			pstmt.setInt(3,f.getLikes());
			pstmt.setInt(4,f.getReport());
			
			result = pstmt.executeUpdate();
			System.out.println(result);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
				
	}
}
