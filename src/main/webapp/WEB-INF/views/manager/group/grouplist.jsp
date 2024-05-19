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
   font-family: "�޸ո���T", sans-serif; 
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

/* hover�� ���� ���� */
ul li:hover{
   background-color: #3300ff;
}
ul li:hover > a{
   color:#FFF; /* ���ڻ�*/
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
				<th>�׷��</th>
				<th>�Ҽӻ�</th>
				<th>�����</th>
				<th>������</th>
				<th>����<th>
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
					<td><button onclick="">����</button></td>
					<td><button onclick="">����</button></td>
				</tr>
				<%} 
			}else{%>
				<span>��ϵ� group�� �����ϴ�</span>
			<%} %>
		</table>
			<div><button onclick="location.assign('<%=request.getContextPath()%>/manager/faqinsert.do')">�ۼ�</button></div>
			<br><br><br>
			<div><%=pagebar%></div>
		</div>
</div>

</body>
</html>