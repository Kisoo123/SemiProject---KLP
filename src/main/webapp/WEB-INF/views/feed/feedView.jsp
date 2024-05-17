<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List,java.text.SimpleDateFormat
,com.kupid.feed.model.dto.Feed
,com.kupid.feed.model.service.FeedService"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
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
			<button type="submit">제출</button>
		</form>
				
		<%-- <a onclick = "likeClick()"> 좋아요 <%= %></a> --%>
	</div>

	<form id="uploadForm">
        <label for="upfile">File:</label>
        <input type="file" id="upfile" name="upfile"><br><br>
        <label for="content">Content:</label>
        <input type="text" id="content" name="content"><br><br>
        <button type="submit">Upload</button>
    </form>
    <div id="result"></div>
	
	<div style="height:1000px"></div>
	<div class="container" id="container"> </div>
    
    <!--  -->
    
    
    
    
</body>
<script>

				
document.addEventListener("DOMContentLoaded", function () {
	
   const container = document.getElementById("container");
   let page = 1; 
   const perPage = 10;
   
   		window.addEventListener("scroll", function () {
        const scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
        const windowHeight = window.innerHeight;
        const scrollHeight = document.documentElement.scrollHeight;

        if (scrollTop + windowHeight >= scrollHeight - 150) {
        	$.ajax({
                type:"POST",
                url:"<%=request.getContextPath()%>/feed/InfiniteScroll.do",
                data: {
                	"cPage":page,
                	"numPerPage":perPage
                },
                success :
                	function(data){
                			$.each(data,function(idx, element) {
                				$(container).append('<h3>' + element.feedNo+ '</h3>');
                				$(container).append('<h3>' + element.feedMemberName+ '</h3>');
                				$(container).append('<h3>' + element.feedWriterName+ '</h3>');
                				$(container).append('<h3>' + element.feedWriteDate+ '</h3>');
                				$(container).append('<h3>' + element.feedUpdateDate+ '</h3>');
                				$(container).append('<h3>' + element.feedContent+ '</h3>');
                				$(container).append('<h3>' + element.likes+ '</h3>');
                				$(container).append('<h3>' + element.report+ '</h3>');
                			}) 
                			
                	    page++

                	}

            	/* if ($(document).ready()) loadPage(data);
            	if (scrollTop + windowHeight >= scrollHeight - 150) {
            	loadPage(data)} */
                ,
                error : function(request,status,error){
                    alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    alert(e);
                }
            })
        }
    });
});
</script>
</html>