<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.List,com.kupid.group.model.dto.GroupDto" %>
<%
	List<GroupDto> group=(List<GroupDto>)request.getAttribute("group");
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
.section{
	width:95%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
</style>
</head>
<body>

<div class="faq-container">
<%@ include file="/WEB-INF/views/manager/manageraside.jsp" %>
<div class="faq-sec">
		<h1>GROUP</h1>
	
		<div>
			<form action="<%=request.getContextPath()%>/manager/searchgroup.do">
							<input type="text" name="searchKeyword" placeholder="�˻��� ������ �Է��ϼ���" style="width:300px; height:50px">
							<button type="submit" style="width:50px; height:50px">�˻�</button>
			</form>
		</div>
		<section class="section">
		<table class="table-size">
			<tr>
				<th>No</th>
				<th>�׷��</th>
				<th>�Ҽӻ�</th>
				<th>�����</th>
				<th>������</th>
			</tr>
		
			<%if(group!=null){ %>
				<%for(GroupDto m : group){ %>
				<tr>
					<td><%=m.getGroupNo()%></td>
					<td><%=m.getGroupName()%></td>
					<td><%=m.getGroupCompany()%></td>
					<td><%=m.getMemberCount()%></td>
					<td><%=m.getGroupDebutday()%></td>
					<td><button onclick="location.assign('<%=request.getContextPath()%>/manager/groupupdate.do?no=<%=m.getGroupNo()%>')">����</button></td>
					<td><button onclick="deleteGroup(<%=m.getGroupNo()%>);">����</button></td>
				</tr>
				<%} 
			}else{%>
				<span>��ϵ� group�� �����ϴ�</span>
			<%} %>
		</table>
		</section>
			<div><button onclick="location.assign('<%=request.getContextPath()%>/manager/groupinsert.do')">���</button></div>
			<br><br><br>
			<div><%=pagebar%></div>
		</div>
</div>
<script>
const deleteGroup=(n)=>{
	if(confirm("���� ���� �Ͻðڽ��ϱ�?")){
		location.assign("<%=request.getContextPath()%>/manager/groupdelete.do?no="+n)
	}else{
		alert("������ ��ҵǾ����ϴ�");
	}
}
</script>
</body>
</html>