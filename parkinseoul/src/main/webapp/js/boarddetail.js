function writerep(){
  var content=$("#comment").val();
  if(content==""){
    swal(
            'Oops...',
            '댓글을 작성해 주세요.',
            'error'
         )
  }else{
//    var no=${article.b_no};
//    var seq=${dto.seq};
    var data= JSON.stringify({
          "r_content":content,
          "b_no":no,
          "seq":seq
          });
    $.ajax({
    url:'reply.htm',
    type:'POST',
    data: data,
    dataType:'json',
    contentType: "application/json; charset=UTF-8",
    success: function(data) {
      var name='${sessionScope.dto.name}';
      var li = document.createElement('li');
      li.className = 'media';
      li.setAttribute('id', data.insertrep.r_no);
      var div1 = document.createElement('div');
      div1.className = 'post-comment';
      var div2 = document.createElement('div');
      div2.className = 'media-body';
      
      var span=document.createElement('span');      
      var i=document.createElement('i');
      i.className = 'fa fa-user';      
      var a=document.createElement('a');
      a.appendChild(document.createTextNode(name));      
      span.appendChild(i);
      span.appendChild(document.createTextNode('Posted by '));
      span.appendChild(a);
      
      var p=document.createElement('p');
      p.appendChild(document.createTextNode(data.insertrep.r_content));
      
      var ul=document.createElement('ul');
      ul.className = 'nav navbar-nav post-nav';
      var li2 = document.createElement('li');
      li2.className = 'inlineli';
      var a2=document.createElement('a');
      var i2=document.createElement('i');
      i2.className = 'fa fa-clock-o';   
      var li3= document.createElement('li');
      li3.className = 'inlineli';
      var a3=document.createElement('a');
      a3.setAttribute('href', 'javascript:deleteReply('+data.insertrep.r_no+')');      
      var img = document.createElement('img');
      img.src = 'images/lightbox/close.png';
      img.setAttribute('width', '15px');
      img.setAttribute('height', '15px');
      
      
      a2.appendChild(i2);
      a2.appendChild(document.createTextNode(data.insertrep.r_regdate));
      li2.appendChild(a2);
      li3.appendChild(a3);
      a3.appendChild(img);
      ul.appendChild(li2);
      ul.appendChild(li3);
      
      div2.appendChild(span);
      div2.appendChild(p);
      div2.appendChild(ul);
      div1.appendChild(div2);
      li.appendChild(div1);
      
      var list=document.getElementById("replist");
      list.appendChild(li);
      
      document.getElementById("comment").value="";
      
      /* var com =document.getElementById("repcnt");
      com.innerHTML='<i class="fa fa-comments"></i>';
      var cnt=${repcnt }+1;
      com.appendChild(document.createTextNode("댓글 "+cnt)); */
    },
    error: function(error) {
      console.log("error : " + JSON.stringify(error));
    }
  });
  }
  
}

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
      
     /*  var com =document.getElementById("repcnt");
      com.innerHTML='<i class="fa fa-comments"></i>';
      var cnt=${repcnt }-1;
      console.log(cnt);
      com.appendChild(document.createTextNode("댓글 "+cnt)); */
    },
    error: function(error) {
      console.log("error : " + JSON.stringify(error));
    }
  });
}