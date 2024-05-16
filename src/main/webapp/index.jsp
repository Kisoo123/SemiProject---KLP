<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<button onclick="location.assign('<%=request.getContextPath()%>/report/reportList.do')">신고내역</button>
	</div>
	<br><br><br>
	<div>
		<button onclick="location.assign('<%=request.getContextPath()%>/manager/noticelist.do')">공지사항</button>
	</div>
	<div>
		<button onclick="">아티스트</button>
	</div>
	<div>
		<button onclick="location.assign('<%=request.getContextPath()%>/manager/faqlist.do')">faq</button>
	</div>
	<div>
		<button onclick="location.assign('<%=request.getContextPath()%>/mypage/myprofile.do')">마이페이지</button>
	</div>
	<div>
		<button onclick="location.assign('<%=request.getContextPath()%>/manager/home.do')">관리자페이지</button>
	</div>
</body>
</html>