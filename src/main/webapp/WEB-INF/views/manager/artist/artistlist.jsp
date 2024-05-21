<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.List,com.kupid.member.model.dto.MemberDto" %>
<%
	List<MemberDto> artist=(List<MemberDto>)request.getAttribute("artist");
	StringBuffer pagebar=(StringBuffer)request.getAttribute("pageBar");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
.faq-container{
	display:flex;
}
.faq-sec{
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
</style>
</head>
<body>

<div class="faq-container">
<%@ include file="/WEB-INF/views/manager/manageraside.jsp" %>
<div class="faq-sec">
		<h1>ARTIST</h1>
	
		<div>
			<form action="<%=request.getContextPath()%>/manager/searchartist.do">
							<input type="text" name="searchKeyword" placeholder="검색할 내용을 입력하세요" style="width:300px; height:50px">
							<button type="submit" style="width:50px; height:50px">검색</button>
			</form>
		</div>
		<section class="section">
		<table class="table-size">
			<tr>
				<th>No</th>
				<th>그룹명</th>
				<th>멤버명</th>
				<th>소속사</th>
				<th>등록일</th>
			</tr>
		
			<%if(artist!=null){ %>
				<%for(MemberDto m : artist){ %>
				<tr>
					<td><%=m.getMemberNo()%></td>
					<td><%=m.getGroupName()%></td>
					<td><%=m.getMemberName()%></td>
					<td><%=m.getGroupCompany()%></td>
					<td><%=m.getEnrollDate()%></td>
					<td><button onclick="location.assign('<%=request.getContextPath()%>/manager/artistupdate.do?no=<%=m.getGroupNo()%>')">수정</button></td>
					<td><button onclick="deleteArtist(<%=m.getMemberNo()%>);">삭제</button></td>
				</tr>
				<%} 
			}else{%>
				<span>등록된 artist가 없습니다</span>
			<%} %>
		</table>
		</section>
			<div><button onclick="location.assign('<%=request.getContextPath()%>/manager/artistinsert.do')">등록</button></div>
			<br><br><br>
			<div><%=pagebar%></div>
		</div>
</div>
<script>
const deleteArtist=(n)=>{
	if(confirm("정말 삭제 하시겠습니까?")){
		location.assign("<%=request.getContextPath()%>/manager/memberdelete.do?no="+n)
	}else{
		alert("삭제가 취소되었습니다");
	}
}
</script>
</body>
</html>