<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kupid.member.model.dto.MemberDto" %>    
<%  
	MemberDto m = (MemberDto) request.getAttribute("artist"); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
.myInfo-container{
	display: flex;
	width: 100%;
	height: 100vh;
}
.myInfo.main {
  position: relative;
  display: flex;
  flex-direction: column;
  background-color: white;
  width: 100%;
}
.myInfo .section1 {
  position: relative;
  display: flex;
  flex-direction: column;
}
.myInfo .flex_col {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 0px auto;
  width: 100%;
  min-width: 700px;
  padding: 30px;
}
.myInfo .title {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  color: black;
  text-align: center;
  letter-spacing: -0.36px;
}
.myInfo .content-container{
	padding: 15px;
	margin-bottom: 10px;
	min-width: 400px;
}
.myInfo .content_box1 {
  position: relative;
  display: flex;
  flex-direction: column;
  margin: 49.5px 0px 0px;
  width: 100%;
  background: var(--src) center center/100% 100% no-repeat;
  border-radius: 59px 59px 59px 59px;
  outline: 1px solid #d1ade3;
  outline-offset: -1px;
}
.myInfo .flex_row {
  position: relative;
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 0px 10px;
  margin: 0px auto;
}
.myInfo .btn {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 0px auto;
  width: 83px;
  max-width: 100%;
  color: black;
  text-align: center;
  background-color: #d1ade3;
  border-radius: 8px 8px 8px 8px;
  padding: 8px 8px 8px 8px;
  letter-spacing: -0.9px;
}
.myInfo .flex_col2 {
  position: relative;
  display: flex;
  flex-direction: column;
  width: 318px;
  min-width: 0px;
}
.myInfo .nickname {
  position: relative;
  color: black;
}
.myInfo .content_box {
  position: relative;
  display: flex;
  flex-direction: column;
  margin: 8px 0px 0px;
  background-color: white;
  border-radius: 8px 8px 8px 8px;
  outline: 1px solid #e0e0e0;
  outline-offset: -1px;
}
.myInfo .highlight_box {
  position: relative;
  margin: 8px 0px 8px 16px;
  width: 45px;
}
.myInfo .highlight {
  width: 100%;
  font: 500 16px/1.5 "Inter", Helvetica, Arial, serif;
  color: black;
  background-color: transparent;
  border: 0px;
  padding: 0px;
  letter-spacing: -1px;
  vertical-align: top;
}
.myInfo .highlight:focus {
  outline: none;
}
.myInfo .introduce {
  position: relative;
  margin: 32px 0px 0px;
  color: black;
}
.myInfo .textarea_box {
  position: relative;
  margin: 8px 0px 0px;
  border-radius: 8px 8px 8px 8px;
  padding: 8px 16px 123px 16px;
  outline: 1px solid #e0e0e0;
  outline-offset: -1px;
}
.myInfo .textarea {
  width: 100%;
  color: black;
  background-color: transparent;
  border: 0px;
  padding: 0px;
  letter-spacing: -0.8px;
  vertical-align: top;
}
.myInfo .textarea:focus {
  outline: none;
}
.myInfo .favorite {
  position: relative;
  margin: 32px 0px 0px;
  color: black;
}
.myInfo .input_box {
  position: relative;
  margin: 8px 0px 0px;
  min-width: 0px;
  height:30px;
  padding :10px;
  border-radius: 8px 8px 8px 8px;
  outline: 1px solid #e0e0e0;
  outline-offset: -1px;
}
.input_box p{
	margin-top:2px;
}
.myInfo .inputTag {
  width: 100%;
  color: black;
  background-color: transparent;
  border: 0px;
  padding: 0px;
  vertical-align: top;
}
.myInfo .inputTag:focus {
  outline: none;
}
.myInfo .btn1 {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 40px auto 0px;
  width: 62px;
  max-width: 100%;
  color: black;
  text-align: center;
  background-color: #d1ade3;
  border-radius: 8px 8px 8px 8px;
  padding: 8px 16px 8px 16px;
  letter-spacing: -1px;
}
.myInfo .flex_row1 {
  position: relative;
  display: flex;
  gap: 0px 13px;
  margin: 84px 0px 0px;
  width: 37.09%;
}
</style>
<!-- 임시디자인 -->

<div class="myInfo-container">
<%@ include file="/WEB-INF/views/manager/manageraside.jsp" %>
    <main class="main">
        <section class="myInfo">
            <div class="flex_col">
                <h1 class="title">개인정보</h1>
                <div class="content_box1 content_box">
                    <div class="flex_row">
                        
                       	<div class="content-container">
                       		<h3><img src="<%=request.getContextPath()%>/image/member/<%=m.getProfileImgOriname()%>" width=150px height=150px></h3>                 
                            <h3>이름</h3>
                            <div class="input_box">
	                            <p><%=m.getMemberName() %></p>
                            </div>
                            <h3>아이디</h3>
                            <div class="input_box">
	                           <p><%=m.getMemberId() %></p>
                            </div>
                             <h3>닉네임</h3>
                            <div class="input_box">
	                           <p><%=m.getNickname() %></p>
                            </div>
                             <h3>생일</h3>
                            <div class="input_box">
	                           <p><%=m.getBirth() %></p>
                            </div>
                            <h3>성별</h3>
                            <div class="input_box">
	                           <p><%=m.getGender() %></p>
                            </div>
                            <h3>연락처</h3>
                            <div class="input_box">
	                            <p><%=m.getPhone() %></p>
                            </div>
                            <h3>이메일</h3>
                            <div class="input_box">
	                            <p><%=m.getEmail() %></p>
                            </div>
                            <h3>주소</h3>
                            <div class="input_box">
                            	<p><%=m.getAddress() %> <%=m.getAddressDetail()%></p>
                            </div>
                             <h3>가입일</h3>
                            <div class="input_box">
                            	<p><%=m.getEnrollDate() %></p>
                            </div>
                        	 <br>
	                		<button class="btn btn_chane_img" onclick="deleteMember(<%=m.getMemberNo()%>);">회원삭제</button>
                        </div>
          
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>
<script>
	const deleteMember=(n)=>{
		if(confirm("정말 삭제 하시겠습니까?")){
			location.assign("<%=request.getContextPath()%>/manager/memberdelete.do?no="+n);
		}else{
			alert("삭제가 취소되었습니다");
		}
	}
</script>


</html>