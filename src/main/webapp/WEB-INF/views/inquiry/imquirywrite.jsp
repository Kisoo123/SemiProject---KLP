<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="/WEB-INF/views/common/header.jsp" %>  
<style>

</style>
<section id="customer-container">
	<form action="<%=request.getContextPath()%>/inquiry/inquirywriteend.do" method="post" enctype="multipart/form-data">
	<table id="tbl-customer">
	<tr>
		<th>제 목</th>
		<td><input  class="form-control" type="text" name="title" required></td>
	</tr>
	<tr>
		<tr>
			<th>문의내용</th>
			<td><textarea class="form-control"  cols="47" rows="10" name="content" style="resize:none"></textarea>"</td>
		</tr>
		<tr>
			<th>파일 첨부</th>
			<td><input class="form-control" type="file" name="upfile"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="form-control" type="submit" value ="접속하기"  onclick="">
			</th>
		</tr>
	</table>
	</form>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>