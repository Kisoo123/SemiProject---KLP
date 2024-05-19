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
				<input type ="file" name="upfile" id="upfile" multiple>
			</div>
			<div>
				<textarea class="form-control" cols="40" rows="5" name="content" id="content"></textarea>
			</div>
			<button type="submit">제출</button>
		</form>
<%-- <a onclick = "likeClick()"> 좋아요 <%= %></a> --%>
	</div> 
	
<!-- 	<div>
		<input type ="file" name="upfile" id="upfile" multiple>
	</div>
	<div>
		<textarea class="form-control" cols="40" rows="5" name="content" id="content"></textarea>
	</div>
	<button id="submitButton">제출</button> -->
	

    <div id="result"></div>
	
	<div class="container" id="container">
	</div>  
	
    
</body>
<script>
/* $("#submitButton").click(e=>{
	const form = new FormData();
	const files = ($("#upfile")[0].files);
	for(let i=0;i<files.length;i++){
		form.append("upfile"+i,files[i]);
	}
	form.append("content",$("#content".val))
	console.log(form);
}) */
				
   const container = document.getElementById("container");
   let page = 1; 
   const perPage = 10;
   let time=true;
const loadPage=()=>{	
  	$.ajax({
	    type:"POST",
	    url:"<%=request.getContextPath()%>/feed/InfiniteScroll.do",
	    data: {
	    	"cPage":page,
	    	"numPerPage":perPage
	    },
	    success :
	    	function(data){
	    	console.log(data);
	    			$.each(data,function(idx, element) {
	    				const $div=$("<div>").css("border","1px solid red");
	    				$div.append('<h3 class="feedNo">' + element.feedNo+ '</h3>');
	    				$div.append('<h3>' + element.feedMemberName+ '</h3>');
	    				$div.append('<h3>' + element.feedWriterName+ '</h3>');
	    				$div.append('<h3>' + element.feedWriteDate+ '</h3>');
	    				$div.append('<h3>' + element.feedUpdateDate+ '</h3>');
	    				$div.append('<h3>' + element.feedContent+ '</h3>');
	    				$div.append('<h3>' + element.likes+ '</h3>');
	    				$div.append('<h3>' + element.report+ '</h3>');
	    				if(element.filePath!="/SemiProject-KLP/upload/feed/null"){
		    					$div.append($('<img>').attr({
		    					    'src': element.filePath,'width': '100px','height': '100px' 
		    					}));
		    				}
	    				$(container).append($div);

	    			}) 
	            time=true;
	        	page++;

	    	}
	    ,
	    error : function(request,status,error){
	        alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        alert(e);
	    }
	})
}
document.addEventListener("DOMContentLoaded", function () {
		loadPage();
  		window.addEventListener("scroll", function () {
       const scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
       const windowHeight = window.innerHeight;
       const scrollHeight = document.documentElement.scrollHeight;
	if (scrollTop + windowHeight >= scrollHeight - 150) {
     		if(time){
	      time=false;
        	console.log(page);
        	loadPage();
	        	
      		}
		}
    });
});

</script>
</html>