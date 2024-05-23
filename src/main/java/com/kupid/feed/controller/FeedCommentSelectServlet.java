package com.kupid.feed.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kupid.feed.model.dto.Reply;
import com.kupid.feed.model.service.FeedService;

/**
 * Servlet implementation class FeedCommentSelectServlet
 */
@WebServlet("/feed/feedcommentselect.do")
public class FeedCommentSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedCommentSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int feedNoText = Integer.parseInt(request.getParameter("feedNoText"));
		List<Reply>reply=new FeedService().selectFeedComment(feedNoText);
		
		
		response.setContentType("application/json;charset=utf-8");

		Gson gson = new Gson();
		gson.toJson(reply,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
