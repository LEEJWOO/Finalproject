<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="day" class="java.util.Date"/>
<fmt:formatDate value="${day}" pattern="yyyy-MM-dd HH:mm:ss.SSS" var="today"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 템플릿</title>
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
        .bgcontents{
            position: absolute;
            top:0px;
            left:0px;
            width: 100%;
            height: 100%;
        }
        .postbg{
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            width: 700px;
            height: 600px;
        }
        .post{
            float: none; 
            margin: 0 auto;
            font-size: 30px;
            width: 80%;
            min-width: 500px;
            height: auto;
            color: black;
            text-align: center;
        }
        .posts{
            background: rgba(240,240,240,0.5);
        }
        a:link {
		    text-decoration: none;
		}
    </style>
</head>
<body>
	<table border="1" align="center" width="800px">
        <tr>
            <th colspan="5">자유게시판 ${signin.id}님 환영합니다.</th>
        </tr>
        <tr>
            <td width="5%"></td>
            <td width="60%" align="center">제목</td>
            <td width="15%" align="center">작성자</td>
            <td width="15%" align="center">날짜</td>
            <td width="5%">조회</td>
        </tr>        
        <c:if test="${freeboard ne null}">
        	<c:forEach var="i" items="${freeboard}" begin="0" end="${fn:length(freeboard)}" step="1">
       			<tr>
       				<td>${i.no}
	       			<td><a href="view?no=${i.no}">${i.title}</a>
	       			<td>${i.id}
	       			<td>${fn:substring(i.createdate,0,10)}
	       			<td>${i.viewcount}
       			</tr>
        	</c:forEach>
        </c:if>
        <c:if test="${freepage ne null}">
      			<tr>
      				<td colspan="5">
       				<div class="d-flex justify-content-center">
	       				<div>
	       					<button class="page-btn" id="leftlist-btn">◀</button>
	       				</div>
			        	<c:forEach var="j" begin="1" end="${freepage}" step="1">
							<div>
								<button class="listpage-btn" id="${j}-btn">${j}</button>
							</div>
			        	</c:forEach>
	        			<div>
	        				<button class="page-btn" id="rightlist-btn">▶</button>
	        			</div>
	        		</div>
        		</td>
        	</tr>
        </c:if>
        <tr>
   	    	<td colspan=5 align="right">
	        	<c:if test="${signin.id ne null}">
	                <button id=boardwriter-btn>작성하기</button>
	        	</c:if>
        	</td>
        </tr>
    </table>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		$(document).on("click","#rightlist-btn",function(){
			let listpage=parseInt(document.location.toString().substring(document.location.toString().lastIndexOf("?page=")+6))+1;
			if (parseInt(listpage)>=${freepage})
				listpage=${freepage};
			location.replace("home?page="+listpage);
		});
		$(document).on("click",".listpage-btn",function(){
			location.replace("home?page="+$(this).attr("id").toString().substring(0,$(this).attr("id").toString().indexOf("-")));
		});
		$(document).on("click","#leftlist-btn",function(){
			let listpage=parseInt(document.location.toString().substring(document.location.toString().lastIndexOf("?page=")+6))-1;
			if (listpage<=0)
				listpage=1;
			location.replace("home?page="+listpage);
		});
		$("#boardwriter-btn").on("click",function(){
			location.replace("create");
		});
	</script>
</body>
</html>