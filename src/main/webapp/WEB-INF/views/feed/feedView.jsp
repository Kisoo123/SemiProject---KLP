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
		 <form id="feedForm" action="<%=request.getContextPath()%>/feed/feedWrite.do" enctype="multipart/form-data" method="post" onsubmit="return submitFeed();">
			<%-- <input type ="hidden" name="writer" value="<%=로그인정보%>"> --%>
			<div>
				<input type ="file" id="upfile" multiple>
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
<style>
/*  .slider_btn a {
    position: absolute;
    background-color: #fff;
    line-height: 50;
    text-align: center;
} 

	.slider_btn a.prev {
	    left: 0;
	}
	.slider_btn a.next {
	    right: 0;
	}
	#container{
		justify-content:center;
		 display:flex;
		 align-items: center;
		 flex-direction: column;
	}
	.img_listBt{
			 display:flex;
		justify-content:center;
				 align-items: center;
		
	} */
	
	.img_list {
    position: relative;
    width: 500px;
    overflow: hidden;
    justify-content: center;
    align-items: center;
        margin-left: 150px;
    
}

.img_listBt {
    display: flex;
    transition: transform 0.5s ease-in-out;
}

.img_listBt > div {
    min-width: 500px;
}

.slider_btn {
    position: absolute;
    top: 50%;
    width: 100%;
    display: flex;
    justify-content: space-between;
    transform: translateY(-50%);
}

.slider_btn a {
    background-color: rgba(0,0,0,0.5);
    color: white;
    padding: 10px;
    text-decoration: none;
    cursor: pointer;
}
</style>
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
$("")

	function submitFeed() {
		$.each($('#upfile')[0].files, function(idx, file) {

			var fileInput = $('<input>')
				.attr('type', "file")
				.attr('name', file.name)
				.css({'display':'none'});
			
			fileInput[0].file = file
			console.log(fileInput[0].file);
			$('#feedForm').append(fileInput);
		})
		return true;
	}
				
				
   const container = document.getElementById("container");
   let page = 1; 
   const perPage = 10;
   let time=true;
   

   const loadPage = () => {	
	    $.ajax({
	        type: "POST",
	        url: "<%=request.getContextPath()%>/feed/InfiniteScroll.do",
	        data: {
	            "cPage": page,
	            "numPerPage": perPage
	        },
	        success: function(data) {
	            console.log(data);
	            $.each(data, function(idx, element) {
	                const $div = $("<div>").css({
	                    "border": "1px solid red",
	                    "width": "800px",
	                    "height": "1000px",
	                    'overflow': 'hidden'
	                }).attr("class", "board");

	                $div.append('<h3 class="feedNo">' + element.feedNo + '</h3>');
	                $div.append('<h3>' + element.feedMemberName + '</h3>');
	                $div.append('<h3>' + element.feedWriterName + '</h3>');
	                $div.append('<h3>' + element.feedWriteDate + '</h3>');
	                $div.append('<h3>' + element.feedUpdateDate + '</h3>');
	                $div.append('<h3>' + element.feedContent + '</h3>');
	                $div.append('<h3>' + element.likes + '</h3>');
	                $div.append('<h3>' + element.report + '</h3>');

	                if (element.filePath != undefined) {
	                    const fileArr = element.filePath.split(",");
	                    const img_list = $('<div>').attr('class', 'img_list');
	                    $div.append(img_list);
	                    const img_listBt = $('<div>').attr('class', 'img_listBt');
	                    img_list.append(img_listBt);

	                    for (let i = 0; i < fileArr.length; i++) {
	                        if (fileArr[i] != "/SemiProject-KLP/upload/feed/null") {
	                            img_listBt.append($('<div>').html($('<img>').attr({
	                                'src': fileArr[i],
	                                'width': '500px',
	                                'height': '500px'
	                            })));
	                        }
	                    }

	                    const slider_btn = $('<div>').attr('class', 'slider_btn');
	                    slider_btn.append($('<a>').html('이전').attr('class', 'prev'));
	                    slider_btn.append($('<a>').html('다음').attr('class', 'next'));
	                    img_list.append(slider_btn);

	                    // Initialize carousel
	                    initializeCarousel(img_list);
	                }

	                $div.append('<br>' + '<button id="">' + '좋아요' + '</button>');
	                $(container).append($div);
	            });
	            time = true;
	            page++;
	        },
	        error: function(request, status, error) {
	            alert('code:' + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }
	    });
	}

	const initializeCarousel = (carousel) => {
	    const imgListBt = carousel.find('.img_listBt');
	    let index = 0;

	    const showSlide = (idx) => {
	        const totalSlides = imgListBt.children().length;
	        if (idx >= totalSlides) index = 0;
	        if (idx < 0) index = totalSlides - 1;
	        imgListBt.css('transform', 'translateX(' + (-idx * 500) + 'px)');
	    }

	    carousel.find('.prev').click(() => {
	        index--;
	        showSlide(index);
	    });

	    carousel.find('.next').click(() => {
	        index++;
	        showSlide(index);
	    });
	}

/* function switchingLikes(){
	$.ajax({
		type:"POST",
		url:,
		data:,
		success:
		
	})
} */
   

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