<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>GROUP 등록</h1>
	<form action="<%=request.getContextPath()%>/manager/groupinsertend.do">
        <div>
			그룹명<input type="text" name="name" required>
		</div>
		<div>
			맴버수<input type="number" name="count" required>
		</div>
		<div>
			데뷔일<input type="date" name="debutday" required>
		</div>
		<div>
			소속사<input type="text" name="company" required>
		</div>
		<div>
			사진<input type="text" name="img">
		</div>
		<div>
			<input type="submit" value="등록">
		</div>
	</form>
</body>
</html>