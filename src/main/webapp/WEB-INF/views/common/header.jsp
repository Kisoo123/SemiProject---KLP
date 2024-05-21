<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kupid.member.model.dto.MemberDto" %>
<script src = "<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>

<%
	MemberDto loginMember = (MemberDto) session.getAttribute("loginMember");
	Cookie[] cookies = request.getCookies();
	String saveId = null;
	for(Cookie c : cookies) {
		//쿠키에 저장된 네임과 밸류 가져오기
		if(c.getName().equals("saveid")){
			saveId = c.getValue();
		}
	}
	String servletHistory=request.getParameter("return");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="login-container">
			<%if(loginMember==null){ %>
				<form action="<%=request.getContextPath() %>/login.do" method="post">
					<table>
						<tr>
							<td>
								<input type="text" name="userId" id="userId"
								value="<%=saveId!=null?saveId:"" %>"
								placeholder="아이디입력">
							</td>
							<td></td>
						</tr>
						<tr>
							<td>
								<input type="password" name="password" id="passwod"
								placeholder="패스워드입력">
							</td>
							<td>
								<input type="submit" value="로그인" >
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="checkbox" name="saveId" 
								id="saveId" <%=saveId!=null?"checked":"" %>>
								<label for="saveId">아이디저장</label>
								<input type="button" value="회원가입"
								onclick="location.assign('<%=request.getContextPath()%>/member/enrollmember.do')">
							</td>
						</tr>
					</table>
				</form>
				<%}else{ %>
					<table id="logged-in">
						<tr>
							<td colspan="2">
								<%=loginMember.getMemberId() %>님, 방가방가. :)
							</td>
						</tr>
						<tr>
							<td>
								<input type="button" value="내정보보기"
								onclick="location.assign('<%=request.getContextPath()%>/member/memberview.do?userId=<%=loginMember.getMemberId()%>')"/>
							</td>
							<td>
								<input type="button" value="로그아웃"
								onclick="location.replace('<%=request.getContextPath()%>/logout.do')"/>
							</td>
						</tr>
					</table>
				<%} %>
			</div>
</body>
</html>