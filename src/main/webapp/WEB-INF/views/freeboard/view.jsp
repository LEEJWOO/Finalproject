<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>고객 문의</title>
	    <link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
	    <style>
	        *{
				font-family: 'Noto Sans KR', sans-serif;
	            font-size: 18px;
	        }
	        *{box-sizing:border-box;}
			#boardtable { 
	            width: 700px;
	            height: 500px;
	            background: rgba(240,240,240,0.5);
	            table-layout:fixed;
			}
			#replytable{
	            width: 700px;
	            height: 100px;
	            background: rgba(240,240,240,0.5);
	            table-layout:fixed;
			}
			#replylisttable{
	            width: 700px;
	            height: auto;
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
	            height:75%;
	            overflow-y:visible;
	            table-layout:fixed;
	        }
	        #footer{
	        	width:100%;
	            height:10%;
	        }
			table #meta {
	        	width:100%;
	            height:5%;
				font-size: 8px;
			}
			table textarea{
				width:100%;
				height:100%;
			}
			#title{border:none;}
	        [contenteditable="true"]:empty:before {
			   content: attr(placeholder);
			}
	    </style>
	</head>
	<body> 
		<table id="boardtable"border=1 align=center>
			<tr>
				<th id="title">${free.board.title}</th>
			</tr>
			<tr>
				<td id="meta">${free.board.id} ${free.board.createdate} ${free.board.viewcount}
			</tr>
			<tr>
				<td id="contents">${free.board.content}</td>
			</tr>
			<tr id="footer">
				<td align=right>
					<c:if test="${free.file[0].no == free.board.no}">
						<c:forEach var="i" items="${free.file}" begin="0" end="${fn:length(free.file)}" step="1">
							<form action="download" method="get">
								<input type="hidden" class="servicefile_uuid" name="uuid" value="${i.uuid}">
								<input type="hidden" class="servicefile_name" name="name" value="${i.name}">
								 ${i.name} <input type="submit" class="download-btn" value="다운로드">
							</form>
						</c:forEach>
					</c:if>
					<c:if test="${free.board.id == signin.id}">
						<button type=button id="delete-btn">삭제</button>
						<button type=button id="edit-btn">수정</button>
					</c:if>
					<button type=button id="back-btn">목록으로</button>
			</tr>
		</table>
		<c:if test="${signin.id ne null}">
			<table id="replytable" border=1 align=center>
				<tr id=>
					<td colspan=6 id="replyinput-table" contenteditable="true" placeholder="댓글을 입력해주세요."></td>
					<td><button type=button id="replyinput-btn">댓글입력</button></td>
				</tr>
			</table>
		</c:if>>
		<c:if test="${boardReplyData ne null}">
			<table id="replylisttable" border=1 align=center>
				<c:forEach var="i" items="${boardReplyData}" begin="0" end="${fn:length(boardReplyData)}" step="1" varStatus="status">
				<tr>
					<td colspan=4 class="replylist-table" placeholder="댓글을 수정해주세요.">${i.replayContent}</td>
					<td colspan=1 class="replymember-table">${i.memberID}</td>
					<c:set var = "string" value = "${i.createdate}"/>
					<td colspan=1 class="replydate-table">${fn:substring(string,2,16)}</td>
					<c:if test="${i.memberID == memberID}">
					<td>
						<button type=button class="replyedit-btn" value="${i.createdate}">수정</button>
						<button type=button class="replyedel-btn" value="${i.createdate}">삭제</button>
					</td>
					</c:if>
				</tr>
				</c:forEach>
			</table>
		</c:if>
	    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script>
			let edited=true;
			$("#delete-btn").on("click",function(){
			    $.get("deleteboard"+window.location.search);
			    location.replace("home?page=1");
			});
			$("#edit-btn").on("click",function(){
			    if(edited){
					alert("내용을 직접 수정해주세요.");
			        edited=false;
			        $("#title").attr({"contenteditable":"true","placeholder":"글 제목"});
			        $("#contents").attr({"contenteditable":"true","placeholder":"내용을 입력해주세요."});
			        $("#edit-btn").html("수정 완료");
			    }else{
			        $.get("updateboard"+window.location.search,{title:$("#title").text(),content:$("#contents").text()});
			        location.reload();
			    }
			});
	
			$("#back-btn").on("click",function(){
			    location.replace("home?page=1");
			});
		</script>
	</body>
</html>