<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kupid.group.model.dto.GroupDto" %>      
<%
	GroupDto g=(GroupDto)request.getAttribute("group");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>GROUP 수정</h1>
	<form action="<%=request.getContextPath()%>/manager/groupupdateend.do?no=<%=g.getGroupNo()%>" method="post">
        <div>
			그룹명<input type="text" name="name" value="<%=g.getGroupName()%>">
		</div>
		<div>
			맴버수<input type="number" name="count" value="<%=g.getMemberCount()%>">
		</div>
		<div>
			소속사<input type="text" name="company" value="<%=g.getGroupCompany()%>">
		</div>
		<div>
			사진<input type="text" name="img" value="<%=g.getGroupImg()%>">
		</div>
		<div>
			<input type="submit" value="수정">
		</div>
	</form>
	
</body>
</html>