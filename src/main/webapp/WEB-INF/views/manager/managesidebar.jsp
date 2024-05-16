<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.aside{
        	width: 20%;
            height: 700px;
            border: 1px solid blue; 
            display: flex;
            justify-content: left;
            /* align-items: top; */
        }
.article{
            width: 80%;
             border: 1px solid red; 
            height: 700px;
            display: flex;
            flex-wrap: wrap;
            /* justify-content: space-evenly; */
        }
.sectionflex{
            display: flex;
           
        }
.aside>nav>ul{
            list-style-type: none;
        }        

        
</style>
<body>
<section class="sectionflex">
	<aside class="aside">
		<nav>
		<h2>관리자 메뉴</h2>
			<ul>
				<li>
					<button onclick="">메인화면</button>
				</li>
				<li>
					<button onclick="location.assign('<%=request.getContextPath()%>/manager/noticelist.do')">공지사항</button>
				</li>
				<li>
					<button onclick="location.assign('<%=request.getContextPath()%>/manager/faqlist.do')">faq</button>
				</li>
				<li>
					<button onclick="">문의</button>
				</li>
				<li>
					<button onclick="location.assign('<%=request.getContextPath()%>/report/reportList.do')">신고내역</button>
				</li>
			</ul>
			<br>
			<h3>회원 관리</h3>
			<div>
				<button onclick="">아티스트</button>
			</div>
			<div>
				<button onclick="">팬</button>
			</div>
			<br>
			<h3>피드 관리</h3>
			<div>
				<button onclick="">아티스트</button>
			</div>
			<div>
				<button onclick="">팬</button>
			</div>
			<br>
			<h3>상점 관리</h3>
			<div>
				<button onclick="">배너</button>
			</div>
			<div>
				<button onclick="">상품</button>
			</div>
			<div>
				<button onclick="">결제</button>
			</div>
		</nav>
	</aside>
	
	<article class="article">
	
	</article>
</section>
</body>
</html>