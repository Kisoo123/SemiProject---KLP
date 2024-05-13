<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List,java.text.SimpleDateFormat
,com.kupid.feed.model.dto.Feed
,com.kupid.feed.model.service.FeedService"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="<%=request.getContextPath()%>/feed/feedWrite.do" enctype="multipart/form-data" method="post">
			<%-- <input type ="hidden" name="writer" value="<%=로그인정보%>"> --%>
			<div>
				<input type ="file" name="upfile" id="upfile">
			</div>
			<div>
				<textarea class="form-control" cols="40" rows="5" name="content" id="content"></textarea>
			</div>
			<input type="submit">
		</form>
				
		<%-- <a onclick = "likeClick()"> 좋아요 <%= %></a> --%>
	</div>

	
	<div class="container" id="container">
		
    </div>
</body>
<script>

				
	document.addEventListener("DOMContentLoaded", function () {
    const container = document.getElementById("container");
    let page = 1; 
    const perPage = 11;

    function loadItems() {
        for (let i = 0; i < perPage; i++) {
            const item = document.createElement("div");
            item.className = "item";
            item.textContent = "번호"/* ((page - 1) * perPage + i + 1) */;
            container.appendChild(item);
        }
        page++;
    }

   		window.addEventListener("scroll", function () {
        const scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
        const windowHeight = window.innerHeight;
        const scrollHeight = document.documentElement.scrollHeight;

        if (scrollTop + windowHeight >= scrollHeight - 200) {
            loadItems();
        }
    });

    loadItems();
});
</script>
</html>