<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<section id="page-breadcrumb">
	<div class="vertical-center sun">
		<div class="container">
			<div class="row">
				<div class="action">
					<div class="col-sm-12">
						<h1 class="title">Article</h1>
						<p>게시글에 댓글을 달아보세요!</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--/#page-breadcrumb-->

<section id="blog-details" class="padding-top">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="single-blog blog-details two-column">
					<div class="post-content overflow">
						<h1 class="post-title bold">
							<a>${article.b_title }</a>
						</h1>
						<h2 class="post-author">
							<a>작성자 : ${article.name }</a>
						</h2>
						<p>${article.b_content }</p>
						<div class="post-bottom overflow">
							<ul class="nav navbar-nav post-nav">
								<li><a><i class="fa fa-comments"></i>3 댓글</a></li>
								<li><a href="#"><i class="fa fa-heart"></i>32 추천</a></li>
							</ul>
							<c:if
								test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username == article.id }">
								<ul class="nav navbar-nav post-nav" style="float: right;">
									<li><a href="edit.htm?no=${article.b_no }">수정하기</a></li>
									<li><a href="javascript:deleteArticle(${article.b_no });">삭제하기</a></li>
								</ul>
							</c:if>
						</div>


						<div class="response-area">
							<h2 class="bold">댓글</h2>
							<ul class="media-list" id="replist">
								<c:set var="reply" value="${replylist }" />
								<c:choose>
									<c:when test="${empty reply}">
									</c:when>
									<c:otherwise>
										<c:forEach var="a" items="${reply }">
											<li class="media">
												<div class="post-comment">
													<div class="media-body">
														<span><i class="fa fa-user"></i>Posted by&nbsp;<a>${a.name }</a></span>
														<p>${a.r_content }</p>
														<ul class="nav navbar-nav post-nav">
															<li><a><i class="fa fa-clock-o"></i>${a.r_regdate }</a>
															</li>
														</ul>
													</div>
												</div>
											</li>
										</c:forEach>
									</c:otherwise>
								</c:choose>

							</ul>
						</div>
						<!--/Response-area-->
						<se:authorize access="hasRole('ROLE_USER')">
							<div class="repcontent">
								<div class="col-sm-10">
									<textarea id="comment" class="col-sm-10 form-control" rows="2"
										placeholder="댓글을 작성해 주세요" required="required"></textarea>
								</div>
								<div class="col-sm-2">
									<a class="btn btn-submit" href="javascript:writerep();">댓글
										등록</a>
								</div>
							</div>
						</se:authorize>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<style>
#replist {
	margin-bottom: 60px;
}
</style>

<script type="text/javascript">
function writerep(){
  var content=$("#comment").val();
  var data= JSON.stringify({
          "r_content":content,
          "b_no":${article.b_no},
          "seq":${dto.seq}
  });
  var name='${dto.name}';
  $.ajax({
    url:'writerep.htm',
    type:'POST',
    data: data,
    contentType: "application/json; charset=UTF-8",
    success: function(data) {
      var li = document.createElement('li');
      li.className = 'media';
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
      p.appendChild(document.createTextNode(content));
      
      var ul=document.createElement('ul');
      ul.className = 'nav navbar-nav post-nav';
      var li2 = document.createElement('li');
      var a2=document.createElement('a');
      var i2=document.createElement('i');
      i2.className = 'fa fa-clock-o';      
      a2.appendChild(i2);
      a2.appendChild(document.createTextNode(data));
      li2.appendChild(a2);
      ul.appendChild(li2);
      
      div2.appendChild(span);
      div2.appendChild(p);
      div2.appendChild(ul);
      div1.appendChild(div2);
      li.appendChild(div1);
      
      var list=document.getElementById("replist");
      list.appendChild(li);
    },
    error: function(error) {
      console.log("error : " + JSON.stringify(error));
    }
  });
  
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
</script>