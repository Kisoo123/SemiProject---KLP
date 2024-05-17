<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	안녕하세요 12321ㅇㅈㅇㄴㅁㅇㅇㄴㄴ

	<a href="<%=request.getContextPath()%>/feed/feedView.do">피드</a>

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
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</html>