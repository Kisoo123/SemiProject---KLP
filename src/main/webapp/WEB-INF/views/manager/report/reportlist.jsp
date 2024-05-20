<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.kupid.manager.report.model.dto.Report" %>    
<%
	List<Report> report=(List<Report>)request.getAttribute("report");
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
<%@ include file="/WEB-INF/views/common/mypageSidebar.jsp" %>
	<h1>신고 내역</h1>
	<table>
		<tr>
			<th>신고번호</th>
			<th>카테고리</th>
			<th>신고내용</th>
			<th>신고날짜</th>
			<th>신고레벨</th>
		</tr>
	
		<%if(report!=null){ %>
			<%for(Report rp : report){ %>
			<tr>
				<td><%=rp.getReportNo() %></td>
				<td><%=rp.getReportCategory()%></td>
				<td><%=rp.getReportContent() %></td>
				<td><%=rp.getReportDate() %></td>
				<td><%=rp.getReportLevel() %></td>
				<td><button>???</button></td>
			</tr>
			<%} 
		}else{%>
			<span>신고내역이 없습니다</span>
		<%} %>
	</table>
		<div><%=pagebar %></div>
	
</body>
</html>