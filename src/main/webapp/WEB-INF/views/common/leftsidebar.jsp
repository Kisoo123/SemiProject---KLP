<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<!--  This source code is exported from pxCode, you can get more document from https://www.pxcode.io  -->
<style>
.sidebar-container.root {
  position: relative;
  display: flex;
  flex-direction: column;
  background-color: #faf0ff;
  overflow: hidden;
}
.sidebar-container .flex_col {
  width : 35%;
  position: relative;
  display: flex;
  flex-direction: column;
  gap: 12px 0px;
  margin: 24px 8px 718px;
}
.sidebar-container .flex_col1 {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 22px 0px;
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
  font: 600 20px/1.5 "Inter", Helvetica, Arial, serif;
  color: black;
  letter-spacing: -0.2px;
}
.sidebar-container .btn {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  min-width: 75px;
  font: 500 16px/1.5 "Inter", Helvetica, Arial, serif;
  color: black;
  text-align: center;
  background-color: #e9bcff;
  border-radius: 8px 8px 8px 8px;
  padding: 4px 8px 4px 8px;
  letter-spacing: -1.3px;
}
.sidebar-container .flex_col2 {
  position: relative;
  display: flex;
  flex-direction: column;
  gap: 4px 0px;
  width: 100%;
}
.sidebar-container .btn1 {
  position: relative;
  display: flex;
  align-items: center;
  gap: 0px 14px;
  background-color: #d1ade3;
  border-radius: 8px 8px 8px 8px;
  padding: 8px 16px 8px 16px;
}
.sidebar-container .btn_icon {
  position: relative;
  width: 24px;
  min-width: 0px;
  height: 24px;
}
.sidebar-container .btn_text {
  position: relative;
  display: flex;
  align-items: center;
  min-width: 0px;
  font: 400 16px/1.5 "Inter", Helvetica, Arial, serif;
  color: black;
}
.sidebar-container .btn2 {
  position: relative;
  display: flex;
  align-items: center;
  gap: 0px 16px;
  background-color: #faf0ff;
  border-radius: 8px 8px 8px 8px;
  padding: 8px 16px 8px 16px;
}
.sidebar-container .btn_icon1 {
  position: relative;
  margin: 2px 0px;
  width: 22px;
  min-width: 0px;
  height: 20px;
}
.sidebar-container .btn_text1 {
  position: relative;
  display: flex;
  align-items: center;
  min-width: 0px;
  font: 500 16px/1.5 "Inter", Helvetica, Arial, serif;
  color: black;
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
.sidebar-container .image5 {
  position: relative;
  width: 21px;
  min-width: 0px;
  height: 24px;
}
.sidebar-container .highlight {
  position: relative;
  display: flex;
  align-items: center;
  min-width: 0px;
  font: 400 16px/1.5 "Inter", Helvetica, Arial, serif;
  color: black;
}
.sidebar-container .image8 {
  position: relative;
  margin: 3px 0px;
  width: 23px;
  min-width: 0px;
  height: 18px;
}
</style>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

   <!--  <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous" />

    <link rel="stylesheet" type="text/css" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
    <link rel="stylesheet" type="text/css" href="./css/common.css" />
    <link rel="stylesheet" type="text/css" href="./css/fonts.css" />
    <link rel="stylesheet" type="text/css" href="./css/UntitledPage.css" />
    <script type="text/javascript" src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script type="text/javascript" src="https://unpkg.com/sticky-js@1.3.0/dist/sticky.min.js"></script>
    <script type="text/javascript" src="https://unpkg.com/headroom.js@0.12.0/dist/headroom.min.js"></script> -->



</head>
    <div class="sidebar-container">
        <div class="flex_col">
            <div class="flex_col1">
                <div class="flex_row">
                    <h3 class="subtitle">My KUPID</h3>
                    <button class="btn">로그아웃</button>
                </div>
            </div>
            <div class="flex_col2">
                <button class="btn1">
                    <h5 class="btn_text">프로필</h5>
                </button>
                <button class="btn2">
                    <h5 class="btn_text1">개인정보</h5>
                </button>
                <button class="btn2">
                    <h5 class="btn_text1">내 활동</h5>
                </button>
                <button class="btn2">
                    <h5 class="btn_text1">내 문의</h5>
                </button>
           </div>
    </div>
    </div>
    <script type="text/javascript">
    </script>

</html>