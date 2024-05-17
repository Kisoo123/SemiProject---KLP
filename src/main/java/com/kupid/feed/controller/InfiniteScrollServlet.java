package com.kupid.feed.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.kupid.feed.model.dto.Feed;
import com.kupid.feed.model.service.FeedService;

/**
 * Servlet implementation class InfiniteScrollServlet
 */
@WebServlet("/feed/InfiniteScroll.do")
public class InfiniteScrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfiniteScrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage=1;

		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {}
		
		int numPerpage=10;
		try {
			numPerpage=Integer.parseInt(request.getParameter("numPerpage"));			
		}catch(NumberFormatException e) {}
		
		List<Feed> feeds=new FeedService().selectFeedAll(cPage,numPerpage);
		
//		String body =
//			"""
//				[
//	               {
//	                   'username': 'alice',
//	                   'postContent': 'Just had an amazing breakfast!',
//	                   'timestamp': '2024-05-15T08:00:00Z'
//	               },
//	               {
//	                   'username': 'bob',
//	                   'postContent': 'Loving the sunny weather today.',
//	                   'timestamp': '2024-05-15T10:30:00Z'
//	               },
//	               {
//	                   'username': 'charlie',
//	                   'postContent': 'Had a great time at the park.',
//	                   'timestamp': '2024-05-15T12:45:00Z'
//	               }
//               ]
//			""";
		
			int totalData=new FeedService().selectFeedCount();
			
	           
			JSONArray jsonRequest = new JSONArray(feeds);

			JSONArray jsonResponse = new JSONArray();
           
           for (int i = 0; i < jsonRequest.length(); i++) {
               JSONObject feed = jsonRequest.getJSONObject(i);
	           int feedNo = feed.getInt("feedNo");
	           String feedMemberName = feed.getString("feedMemberName");
	           String feedWriterName = feed.getString("feedWriterName");
	           String feedWriteDate= feed.getString("feedWriteDate");
	           String feedUpdateDate = feed.getString("feedUpdateDate");
	           String feedContent = feed.getString("feedContent");
	           int likes =feed.getInt("likes");
	           int report = feed.getInt("report");

               JSONObject jsonFeed = new JSONObject();
               jsonFeed.put("feedNo", feedNo);
               jsonFeed.put("feedMemberName", feedMemberName);
               jsonFeed.put("feedWriterName", feedWriterName);
               jsonFeed.put("feedWriteDate", feedWriteDate);
               jsonFeed.put("feedUpdateDate", feedUpdateDate);
               jsonFeed.put("feedContent", feedContent);
               jsonFeed.put("likes", likes);
               jsonFeed.put("report", report);

               jsonResponse.put(jsonFeed);
           }
           

           // 응답 설정
           response.setContentType("application/json");
           response.setCharacterEncoding("UTF-8");

           // JSON 응답 전송
           PrintWriter out = response.getWriter();
           out.print(jsonResponse.toString());
           out.flush();
           
//       		PrintWriter out = response.getWriter();
//           	request.setAttribute("feeds", jsonResponse.toString());
//   			request.getRequestDispatcher("/views/feedViewHtml.jsp").forward(request, response);
//   			out.flush();
       }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
