<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List,java.text.SimpleDateFormat
,com.kupid.feed.model.dto.Feed
,com.kupid.feed.model.service.FeedService
,com.kupid.member.model.dto.MemberDto
"  %>
<% MemberDto loginMember = (MemberDto) session.getAttribute("loginMember");%>
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
	</div> 

    <div id="result"></div>
	
	<div class="container" id="container">
	</div>  
	
    
</body>
<style>
	
	.img_list {
    position: relative;
    width: 500px;
    overflow: hidden;
    justify-content: center;
    align-items: center;
    left: 150px;
    
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
/* 피드 입력 */
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
   $(container).css({"display": "flex",
	   		"flex-direction":"column",
		    "justify-content": "center", 
   			"align-items": "center"});
   let page = 1; 
   const perPage = 10;
   let time=true;
   
/* 스크롤 페이지 로딩 */
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

	                    initializeCarousel(img_list);
	                }

	                $div.append('<br>' + '<button class="likes">' + '좋아요' + '</button>');
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
   
   document.addEventListener("DOMContentLoaded", function () {
		loadPage();
 		window.addEventListener("scroll", function () {
      const scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
      const windowHeight = window.innerHeight;
      const scrollHeight = document.documentElement.scrollHeight;
	if (scrollTop + windowHeight >= scrollHeight - 150) {
    		if(time){
	      time=false;
       	loadPage();
	        	
     		}
		}
   });
});

/* 케러셀 기능  */
   const initializeCarousel = (carousel) => {
	    const imgListBt = carousel.find('.img_listBt');
	    const slides = imgListBt.children();
	    const totalSlides = slides.length;
	    let index = 0;

	    const showSlide = (idx) => {
	        const slideWidth = slides.first().outerWidth();
	        if (idx >= totalSlides) idx = 0;
	        if (idx < 0) idx = totalSlides - 1;
	        imgListBt.css('transform', 'translateX(' + (-idx * slideWidth) + 'px)');
	        index = idx;
	    }

	    carousel.find('.prev').click(() => {
	        showSlide(index - 1);
	    });

	    carousel.find('.next').click(() => {
	        showSlide(index + 1);
	    });

	    showSlide(index);
	}
   
/* 좋아요 기능 */

function switchingLikes(feedNo, feed, e) {
    $.ajax({
        type: "POST",
        url: "<%=request.getContextPath()%>/feed/likesswitch.do",
        data: {
            "memberNo": '<%=loginMember.getMemberNo()%>',
            "feedNo": feedNo
        },
        success: function(data) {
            console.log(data + "data");
            $(e.target).text("좋아요 "+data);
        }
    });
}
   
$(document).ready(function () {
    $(document).on('click', '.likes', function(e) {
        const feedNo = $(e.target).parent().find('h3:first').text();
        const feed = $(e.target).parent().find('h3:first');
        switchingLikes(feedNo, feed, e);
    });
}); 


</script>
</html>