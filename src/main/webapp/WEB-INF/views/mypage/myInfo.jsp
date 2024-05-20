<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//MemberDto m = (MemberDto) session.getAttribute("loginMember"); 
	MemberDto m = (MemberDto) request.getAttribute("member"); 
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
}
.myInfo.main {
  position: relative;
  display: flex;
  flex-direction: column;
  background-color: white;
  width: auto;
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
  padding: 30px 70px 30px 70px;
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
  border-radius: 8px;
  padding: 8px 8px 8px 8px;
}
.myInfo .btn2 {
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
  width: 90%;
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
  border-radius: 8px 8px 8px 8px;
  padding: 8px 16px 8px 16px;
  outline: 1px solid #e0e0e0;
  outline-offset: -1px;
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
.myInfo .flex_row1 {
  position: relative;
  display: flex;
  gap: 0px 13px;
  margin: 84px 0px 0px;
  width: 37.09%;
}
.myInfo .address-search{
	display: flex;
	gap: 15px;
	align-items: center; /* 수직 중앙 정렬 */
	justify-content: space-between;
}
</style>
<!-- 임시디자인 -->

<div class="myInfo-container">
<%@ include file="/WEB-INF/views/common/mypageSidebar.jsp" %>
    <main class="main">
        <section class="myInfo">
            <div class="flex_col">
                <h1 class="title">개인정보 수정</h1>
                <div class="content_box">
                    <div class="flex_row">
                        <form action="" method="post">
                       	<div class="content-container">
                            <h3>이름</h3>
                            <div class="input_box">
	                            <input type="text" class="inputTag" value="<%=m.getMemberName()%>">
                            </div>
                            <h3>아이디</h3>
                            <div class="input_box">
	                            <input type="text" class="inputTag" value="<%=m.getMemberId()%>" readOnly>
                            </div>
                            <h3>비밀번호</h3>
                            <p>4~20글자 / 영문, 숫자 사용가능</p>
                            <div class="input_box">
	                            <input type="password" class="inputTag" placeholder="현재 비밀번호 입력">
                            </div>
                            <div class="input_box">
	                            <input type="password" class="inputTag" placeholder="변경할 비밀번호 입력">
                            </div>
                            <div class="input_box">
	                            <input type="password" class="inputTag" placeholder="비밀번호 확인">
                            </div>
                            <h3>연락처</h3>
                            <div class="input_box">
	                            <input type="text" class="inputTag" value="<%=m.getPhone()%>">
                            </div>
                            <h3>이메일</h3>
                            <div class="input_box">
	                            <input type="text" class="inputTag" value="<%=m.getEmail()%>">
                            </div>
                            <div class="address-search">
                            	<h3>주소</h3>
                            	<button class="btn2" onclick="">주소 검색</button>
                           	</div>
                            <div class="input_box">
                            	<input type="text" class="inputTag" value="<%if(m.getAddress() != null) %><%=m.getAddress()%>">
                            </div>
                            <div class="input_box">
                            	<input type="text" class="inputTag" placeholder="상세주소 입력"  value="<%if(m.getAddressDetail() != null) %><%=m.getAddressDetail()%>">
                            </div>
                        	 <br>
	                		<button name="submit" class="btn">수정</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>
</html>