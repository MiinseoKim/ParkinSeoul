<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/summernote.css">
<script src="js/summernote.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
  $('#b_content').summernote({
    height: 500,
    toolbar: [ 
      // [groupName, [list of button]]
      ['pstyle', ['style']],
      ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
      ['font', ['fontname','fontsize']],
      ['color', ['color']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['Misc', ['fullscreen','codeview']]
    ] 
  }); 
  
  $("#submit").click(function() {
    var param = JSON.stringify({
      "b_no" : ${article.b_no},
      "b_title" : $("#b_title").val(),
      "b_content":$("#b_content").val()
    });
    $.ajax({
      url:'editproc.htm',
      data: param,
      contentType: 'application/json;charset=UTF-8',
      type: 'POST',
      success: function(data) {
        location.href='article.htm?no='+${article.b_no };
      },
      error : function(error) {
        console.log("no good "+JSON.stringify(error));
      }
    });
  });
  
})

</script>
<section id="page-breadcrumb">
	<div class="vertical-center sun">
		<div class="container">
			<div class="row">
				<div class="action">
					<div class="col-sm-12">
						<h1 class="title">Edit</h1>
						<p>게시글을 수정 해주세요.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section id="about-company" class="padding-top wow">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center display">
				<div class="contact-form bottom">
					<h2></h2>
					<form m>
						<div class="form-group">
							<input type="text" id="b_title" class="form-control"
								required="required" placeholder="글 제목" value=${article.b_title }>
						</div>
						<div class="form-group">
							<textarea name="b_content" id="b_content" required="required"
								class="form-control" rows="8" placeholder="내용">${article.b_content }</textarea>
						</div>
						<div class="form-group">
							<a class="btn btn-submit" style="width: auto;"
								href="article.htm?no=${article.b_no }">&nbsp;취소&nbsp;</a> <input
								type="button" id="submit" class="btn btn-submit"
								style="width: auto;" value="수정하기">

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>