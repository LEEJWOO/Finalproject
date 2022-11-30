//RegExp
//id : 8 ~ 16자 대,소문자,숫자 사용가능.
let regmember_id=/^(?=.*[a-z\dA-Z])[a-z\dA-Z]{8,16}$/;
//pw : 8 ~ 20자 특수문자(!@#%&) 대,소문자,숫자 혼용 필수.
let regmember_pw=/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#%&])[a-zA-Z\d!@#%&]{8,20}$/;
//name : 2 ~ 5자 한글
let regmember_name=/^(?=.*[가-힣])[가-힣]{2,5}$/;
//phone : 휴대전화 숫자만 받음.
let regmember_phone=/^01\d{8,9}$/;
//email : [영어&숫자] n글자 @ [영어&숫자] n글자+ . +[영어] 2~3글자
let regmember_email=/^[a-zA-Z\d]*@[a-zA-Z\d]*[.][a-zA-Z]{2,3}$/;


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
            case"member_id":
                str="아이디";
                break;
            case"member_pw":
                str="비밀번호";
                member_pwck.value="";
                break;
            case"member_pwck":
                str="비밀번호 확인"
                member_pw.value=""
                break;
            case"member_name":
                str="이름";
                break;
            case"member_phone":
                str="휴대전화 번호";
                break;
            case"member_email":
                str="이메일";
                break;
            case"member_address":
                str="주소";
                break;
            case"member_building":
                str="세부주소";
                break;
            case"pwquestion_no":
                str="비밀번호 찾기 질문";
                break;
            case"member_pwanswer":
                str="비밀번호 찾기 답";
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
    if(!(regmember_id.test(member_id.value))||checked_id=='false'){
        checkfails(member_id);
        $("#member_id-text").attr("readonly",false);
        return false;
    }
    if(!(regmember_pw.test(member_pw.value))){
        checkfails(member_pw);
        return false;
    }
    if(!(member_pw.value==member_pwck.value)){
        checkfails(member_pwck);
        return false;
    }
    if(!(regmember_name.test(member_name.value))){
        checkfails(member_name);
        return false;
    }
    if(!(regmember_phone.test(member_phone.value))||checked_phone=='false'){
        checkfails(member_phone);
        $("#member_phone-text").attr("readonly",false);
        return false;
    }
    if(!(regmember_email.test(member_email.value))||checked_email=='false'){
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
    if(pwquestion_no.value==""){
	    checkfails(pwquestion_no);
	    return false;
    }
    if(member_pwanswer.value==""){
	    checkfails(member_pwanswer);
	    return false;
    }
}
let checked_id=false;
$("#member_id-text").foucsout(function(){
	if(regmember_id.test($("#member_id-text").val())){
		if(checked_id){
			alert("이미 아이디 검증에 통과했습니다.")
		}else{
			$.post("idcheck.member",{id:$("#member_id-text").val()},function(data){
				alert(data);
				if(data=="true"){
					$("#member_id-text").attr("readonly",true);
					$("#member_id-span").text("사용 가능한 아이디입니다.");
					checked_id=true;
				}
				else if(data=="false")
					$("#member_id-span").text("사용 불가능한 아이디입니다.");
			})	
		}
	}else
		$("#member_id-span").text("사용 불가능한 아이디입니다.");
	}
);
let checked_phone=false;
$("#member_phone-btn").on("click",function(){
	if(regmember_phone.test($("#member_phone-text").val())){
		if(checked_phone){
			alert("이미 휴대전화검증에 통과했습니다.")
		}else{
			$.post("phonecheck.member",{member_phone:$("#member_phone-text").val()},function(data){
				if(data=="true"){
					$("#member_phone-text").attr("readonly",true);
					$("#member_phone-span").text("사용 가능한 휴대전화 입니다.");
					checked_phone=true;
				}
				else if(data=="false")
					$("#member_phone-span").text("사용 불가능한 휴대전화 입니다.");
			})	
		}
	}else
		$("#member_phone-span").text("사용 불가능한 휴대전화 입니다.");
	}
);
let checked_email=false;
$("#member_email-btn").on("click",function(){
	if(regmember_email.test($("#member_email-text").val())){
		if(checked_email){
			alert("이미 이메일 검증에 통과했습니다.")
		}else{
			$.post("emailcheck.member",{member_email:$("#member_email-text").val()},function(data){
				if(data=="true"){
					$("#member_email-text").attr("readonly",true);
					$("#member_email-span").text("사용 가능한 이메일입니다.");
					checked_email=true;
				}
				else if(data=="false")
					$("#member_email-span").text("사용 불가능한 이메일입니다.");
			})	
		}
	}else
		$("#member_email-span").text("사용 불가능한 이메일입니다.");
	}
)
$(window).ready(function(){
	if(window.location.search.substring(window.location.search.indexOf("sign=")+5,window.location.search.length)=="fail")
        swal("회원 가입 실패","가입 정보를 확인해주세요.","error");
	$.post("pwquestionlist.member",function(data){
		var pwlist=JSON.parse(data);
		for(var j=0;j<pwlist.length;j++){
			$("#pwquestion_no-option").after("<option value='"+pwlist[j].pwquestion_no+"'>"+pwlist[j].pwquestion_str+"</option>")
		}
	})
})
$("#cancel-btn").on("click",function(){
	 location.replace("/LostFinder");
});