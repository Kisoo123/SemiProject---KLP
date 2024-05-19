<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//MemberDto m = (MemberDto) session.getAttribute("loginMember");
	MemberDto m = (MemberDto) request.getAttribute("member");
	String src = "";
	if(m.getProfileImgOriname().equals("기본프로필.png")){
		src=request.getContextPath()+"/image/member/"+m.getProfileImgOriname();
	}else{
		src=m.getProfileImgOriname();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
.myprofile-container{
	display: flex;
	width: 100%;
	height: 100vh;
}
.myProfile.main {
  position: relative;
  display: flex;
  flex-direction: column;
  background-color: white;
}
.myProfile .section1 {
  position: relative;
  display: flex;
  flex-direction: column;
}
.myProfile .flex_col {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 0px auto;
  width: 825px;
  padding: 30px;
}
.myProfile .title {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  color: black;
  text-align: center;
  letter-spacing: -0.36px;
}
.myProfile .content-container{
	padding: 15px;
}
.myProfile .content_box1 {
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
.myProfile .flex_row {
  position: relative;
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 0px 10px;
  margin: 71px auto 65px;
  width: 84.97%;
}
.myProfile .flex_col1 {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 56px 0px;
  width: 297px;
  min-width: 0px;
}

.myProfile .profile_img_container {
  border-radius: 148.5px 148.5px 148.5px 148.5px;
  border: 3px #faf0ff solid;
  width: 200px; /* 이미지 크기를 유지하기 위한 컨테이너 크기 */
  height: 200px; /* 이미지 크기를 유지하기 위한 컨테이너 크기 */
  overflow: hidden;
  position: relative;
  display: flex;
  justify-content: center; /* 수평 중앙 정렬 */
  align-items: center; /* 수직 중앙 정렬 */
}
.myProfile .profile_img {
	width: 80%;
	height: auto;
}
.myProfile .btn {
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
.myProfile .flex_col2 {
  position: relative;
  display: flex;
  flex-direction: column;
  width: 318px;
  min-width: 0px;
}
.myProfile .nickname-container{
	display: flex;
}
.myProfile #nicknameResult{
	margin-left: 10px;
}
.myProfile .nickname {
  position: relative;
  color: black;
}
.myProfile .content_box {
  position: relative;
  display: flex;
  flex-direction: column;
  margin: 8px 0px 0px;
  background-color: white;
  border-radius: 8px 8px 8px 8px;
  outline: 1px solid #e0e0e0;
  outline-offset: -1px;
}
.myProfile .highlight_box {
  position: relative;
  margin: 8px 0px 8px 16px;
  width: 45px;
}
.myProfile .highlight {
  width: 100%;
  color: black;
  background-color: transparent;
  border: 0px;
  padding: 0px;
  letter-spacing: -1px;
  vertical-align: top;
}
.myProfile .highlight:focus {
  outline: none;
}
.myProfile .introduce {
  position: relative;
  margin: 32px 0px 0px;
  color: black;
}
.myProfile .textarea_box {
  position: relative;
  margin: 8px 0px 0px;
  border-radius: 8px 8px 8px 8px;
  padding: 8px 16px 123px 16px;
  outline: 1px solid #e0e0e0;
  outline-offset: -1px;
}
.myProfile .textarea {
  width: 100%;
  color: black;
  background-color: transparent;
  border: 0px;
  padding: 0px;
  letter-spacing: -0.8px;
  vertical-align: top;
}
.myProfile .textarea:focus {
  outline: none;
}
.myProfile .favorite {
  position: relative;
  margin: 32px 0px 0px;
  color: black;
}
.myProfile .favorite1_box {
  position: relative;
  margin: 8px 0px 0px;
  min-width: 0px;
  border-radius: 8px 8px 8px 8px;
  padding: 8px 16px 8px 16px;
  outline: 1px solid #e0e0e0;
  outline-offset: -1px;
}
.myProfile .favorite1 {
  width: 100%;
  color: black;
  background-color: transparent;
  border: 0px;
  padding: 0px;
  vertical-align: top;
}
.myProfile .favorite1:focus {
  outline: none;
}
.myProfile .btn1 {
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
.myProfile .flex_row1 {
  position: relative;
  display: flex;
  gap: 0px 13px;
  margin: 84px 0px 0px;
  width: 37.09%;
}
.myProfile .highlight2 {
  position: relative;
  display: flex;
  justify-content: center;
  min-width: 0px;
  color: #828282;
  text-align: center;
}
</style>
<!-- 임시디자인 -->

<div class="myprofile-container">
<%@ include file="/WEB-INF/views/common/mypageSidebar.jsp" %>
    <main class="untitled-page main">
        <section class="myProfile">
            <div class="flex_col">
                <h1 class="title">내 프로필</h1>
                <div class="content_box1 content_box">
                    <div class="flex_row">
                        <div class="flex_col1">
                        	<div class="profile_img_container">
                            	<img class="profile_img" src="<%=src %>" alt="profile_img">
                           	</div>
                            <button class="btn btn_chane_img" id="changeImg">사진 변경</button>
                        </div>
                        <form action='<%=request.getContextPath() %>/mypage/profileupdate.do' method="post">
                       	<div class="content-container">
                       		<div class="nickname-container">
                            <h3>닉네임</h3>
                            	<h5 id="nicknameResult"></h5>
                           	</div>
                            <div class="favorite1_box">
	                            <input type="text" name="nickname" id="nickname" class="favorite1" value="<%=m.getNickname()%>">
                            </div>
                            <h3>소개</h3>
                            <div class="favorite1_box" >
	                            <textarea name="introduce" cols="55" rows="5" class="favorite1" placeholder="소개를 적어주세요 :)" style="resize: none" ><%=m.getIntroduce()%></textarea>
                            </div>
                            <h3>관심 아티스트</h3>
                            <div class="favorite1_box">
                            	<input type="text" name="favorite" class="favorite1" placeholder="아이유, 에스파">
                            </div>
                         </div>
                         <br>
	                		<button name="submit" class="btn btn_chane_img">수정</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>
<script>
	$("#changeImg").click(e=>{
		console.log('hi');
	});
	
	
	const nowNickname = '<%=m.getNickname() %>';
	$("#nickname").keyup(e=>{
		console.log(e.target.value);
		let target = e.target.value;
		//정규식 활용한 문자열 필터링
		target = target.replace(/[^a-zA-Z0-9ㄱ-ㅎ가-힣]/g, '');
		e.target.value = target;
		//빈칸 입력 방지
		if(e.target.value !== ""){
		//중복검사
		$.ajax({
			url: "<%=request.getContextPath()%>/mypage/checknickname.do",
			type: "post",
			data: {"nickname": target},
			success: data=>{
				console.dir(data);
				if(target===(nowNickname)){
					$("#nicknameResult").text("");
				}else if(data==0){
					$("#nicknameResult").text("* 사용가능한 닉네임입니다.").css("color","#c552ff");
				} else if(data!=0){
					$("#nicknameResult").text("* 이미 사용중인 닉네임입니다.").css("color","#ff5e5e");
				} 
			}
		});
		}else{
			$("#nicknameResult").text("* 변경할 닉네임을 입력해주세요").css("color","gray");
		}
	});
	
	$('#favorite1_box').click(e=>{
		window.open('<%=request.getContextPath()%>/mypage/favoriteArtist.select','_blank','width:500px height: 800px');
	});
</script>
</html>