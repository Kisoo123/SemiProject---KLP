package com.kupid.feed.model.service;

import static com.kupid.common.JDBCTemplate.getConnection;
import static com.kupid.common.JDBCTemplate.close;
import static com.kupid.common.JDBCTemplate.commit;
import static com.kupid.common.JDBCTemplate.rollback;

import java.io.File;
import java.sql.Connection;
import java.util.Iterator;
import java.util.List;

import com.kupid.feed.model.dao.FeedDao;
import com.kupid.feed.model.dto.Feed;
public class FeedService {
	private FeedDao dao = new FeedDao();
	
	
	
	public int insertProcess(Feed f, List<String> filePath) {
		Connection conn = getConnection();
		int seq = dao.selectSeqFeed(conn);
		int result = dao.insertFeed(conn,f,seq);
		Iterator<String>iter = filePath.iterator();
		
		while(iter.hasNext()) {
			String nextPath = iter.next();
			System.out.println(nextPath);
			result = dao.insertFeedFile(conn,nextPath,seq);
			
			if(result==0) {
				File delFile=new File(nextPath);
				if(delFile.exists()) delFile.delete();
			}
			if(result>0) commit(conn);
		      else rollback(conn);
		}
		return result;
	}
	
//	public int insertFeed(Feed f,int seq){
//		Connection conn = getConnection();
//		int result = dao.insertFeed(conn,f,seq);
//		close(conn);
//		return result;
//	}
//	
	public List<Feed> selectFeedAll(int cPage,int numPerpage){
		Connection conn=getConnection();
		List<Feed> result=dao.selectFeedAll(conn,cPage,numPerpage);
		close(conn);
		return result;
	}
	
	public int selectFeedCount() {
		Connection conn = getConnection();
		int result = dao.selectFeedCount(conn);
		close(conn);
		return result;
		
	}
//	public int insertFile(String filePath) {
//		Connection conn = getConnection();
//		int result = dao.insertFile(conn,filePath);
//		close(conn);
//		return result;
//	}
	
	
}
