package com.kupid.mypage.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kupid.member.model.dto.MemberDto;
import com.kupid.mypage.service.MyPageService;

/**
 * Servlet implementation class MyProfileServlet
 */
@WebServlet("/mypage/myinfo.do")
public class MyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyInfoServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int no = Integer.parseInt(request.getAttribute("no"));
//		String id = (String) request.getAttribute("loginMember");
//		MemberDto m = new MemberService().selectMember(id);
		request.setAttribute("pagenum", 2);
		//해당 아이디의 멤버를 가져오는 메소드
		MemberDto m = new MyPageService().selectMember("admin");
		request.setAttribute("member", m);
		request.getRequestDispatcher("/WEB-INF/views/mypage/myInfo.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
