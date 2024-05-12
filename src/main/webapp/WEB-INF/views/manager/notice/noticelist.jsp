<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.kupid.manager.notice.model.dto.Notice" %>
<%
	List<Notice> notices=(List<Notice>)request.getAttribute("notice");
	StringBuffer pagebar=(StringBuffer)request.getAttribute("pageBar");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul{
   /* width:80%; */
   display:table;
   padding:0px;
   margin:auto;
}
ul li { 
   list-style-type: none; 
   width: 8em; 
   height: 2em;
   float: left; 
   text-align: center; 
   font-family: "휴먼모음T", sans-serif; 
   border-left: 1px #00bcd4 solid;
   background-color: #5283de; 
}
ul li:last-of-type{border-right:1px #00bcd4 solid;;}
ul li a {
   display: block;
   padding:.5em;
   text-decoration: none;
   color: #292929;
}

/* hover시 배경색 변경 */
ul li:hover{
   background-color: #3300ff;
}
ul li:hover > a{
   color:#FFF; /* 글자색*/
}
</style>
</head>
<body>
	<h1>공지사항</h1>
	<table>
		<tr>
			<th>No</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
	
		<%if(notices!=null){ %>
			<%for(Notice n : notices){ %>
			<tr>
				<td><%=n.getNoticeNo()%></td>
				<td><%=n.getNoticeCategory()%></td>
				<td><%=n.getNoticeTitle() %></td>
				<td><%=n.getNoticeDate() %></td>
				<td><button onclick="location.assign('<%=request.getContextPath()%>/manager/noticeupdate.do?no=<%=n.getNoticeNo()%>')">수정</button></td>
			</tr>
			<%} 
		}else{%>
			<span>공지사항이 없습니다</span>
		<%} %>
	</table>
		<div><button onclick="location.assign('<%=request.getContextPath()%>/manager/noticeinsert.do')">작성</button></div>
		<br><br><br>
		<div><%=pagebar %></div>
	
</body>
</html>