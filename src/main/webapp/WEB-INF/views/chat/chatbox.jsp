<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Home</title>
	    <link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
	    <style>
	        *{
	            font-family: 'Dongle', sans-serif;
	            font-size: 30px;
	        }
	        #chating-item{
	            width: 500px;
	            height: 500px;
	            min-width: 500px;
	            position: relative;
	        }
	        #chatlist{
	            width: 100%;
	            height: 70%;
	            background-color: #9999ee;
	            overflow-y: auto;
	            z-index: 9;
	        }
	        #chatinput{
	            width: 100%;
	            height: 30%;
	            min-height: 150px;
	            background-color: #aaffaa;
	            z-index: 9;
	        }
	        .chatbg{
	            margin-top: 5px;
	            margin-left: 10px;
	            margin-bottom: 5px;
	            background-color: white;
	            width: fit-content;
	            height: fit-content;
	            border-radius: 5px;
	        }
	        #imogi{
	            position: absolute;
	            width: 50px;
	            height: 50px;
	            top: 390px;
	            left: 80%;
	            z-index: 10;
	        }
	        #imogilist{
	            position: absolute;
	            width: 100%;
	            height: 30px;
	            top: 320px;
	            left: 0px;
	            z-index: 10;
	            background-color:rgba(77,77,77,0.5);
	        }
	        [contenteditable=true]:empty:before{
	            content: attr(placeholder);
	        }
	        #imogiiocn{
	            z-index: 10;
	        }
	        .imogiinline{
	            display:inline;
	        }
	    </style>
	</head>
	<body>
	    <div id="chating-item">
	        <div id="chatlist">
	
	        </div>
	        <div id="chatinput" contenteditable="true" placeholder="메세지를 입력하고 엔터를 눌러주세요.(우산 = 이모티콘)">
	
	        </div>
	        <div id="imogi">
	            <img src="/spring_02/resources/Umbrela.png" id="imogiicon">
	        </div>
	        <div id="imogilist">
	            <img src="/spring_02/resources/bono.ico" class="imogicontent">
	            <img src="/spring_02/resources/bono_myc.ico" class="imogicontent">
	        </div>
	    </div>
	</body>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		$("#imogilist").hide();
		let ws=new WebSocket("ws://192.168.150.6:8955/spring_02/chats");//최종에는 주소로 대체
		
		$("#chating-item").on("keyup","#chatinput",function(key){
		    if(key.keyCode==13&&key.shiftKey==false){
		        let inputChat=$("#chatinput").html().replace("<div><br></div>","");
	        	ws.send(inputChat);
		        $("#chatinput").text("");
		        $("#chating-item").focus();
		        return false;
//		        $("#chatlist").append("<div class='chatbg'>"+inputChat+"</div>");
//		        $("#chatlist").scrollTop($("#chatlist")[0].scrollHeight);
//		        $("#chatinput").text("");
//		        $("#chating-item").focus();
		    }
		});
		ws.onmessage = function(data){
	        $("#chatlist").append("<div class='chatbg'>"+data.data+"</div>");
	        $("#chatlist").scrollTop($("#chatlist")[0].scrollHeight);
		}
		$("#imogi").on("click",function(){
		    if($("#imogilist").is(":visible"))
		        $("#imogilist").hide();
		    else
		        $("#imogilist").show();
		})
		$(".imogicontent").on("click",function(){
		    let icon=$(this).attr("src")
		    let icons="<img src="+icon+" class='imogiinline'>";
		    $("#chatinput").append(icons);
		    // let keyCursor=window.getSelection().anchorOffset;
		    // let frontMsg=$("#chatinput").html().substring(0,keyCursor);
		    // let backMsg=$("#chatinput").html().substring(keyCursor); 
		    // alert(keyCursor);
		    // alert(frontMsg);
		    // alert(backMsg);
		    // $("#chatinput").html(frontMsg+icons+backMsg);
		    // $("#chatinput").focus;
		    $("#chatinput").prop("selectionStart",++keyCursor).focus();  
		})
	</script>
</html>