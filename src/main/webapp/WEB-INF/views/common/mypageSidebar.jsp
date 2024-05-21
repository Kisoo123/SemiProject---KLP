<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kupid.member.model.dto.MemberDto" %>
<%	
	int pagenum = 0;
	if((Integer) request.getAttribute("pagenum")!=null){
		pagenum=(Integer) request.getAttribute("pagenum");
	}
%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- 임시디자인 -->
<style>
.sidebar-container{
	min-width: 300px;
	margin : 0px;
	background-color: #faf0ff;
}
.sidebar-container .flex_col {
  width : 90%;
  position: relative;
  display: flex;
  flex-direction: column;
  gap: 12px 0px;
  margin: 24px 8px 718px;
  /* border : 1px solid black; */
}
.sidebar-container .flex_col1 {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 22px 0px;
  /* border : 1px solid black; */
}
.sidebar-container .flex_row {
  position: relative;
  display: flex;
  justify-content: space-between;
  gap: 0px 10px;
  width: 90%;
}
.sidebar-container .subtitle {
  position: relative;
  display: flex;
  align-items: center;
  margin: 0px 0px 2px;
  min-width: 0px;
  color: black;
  letter-spacing: -0.2px;
}
.sidebar-container .btn {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  min-width: 75px;
  color: black;
  text-align: center;
  background-color: #e9bcff;
  border-radius: 8px;
  padding: 4px 8px 4px 8px;
  border: none;
  height: 30px;
}
.sidebar-container .flex_col2 {
  position: relative;
  display: flex;
  flex-direction: column;
  gap: 4px 0px;
  width: 100%;
  /* border : 1px solid black; */
}
.sidebar-container .btn1 {
  position: relative;
  display: flex;
  align-items: center;
  gap: 0px 14px;
  background-color: #d1ade3;
  border-radius: 8px;
  padding: 8px 16px 8px 16px;
  height: 50px;
  /* border: none; */
}
.sidebar-container .btn2 {
  position: relative;
  display: flex;
  align-items: center;
  gap: 0px 16px;
  background-color: #faf0ff;
  border-radius: 8px 8px 8px 8px;
  padding: 8px 16px 8px 16px;
  height: 50px;
  /* border: none; */
}
.sidebar-container .btn_icon1 {
  position: relative;
  margin: 2px 0px;
  width: 22px;
  min-width: 0px;
  height: 20px;
}
.sidebar-container .flex_col3 {
  position: relative;
  display: flex;
  flex-direction: column;
  gap: 20px 0px;
  margin: 0px 0px 0px 16px;
  width: 92px;
}
.sidebar-container .flex_row1 {
  position: relative;
  display: flex;
  gap: 0px 16px;
}
.sidebar-container .highlight {
  position: relative;
  display: flex;
  align-items: center;
  min-width: 0px;
  color: black;
}
</style>

<div class="sidebar-container">
	 <div class="flex_col">
	     <div class="flex_col1">
	         <div class="flex_row">
	             <h3 class="subtitle">My KUPID</h3>
	             <button class="btn">로그아웃</button>
	         </div>
	     </div>
	     <div class="flex_col2">
	         <button class="<%=pagenum==1?"btn1":"btn2" %>" onclick="location.assign('<%=request.getContextPath()%>/mypage/myprofile.do?pagenum=1')">
	             <h3>프로필</h3>
	         </button>
	         <button class="<%=pagenum==2?"btn1":"btn2"%>" onclick="location.assign('<%=request.getContextPath()%>/mypage/myinfo.do?pagenum=2')">
	                <h3>개인정보</h3>
	            </button>
	            <button class="<%=pagenum==3?"btn1":"btn2"%>" onclick="location.assign('<%=request.getContextPath()%>/mypage/myact.do?pagenum=3')">
	                <h3>내 활동</h3>
	            </button>
	            <button class="<%=pagenum==4?"btn1":"btn2"%>" onclick="location.assign('<%=request.getContextPath()%>/mypage/myqna.do?pagenum=4')">
	                <h3>내 문의</h3>
	            </button>
	       </div>
	</div>
</div>
