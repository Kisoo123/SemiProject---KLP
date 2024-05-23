<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>공지사항 작성</h1>
	<form action="<%=request.getContextPath()%>/manager/noticeinsertend.do">
		<div>
			<select name="category" >
	        		<option value="굿즈" >굿즈</option>
	        		<option value="일반" >일반</option>
	        		<option value="행사" >행사</option>
	        </select>
        </div>
        <div>
			제목<input type="text" name="title">
		</div>
		<div>
			내용<br>
			<textarea rows="10" cols="30" name="content"></textarea>	
		</div>
		<div>
		<input type="submit" value="등록">
		</div>
	</form>
</body>
</html>