package com.kupid.feed.model.service;

import static com.kupid.common.JDBCTemplate.getConnection;
import static com.kupid.common.JDBCTemplate.close;

import java.sql.Connection;

import com.kupid.feed.model.dao.FeedDao;
import com.kupid.feed.model.dto.Feed;
public class FeedService {
	private FeedDao dao = new FeedDao();
	public int insertFeed(Feed f){
		Connection conn = getConnection();
		int result = dao.insertFeed(conn,f);
		close(conn);
		return result;
	}
}
