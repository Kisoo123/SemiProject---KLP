<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kupid.manager.notice.model.dto.Notice" %>    
    
<%
	Notice n=(Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>공지사항 수정</h2>
	<form action="<%=request.getContextPath()%>/manager/noticeupdateend.do">
		<div>
		번호<input type="text" name="noticeNo" value="<%=n.getNoticeNo()%>" readOnly>
		</div>
		<div>
		<select name="category" >
        		<option value="굿즈" <%=n.getNoticeCategory() !=null&&n.getNoticeCategory().equals("굿즈")?"selected":"" %>>굿즈</option>
        		<option value="일반" <%=n.getNoticeCategory()!=null&&n.getNoticeCategory().equals("일반")?"selected":"" %>>일반</option>
        		<option value="행사" <%=n.getNoticeCategory()!=null&&n.getNoticeCategory().equals("행사")?"selected":"" %>>행사</option>
        </select>
        </div>
        <div>
			제목<input type="text" name="title" value="<%=n.getNoticeTitle()%>">
		</div>
		<div>
			내용<br>
			<textarea rows="10" cols="30" name="content"><%=n.getNoticeContent()%></textarea>	
		</div>
		<div>
			<input type="submit" value="수정">
		</div>
	</form>



</body>
</html>