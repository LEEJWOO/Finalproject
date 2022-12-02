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
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
   	    <Style>
	        *{
				font-family: 'Noto Sans KR', sans-serif;
	            font-size: 18px;
	        }
	    </Style>
	</head>
	<body>
		<div class="card col" style="width: 18rem;">
			<c:choose>
				<c:when test="${signin.id == null}">
				  <div class="card-header">
				    로그인 
				  </div>
					<form action="member/login" method="post">
					  <!-- Email input -->
					  <div class="form-outline mb-4">
					    <input type="text" name="id" class="form-control" placeholder="아이디를 입력해주세요." />
					  </div>
					
					  <!-- Password input -->
					  <div class="form-outline mb-4">
					    <input type="password" name="pw" class="form-control" placeholder="패스워드를 입력해주세요." />
					  </div>						
					  <!-- Submit button -->
					  <div class="d-grid gap-2">
					  	<input type="submit" class="form-control btn btn-primary btn-block btn-12" value="Login" />
					  </div>						
					  <!-- Register buttons -->
					  <div class="text-center">
					    <p>회원이 아니십니까? <a href="member/signup">회원 가입</a></p>
					  </div>
					</form>
				</c:when>
			    <c:otherwise>
	 					  <div class="card-header">
				    ${signin.id} 님 환영합니다.
				  </div>
		            <div>
				        <button class="btn btn-sm btn-primary" id = "freeboard-btn">게시판</button>
					    <button class="btn btn-sm btn-primary" id = "logout-btn">로그아웃</button>
					    <button class="btn btn-sm btn-primary" id = "editid-btn">회원수정</button>
					    <button class="btn btn-sm btn-danger" id = "removeid-btn">회원탈퇴</button>
				    </div>
			    </c:otherwise>
			</c:choose>
		</div>
	</body>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		$("#freeboard-btn").on("click",function(){
			location.replace("freeboard/home?page=1");
		});
		$("#logout-btn").on("click",function(){
			$.post("member/login",function(){
				location.reload();
			});
		});
		$("#editid-btn").on("click",function(){
			location.replace("member/editid");
		});
		$("#removeid-btn").on("click",function(){
			swal({
			  title: "회원 탈퇴",
			  text: "정말로 회원 탈퇴하시겠습니까?\n탈퇴하면 회원정보가 즉시 삭제되어 복구가 불가능합니다.",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((choice) => {
				if (choice) {
					$.post("member/leave",function(data){
						if(data=="true"){
					    	swal("감사합니다 안녕히 가십시요.", {icon: "success"});
					    	    $.post("member/login");
								location.reload();
					    }else if(data=="false")
							swal("회원 탈퇴 오류 관리자에게 문의 해주세요", {icon: "danger"});
					});
				}else{
			    	swal("회원 탈퇴가 취소되었습니다.");
			  	}
			});
		})
	</script>
</html>