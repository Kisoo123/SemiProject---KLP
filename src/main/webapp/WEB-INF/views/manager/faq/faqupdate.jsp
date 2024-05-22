<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kupid.manager.faq.model.dto.Faq" %>    
<%
	Faq f=(Faq)request.getAttribute("faq");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faq수정</title>
</head>
<body>

<h2>FAQ 수정</h2>
	<form action="<%=request.getContextPath()%>/manager/faqupdateend.do">
		<div>
		번호<input type="text" name="faqNo" value="<%=f.getFaqNo()%>" readOnly>
		</div>
		<div>
		<select name="category" >
        		<option value="회원" <%=f.getFaqCategory() !=null&&f.getFaqCategory().equals("회원")?"selected":"" %>>회원</option>
        		<option value="상점" <%=f.getFaqCategory()!=null&&f.getFaqCategory().equals("상점")?"selected":"" %>>상점</option>
        		<option value="커뮤니티" <%=f.getFaqCategory()!=null&&f.getFaqCategory().equals("커뮤니티")?"selected":"" %>>커뮤니티</option>
        </select>
        </div>
        <div>
			제목<input type="text" name="title" value="<%=f.getFaqTitle()%>">
		</div>
		<div>
			내용<br>
			<textarea rows="10" cols="30" name="content"><%=f.getFaqContent()%></textarea>	
		</div>
		<div>
			<input type="submit" value="수정">
		</div>
	</form>

</body>
</html>