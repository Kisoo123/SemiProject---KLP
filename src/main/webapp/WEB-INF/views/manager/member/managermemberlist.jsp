<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.kupid.member.model.dto.MemberDto" %>
<%
	List<MemberDto> member=(List<MemberDto>)request.getAttribute("member");
	StringBuffer pagebar=(StringBuffer)request.getAttribute("pageBar");
	String searchType=request.getParameter("searchType");
	String searchKeyword=request.getParameter("searchKeyword");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
   font-family: "휴먼모음T", sans-serif; 
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

/* hover시 배경색 변경 */
ul li:hover{
   background-color: #3300ff;
}
ul li:hover > a{
   color:#FFF; /* 글자색*/
}
.member-container{
	display: flex;
	
}
.member-sec{
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
.btn{
	float: right;
}

</style>
</head>
<body>
<div class="member-container">
<%@ include file="/WEB-INF/views/manager/manageraside.jsp" %>
	<div class="member-sec">
		<h1>MEMBER</h1>
		<h1>
			<div>
				<select id="searchType">
		       		<option value="일반" <%=searchType!=null&&searchType.equals("일반")?"selected":"" %>>일반</option>
		        	<option value="굿즈" <%=searchType!=null&&searchType.equals("굿즈")?"selected":"" %>>굿즈</option>
		        	<option value="행사" <%=searchType!=null&&searchType.equals("행사")?"selected":"" %>>행사</option>
	        	</select>
	        	<div id="search-일반">
					<form action="<%=request.getContextPath()%>/manager/searchNotice.do">
						<input type="hidden" name="searchType" value="일반">
						<input type="text" name="searchKeyword" placeholder="검색할 내용을 입력하세요" style="width:300px; height:50px">
						<button type="submit" style="width:50px; height:50px">검색</button>
					</form>
				</div>
				<div id="search-굿즈">
					<form action="<%=request.getContextPath()%>/manager/searchNotice.do">
						<input type="hidden" name="searchType" value="굿즈">
						<input type="text" name="searchKeyword" placeholder="검색할 내용을 입력하세요" style="width:300px; height:50px">
						<button type="submit" style="width:50px; height:50px">검색</button>
					</form>
				</div>
				<div id="search-행사">
					<form action="<%=request.getContextPath()%>/manager/searchNotice.do">
						<input type="hidden" name="searchType" value="행사">
						<input type="text" name="searchKeyword" placeholder="검색할 내용을 입력하세요" style="width:300px; height:50px">
						<button type="submit" style="width:50px; height:50px">검색</button>
					</form>
				</div>
			</div> 
		</h1>
		<section class="section">
		<table class="table-size">
			<tr>
				<th>No</th>
				<th>이름</th>
				<th style="text-align:left;">아이디</th>
				<th>닉네임</th>
				<th>가입일</th>
				<th>멤버십</th>
				
			</tr>
			<%if(member!=null){ %>
				<%for(MemberDto m : member){ %>
				<tr>
					<td style="text-align:center;"><%=m.getMemberNo()%></td>
					<td style="text-align:center;"><%=m.getMemberName()%></td>
					<td><%=m.getMemberId()%></td>
					<td style="text-align:center;"><%=m.getNickname() %></td>
					<td style="text-align:center;"><%=m.getEnrollDate() %></td>
					<td style="text-align:center;"><input type="checkbox"></td>
					<td><button onclick="location.assign('<%=request.getContextPath()%>/manager/memberview.do?no=<%=m.getMemberNo()%>')">상세정보</button></td>
					
				</tr>
				<%} 
			}else{%>
				<span>회원이 없습니다</span>
			<%} %>
		</table>
		</section>
			<div class="btn"><button onclick="location.assign('<%=request.getContextPath()%>/manager/noticeinsert.do')">작성</button></div>
			<br><br>
			<div><%=pagebar %></div>
		</div>
	</div>
</div>

</body>
</html>