<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page import="com.kupid.manager.inquiry.model.dto.Inquiry" %>
<%
	Inquiry inq=(Inquiry)request.getAttribute("inquiry");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>1:1���� �亯</h1>
		<div>
		<table>
		<tr>
			<th>No</th>
			<th>����</th>
			<th>���ǳ���</th>			
			<th>�ۼ���</th>
			<th>�ۼ���</th>
		</tr>
			<tr>
				<td><%=inq.getInqNo()%></td>
				<td><%=inq.getInqTitle()%></td>
				<td><%=inq.getInqContent()%></td>
				<td><%=inq.getInqDate()%></td>
				<td><%=inq.getWriter()%></td>
			</tr>
	</table>
        </div>
        
	<form action="<%=request.getContextPath()%>/manager/answerinsertend.do?no=<%=inq.getInqNo()%>" method="post">
        <div>
			�亯����<input type="text" name="title" required>
		</div>
		<div>
			�亯����<br>
			<textarea rows="10" cols="30" name="content" required></textarea>	
		</div>
		<div>
		<input type="submit" value="���">
		</div>
	</form>
</body>
</html>