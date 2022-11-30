<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8"); %>
<html>
	<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 모듈</title>
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
        .signUp-div {
            width: 800px;
        }
        .signUp-group{
        	width: 550px;
        }
        .text-input{
            width: 50%;
        }
        .text-input-noright{
            width: 93%;
        }
        .signUp-group>h2{
            text-align: center;
        }
        .sub-title{
            text-align: right;
            font-size: 23px;
            margin-right: 0px;
        }
        .sub-btn{
            margin-top: 40px;
            margin-left: 15px;
        }
        span{
        	font-size: 8px;
        }
        lable{
        	font-size: 10px;
        }
    </style>
	</head>
	<body>
	<section class="d-none d-sm-flex justify-content-center">
    	<div class="signUp-div d-none d-sm-flex justify-content-center">
        <form role="signUp" id="signUp" name="signUp" method="post" action="signup_check">
            <div class="signUp-group">
                <h2>회원 가입 정보 입력</h2>
            </div>
            <div class="signUp-group row">
                <div class="sub-title col-3">
                    <label for="inputdefault">아이디 :</label>
                </div>
                <div class="sub-input col-9">
                    <input class="signUp-control text-text text-input" id="member_id-text" name="id" type="text" placeholder="아이디를 입력하세요.">
                    <span id="member_id-span">중복체크를 해주세요</span>
                </div>
            </div>
            <div class="signUp-group row">
                <div class="sub-title col-3">
                    <label for="inputdefault">비밀번호 :</label>
                </div>
                <div class="sub-input col-9">
                    <input class="signUp-control text-input-noright" id="member_pw-text" name="pw" type="password" placeholder="비밀번호를 입력하세요.">
                </div>
            </div>
            <div class="signUp-group row">
                <div class="sub-title col-3">
                    <label for="inputdefault">비밀번호 확인:</label>
                </div>
                <div class="sub-input col-9">
                    <input class="signUp-control text-input-noright" id="member_pwck-text" name="pwck" type="password" placeholder="비밀번호를 재입력하세요.">
                </div>
            </div>
            <div class="signUp-group row">
                <div class="sub-title col-3">
                    <label for="inputdefault">이름:</label>
                </div>
                <div class="sub-input col-9">
                    <input class="signUp-control text-input-noright" id="member_name-text" name="name" type="text" placeholder="ex)홍길동">
                </div>
            </div>
            <div class="signUp-group row">
                <div class="sub-title col-3">
                    <label for="inputdefault">휴대전화 번호:</label>
                </div>
                <div class="sub-input col-9">
                    <input class="signUp-control text-text text-input" id="member_phone-text" name="phone" type="text" placeholder="01000000000">
                    <span id="member_phone-span">중복체크를 해주세요</span>
                </div>
            </div>
            <div class="signUp-group row">
                <div class="sub-title col-3">
                    <label for="inputdefault">이메일:</label>
                </div>
                <div class="sub-input col-9">
                    <input class="signUp-control text-text text-input" id="member_email-text" name="email" type="text" placeholder="xxxxxx@xxxxxx.com">
                    <span id="member_email-span">중복체크를 해주세요</span>
                </div>
            </div>
            <div class="signUp-group row">
                <div class="sub-title col-3">
                    <label for="inputdefault">우편번호:</label>
                </div>
                <div class="sub-input col-9">
                    <input class="signUp-control text-input-right" id="member_zipcode-text" name="zipcode" type="text" placeholder="우편번호를 검색해주세요." readonly>
                    <input class="signUp-control id-btn btn-sm btn-outline-primary" type="button" id="member_zipcode-btn" value="우편번호">
                </div>
            </div>
            <div class="signUp-group row">
                <div class="sub-title col-3">
                    <label for="inputdefault">주소:</label>
                </div>
                <div class="sub-input col-9">
                    <input class="signUp-control text-input-noright" id="member_address-text" name="address" type="text" placeholder="우편번호를 검색해주세요." readonly>
                </div>
            </div>
            <div class="signUp-group row">
                <div class="sub-title col-3">
                    <label for="inputdefault">세부주소:</label>
                </div>
                <div class="sub-input col-9">
                    <input class="signUp-control text-input-noright" id="member_building-text" name="building" type="text" placeholder="세부주소를 입력해주세요.">
                </div>
            </div>
            <div class="signUp-group row">
                <div class="sub-title sub-btn col-7">
                    <input class="signUp-control id-btn btn-sm btn-outline-success" type="submit" value="회원가입">
                    <input class="signUp-control id-btn btn-sm btn-outline-danger" type="button" id="cancel-btn" value="취소">
                </div>
            </div>
        </form>
    </div>
	</section>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
	  //RegExp
	  //id : 8 ~ 16자 대,소문자,숫자 사용가능.
	  let reg_id=/^(?=.*[a-z\dA-Z])[a-z\dA-Z]{8,16}$/;
	  //pw : 8 ~ 20자 특수문자(!@#%&) 대,소문자,숫자 혼용 필수.
	  let reg_pw=/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#%&])[a-zA-Z\d!@#%&]{8,20}$/;
	  //name : 2 ~ 5자 한글
	  let reg_name=/^(?=.*[가-힣])[가-힣]{2,5}$/;
	  //phone : 휴대전화 숫자만 받음.
	  let reg_phone=/^01\d{8,9}$/;
	  //email : [영어&숫자] n글자 @ [영어&숫자] n글자+ . +[영어] 2~3글자
	  let reg_email=/^[a-zA-Z\d]*@[a-zA-Z\d]*[.][a-zA-Z]{2,3}$/;
	
	
	  //signUp
	  //kakao address
	  let zipcodeBtn=document.getElementById("member_zipcode-btn");
	  zipcodeBtn.onclick=function(){
	      new daum.Postcode({
	          oncomplete: function(data) {
	              document.getElementById("member_zipcode-text").value=data.zonecode;
	              document.getElementById("member_address-text").value=data.address;
	              document.getElementById("member_building-text").value=data.buildingName;
	          }
	      }).open();
	  }
	
	  //signUp form RegExp
	  let signUp=document.getElementById("signUp");
	  signUp.onsubmit=function(){
	      let member_id=document.getElementById("member_id-text");
	      let member_pw=document.getElementById("member_pw-text");
	      let member_pwck=document.getElementById("member_pwck-text");
	      let member_name=document.getElementById("member_name-text");
	      let member_phone=document.getElementById("member_phone-text");
	      let member_email=document.getElementById("member_email-text");
	      let member_address=document.getElementById("member_address-text");
	      let member_building=document.getElementById("member_building-text");
	      let pwquestion_no=document.getElementById("pwquestion_no-box");
	      let member_pwanswer=document.getElementById("member_pwanswer-text");
	      let checkfails=function(object){
	          let str;
	          switch(object.name){
	              case"id":
	                  str="아이디";
	                  break;
	              case"pw":
	                  str="비밀번호";
	                  member_pwck.value="";
	                  break;
	              case"pwck":
	                  str="비밀번호 확인"
	                  member_pw.value=""
	                  break;
	              case"name":
	                  str="이름";
	                  break;
	              case"phone":
	                  str="휴대전화 번호";
	                  break;
	              case"email":
	                  str="이메일";
	                  break;
	              case"address":
	                  str="주소";
	                  break;
	              case"building":
	                  str="세부주소";
	                  break;
	              default:
	                  console.log(object.name+"확인");
	                  break;
	          }
	          swal({
	              title : str+"입력 오류",
	              icon : "error",
	              text : str+"을(를) 다시 입력해주세요",
	              closeOnClickOutside : false
	          }).then(function(){
	              object.value="";
	              object.focus();
	              if(object.name=="member_pwck")
	                  member_pw.focus();
	          });
	      }
	      if(!(reg_id.test(member_id.value))||checked_id=='false'){
	          checkfails(member_id);
	          $("#member_id-text").attr("readonly",false);
	          return false;
	      }
	      if(!(reg_pw.test(member_pw.value))){
	          checkfails(member_pw);
	          return false;
	      }
	      if(!(member_pw.value==member_pwck.value)){
	          checkfails(member_pwck);
	          return false;
	      }
	      if(!(reg_name.test(member_name.value))){
	          checkfails(member_name);
	          return false;
	      }
	      if(!(reg_phone.test(member_phone.value))||checked_phone=='false'){
	          checkfails(member_phone);
	          $("#member_phone-text").attr("readonly",false);
	          return false;
	      }
	      if(!(reg_email.test(member_email.value))||checked_email=='false'){
	          checkfails(member_email);
	          $("#member_email-text").attr("readonly",false);
	          return false;
	      }
	      if(member_address.value==""){
	          checkfails(member_address);
	          return false;
	      }
	      if(member_building.value==""){
	          checkfails(member_building);
	          return false;
	      }
	  }
	  let checked_id=false;
	  $("#member_id-text").focusout(function(){
	  	if(reg_id.test($("#member_id-text").val())){
	  		if(reg_phone.test($("#member_phone-text").val())){
	  			alert("이미 아이디 검증에 통과했습니다.")
	  		}else{
	  			$.post("id_check",{id:$("#member_id-text").val()},function(data){
	  				if(data==true){
	  					$("#member_id-text").attr("readonly",true);
	  					$("#member_id-span").text("사용 가능한 아이디입니다.");
	  					checked_id=true;
	  				}
	  				else if(data==false)
	  					$("#member_id-span").text("사용 불가능한 아이디입니다.");
	  			})	
	  		}
	  	}else
	  		$("#member_id-span").text("사용 불가능한 아이디입니다.");
	  	}
	  );
	  let checked_phone=false;
	  $("#member_phone-text").focusout(function(){
	  	if(reg_phone.test($("#member_phone-text").val())){
	  		if(checked_phone){
	  			alert("이미 휴대전화검증에 통과했습니다.")
	  		}else{
	  			$.post("phone_check",{phone:$("#member_phone-text").val()},function(data){
	  				if(data==true){
	  					$("#member_phone-text").attr("readonly",true);
	  					$("#member_phone-span").text("사용 가능한 휴대전화 입니다.");
	  					checked_phone=true;
	  				}
	  				else if(data==false)
	  					$("#member_phone-span").text("사용 불가능한 휴대전화 입니다.");
	  			})	
	  		}
	  	}else
	  		$("#member_phone-span").text("사용 불가능한 휴대전화 입니다.");
	  	}
	  );
	  let checked_email=false;
	  $("#member_email-text").focusout(function(){
	  	if(reg_email.test($("#member_email-text").val())){
	  		if(checked_email){
	  			alert("이미 이메일 검증에 통과했습니다.")
	  		}else{
	  			$.post("email_check",{email:$("#member_email-text").val()},function(data){
	  				if(data==true){
	  					$("#member_email-text").attr("readonly",true);
	  					$("#member_email-span").text("사용 가능한 이메일입니다.");
	  					checked_email=true;
	  				}
	  				else if(data==false)
	  					$("#member_email-span").text("사용 불가능한 이메일입니다.");
	  			})	
	  		}
	  	}else
	  		$("#member_email-span").text("사용 불가능한 이메일입니다.");
	  	}
	  )
  		$("#cancel-btn").on("click",function(){
			location.replace("/spring_02/");
		});
    </script>
</body>
</html>