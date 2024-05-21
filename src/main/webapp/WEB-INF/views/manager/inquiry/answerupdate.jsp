<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page import="com.kupid.manager.inquiry.model.dto.Inquiry,com.kupid.manager.answer.model.dto.Answer" %>
<%
	Inquiry inq=(Inquiry)request.getAttribute("inquiry");
	Answer ans=(Answer)request.getAttribute("answer");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>1:1문의 답변</h1>
		<div>
		<table>
		<tr>
			<th>No</th>
			<th>제목</th>
			<th>문의내용</th>			
			<th>작성일</th>
			<th>작성자</th>
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
        
	<form action="<%=request.getContextPath()%>/manager/answerupdateend.do?no=<%=ans.getAnswerNO()%>" method="post">
        <div>
			답변제목<input type="text" name="title" value="<%=ans.getAnswerTitle()%>" required> 
		</div>
		<div>
			답변내용<br>
			<textarea rows="10" cols="30" name="content" required><%=ans.getAnswerContent()%></textarea>	
		</div>
		<div>
		<input type="submit" value="수정">
		</div>
	</form>
</body>
</html>