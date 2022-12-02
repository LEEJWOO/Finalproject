let edited=true;
$("#delete-btn").on("click",function(){
    $.get("delete.serviceboard"+window.location.search);
    location.replace("list.serviceboard?page=1");
});
$("#edit-btn").on("click",function(){
    if(edited){
		alert("내용을 직접 수정해주세요.");
        edited=false;
        $("#title").attr({"contenteditable":"true","placeholder":"글 제목"});
        $("#contents").attr({"contenteditable":"true","placeholder":"내용을 입력해주세요."});
        $("#edit-btn").html("수정 완료");
    }else{
        $.get("update.serviceboard"+window.location.search,{service_title:$("#title").text(),service_content:$("#contents").text()});
        location.reload();
    }
});

$("#back-btn").on("click",function(){
    location.replace("list.serviceboard?page=1");
});
$("#replyinput-btn").on("click",function(){
	$.get("replyinput.board"+window.location.search,{boardreplyinput:$("#replyinput-table").text()});
	location.reload();	
});
let edit=true;
$(document).on("click",".replyedit-btn",function(){
	if(edit){
		edit=false;
		$($($(this).parent()).parent()).children(".replylist-table").attr("contenteditable","true");
	}else{
		$.post("replyupdate.board",{createdate:$(this).attr("value"),replayContent:$($($(this).parent()).parent()).children(".replylist-table").html()});
		edit=true;
		location.reload();
	}
});
$(document).on("click",".replyedel-btn",function(){
	$.post("replydelete.board",{createdate:$(this).attr("value")});
	location.reload();
});