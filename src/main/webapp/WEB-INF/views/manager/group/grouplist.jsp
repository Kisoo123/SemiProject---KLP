<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.List,com.kupid.member.model.dto.MemberDto" %>
<%
	List<MemberDto> member=(List<MemberDto>)request.getAttribute("member");
	StringBuffer pagebar=(StringBuffer)request.getAttribute("pageBar");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
.faq-container{
	display:flex;
}
.faq-sec{
	width:85%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
.table-size{
	width:85%;
	height:650px;
	font-size:30px;
	border :1px solid blue;
}
.top-categry{
	display:flex;
	border :1px solid blue;
	width:100%;
}
</style>
</head>
<body>

<div class="faq-container">
<%@ include file="/WEB-INF/views/manager/manageraside.jsp" %>
<div class="faq-sec">
	<div class="top-categry">
		<h1>FAQ</h1>
	</div>
		<table class="table-size">
			<tr>
				<th>No</th>
				<th>그룹명</th>
				<th>소속사</th>
				<th>멤버수</th>
				<th>데뷔일</th>
				<th>사진<th>
			</tr>
		
			<%if(member!=null){ %>
				<%for(MemberDto m : member){ %>
				<tr>
					<td><%=m.getGroupNo()%></td>
					<td><%=m.getGroupName()%></td>
					<td><%=m.getGroupCompany()%></td>
					<td><%=m.getMemberCount()%></td>
					<td><%=m.getGroupDebutday()%></td>
					<td><%=m.getGroupImg()%></td>
					<td><button onclick="">수정</button></td>
					<td><button onclick="">삭제</button></td>
				</tr>
				<%} 
			}else{%>
				<span>등록된 group가 없습니다</span>
			<%} %>
		</table>
			<div><button onclick="location.assign('<%=request.getContextPath()%>/manager/faqinsert.do')">작성</button></div>
			<br><br><br>
			<div><%=pagebar%></div>
		</div>
</div>

</body>
</html>