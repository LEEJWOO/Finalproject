<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객 문의 작성</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <style>
        *{
			font-family: 'Noto Sans KR', sans-serif;
            font-size: 18px;
            color: black;
        }
        #filelist-span{
        	font-size: 8px
        }
        #board-item{
            width: 700px;
            height: 600px;
            background: rgba(240,240,240,0.5);
            table-layout:fixed;
        }
        #title{
       		width:100%;
            height:10%;
            overflow-y:visible;
            table-layout:fixed;
        }
        #contents{
        	width:100%;
            height:80%;
            overflow-y:visible;
            table-layout:fixed;
        }
        #footer{
        	width:100%;
            height:10%;
        }
        .board-input{
            
        }
        [contenteditable="true"]:empty:before {
		   content: attr(placeholder);
		}
    </style>
</head>
<body>
	<table id="board-item" border=1 align=center>
		<tr>
			<th id="title" contenteditable=true placeholder="글 제목"></th>
		</tr>
		<tr>
			<td id="contents" contenteditable=true placeholder="내용을 입력해주세요."></td>
		</tr>
		<tr>
			<td id="footer" align=right>
				<form action="create_check" method="post" enctype="multipart/form-data" id="data-form">
					<input type="hidden" id="service_title-hidden" name="title">
					<input type="hidden" id="service_content-hidden" name="content">
					<input type="file" id="files-input"class="btn file-btn" name="file" multiple>
					<span id="filelist-span"></span>
					<input type="button" id="create-btn" value="작성">
					<button type="button" id="back-btn">목록으로</button>
				</form>
			</td>
		</tr>
	</table>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
    $("#create-btn").on("click",function(){
    	$("#service_title-hidden").val($("#title").text());			
    	$("#service_content-hidden").val($("#contents").text());
    	$("#data-form").submit();
    	});
    $("#files-input").change(function(){
    	let filelist = $("#files-input")[0].files;
    	if(filelist.length>5){
    		alert("5개까지 업로드 할 수 있습니다.")
    		$("#files-input").val("");
    	}else if(filelist.length>1){
    		$("#filelist-span").text("");
    		for(var i=0;i<filelist.length;i++)
    			$("#filelist-span").text($("#filelist-span").text()+" "+(i+1)+". "+filelist[i].name);
    	}
    });
	$("#back-btn").on("click",function(){
	    location.replace("home?page=1");
	});
    </script>
</body>
</html>