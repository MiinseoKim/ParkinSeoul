

function deleteArticle(no){
  var data= JSON.stringify({
    "no" :no
  })
  swal({
  title: '삭제 하겠습니까?',
  text: "삭제된 게시물은 복구할 수 없습니다.",
  icon: 'warning',
  buttons: {
    cancel: "취소",
    confirm: "삭제"
  }
}).then(function(isConfirm) {
  if (isConfirm) {
    console.log(no);
    $.ajax({
      async: true,
      url:'delete.htm',
      type:'POST',
      data: {
        "no" :no
      },
      success: function(data) {
        location.href="boardlist.htm";
      },
      error: function(error) {
        console.log("error : " + JSON.stringify(error));
      }
    });
  }
})  
}


function deleteReply(no){
  var text = $("#repcnt").contents().filter(function() {
    return this.nodeType == Node.TEXT_NODE;
  }).text().split(" ");
  var res=text[1];
  var cnt=Number(res)-1;
  var param=JSON.stringify({'r_no':no});
  $.ajax({
    async: true,
    url:'reply.htm',
    type:'DELETE',
    data: param,
    contentType: "application/json; charset=UTF-8",
    success: function() {
      var ul =document.getElementById("replist");
      var li =document.getElementById(no);
      ul.removeChild(li);
      
      
      var com =document.getElementById("repcnt");
      com.innerHTML='<i class="fa fa-comments"></i>';
      com.appendChild(document.createTextNode("댓글 "+ cnt)); 
    },
    error: function(error) {
      console.log("error : " + JSON.stringify(error));
    }
  });
}