<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.List,com.kupid.member.model.dto.MemberDto" %>
<%
	List<MemberDto> artist=(List<MemberDto>)request.getAttribute("artist");
	StringBuffer pagebar=(StringBuffer)request.getAttribute("pageBar");
	String searchType=request.getParameter("searchType");
	String searchKeyword=request.getParameter("searchKeyword");
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
   font-family: "�޸ո���T", sans-serif; 
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

/* hover�� ���� ���� */
ul li:hover{
   background-color: #3300ff;
}
ul li:hover > a{
   color:#FFF; /* ���ڻ�*/
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
		<h1>
			<div> 
				<select id="searchType">
		       		<option value="group_name" <%=searchType!=null&&searchType.equals("group_name")?"selected":"" %>>�׷��</option>
		        	<option value="member_name" <%=searchType!=null&&searchType.equals("member_name")?"selected":"" %>>�̸�</option>
		        	<option value="group_company" <%=searchType!=null&&searchType.equals("group_company")?"selected":"" %>>�Ҽӻ�</option>
	        	</select>
	        	<div id="search-member_name">
					<form action="<%=request.getContextPath()%>/manager/searchArtist.do">
						<input type="hidden" name="searchType" value="member_name">
						<input type="text" name="searchKeyword" placeholder="�˻��� ������ �Է��ϼ���" style="width:300px; height:50px">
						<button type="submit" style="width:50px; height:50px">�˻�</button>
					</form>
				</div>
				<div id="search-group_name">
					<form action="<%=request.getContextPath()%>/manager/searchArtist.do">
						<input type="hidden" name="searchType" value="group_name">
						<input type="text" name="searchKeyword" placeholder="�˻��� ������ �Է��ϼ���" style="width:300px; height:50px">
						<button type="submit" style="width:50px; height:50px">�˻�</button>
					</form>
				</div>
				<div id="search-group_company">
					<form action="<%=request.getContextPath()%>/manager/searchArtist.do">
						<input type="hidden" name="searchType" value="group_company">
						<input type="text" name="searchKeyword" placeholder="�˻��� ������ �Է��ϼ���" style="width:300px; height:50px">
						<button type="submit" style="width:50px; height:50px">�˻�</button>
					</form>
				</div>
			</div> 
		</h1>
		
		<section class="section">
		<table class="table-size">
			<tr>
				<th>No</th>
				<th>�׷��</th>
				<th>�̸�</th>
				<th>�Ҽӻ�</th>
				<th>�����</th>
			</tr>
		
			<%if(artist!=null){ %>
				<%for(MemberDto m : artist){ %>
				<tr>
					<td><%=m.getMemberNo()%></td>
					<td><%=m.getGroupName()%></td>
					<td><%=m.getMemberName()%></td>
					<td><%=m.getGroupCompany()%></td>
					<td><%=m.getEnrollDate()%></td>
					<td><button onclick="location.assign('<%=request.getContextPath()%>/manager/artistupdate.do?no=<%=m.getMemberNo()%>')">������(����)</button></td>
					<td><button onclick="deleteArtist(<%=m.getMemberNo()%>);">����</button></td>
				</tr>
				<%} 
			}else{%>
				<span>��ϵ� artist�� �����ϴ�</span>
			<%} %>
		</table>
		</section>
			<div><button onclick="location.assign('<%=request.getContextPath()%>/manager/artistinsert.do')">���</button></div>
			<br><br><br>
			<div><%=pagebar%></div>
		</div>
</div>
<script>
const deleteArtist=(n)=>{
	if(confirm("���� ���� �Ͻðڽ��ϱ�?")){
		location.assign("<%=request.getContextPath()%>/manager/memberdelete.do?no="+n)
	}else{
		alert("������ ��ҵǾ����ϴ�");
	}
}

$(()=>{
	 $("#searchType").change();
})


$("#searchType").change(e=>{
		const type=e.target.value;
		$(e.target).parent().children("div").hide();
		$("#search-"+type).css("display","inline-block");
	})
</script>
</body>
</html>