package com.kupid.feed.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kupid.feed.model.dto.Feed;
import com.kupid.feed.model.service.FeedService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class FeedWriteServlet
 */
@WebServlet("/feed/feedWrite.do")
public class FeedWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//파일업로드 경로
				String path=getServletContext().getRealPath("/upload/feed");
				File dir=new File(path);
				if(!dir.exists()) dir.mkdirs();
				
				//인코딩 방식
				String encode="UTF-8";
				
				//파일크기
				int maxSize=1024*1024*650;
				
				//리네임 규칙 설정하기
				DefaultFileRenamePolicy dfrp=new DefaultFileRenamePolicy();
				
				//멀티파트 리퀘스트 객체 만들기
				MultipartRequest mr=new MultipartRequest(request,path,maxSize,encode,dfrp);
				
				//나머지 정보를 가져오기
				String writer=mr.getParameter("writer");
				String content=mr.getParameter("content");
				//원본파일명
				String oriname=mr.getOriginalFileName("upfile");
				//리네임파일명
				String rename=mr.getFilesystemName("upfile");
				System.out.println(mr.getFilesystemName("upfile"));
				String filePath = request.getContextPath()+"/upload/feed"+"/"+rename;
				
				
				Enumeration<String> formNames = mr.getFileNames();
				
				while(formNames.hasMoreElements()) {					
					System.out.println(formNames.nextElement());
				}
				


				Feed f = Feed.builder()
						.feedWriterName(writer)
						.feedContent(content)
						.filePath(rename)
						.build();
				
				int result=new FeedService().insertFeed(f,filePath);
//				int fileResult = new FeedService().insertFile(filePath);
				
				if(result==0) {
					File delFile=new File(filePath);
					if(delFile.exists()) delFile.delete();
				}
				request.getRequestDispatcher("/feed/feedwriteend.do").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
