<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/select2.min.css">
<link rel="stylesheet" type="text/css" href="css/perfect-scrollbar.css">
<link rel="stylesheet" type="text/css" href="css/likeutil.css">
<link rel="stylesheet" type="text/css" href="css/like.css">
<script src="js/popper.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/likemain.js"></script>

<section id="page-breadcrumb">
	<div class="vertical-center sun">
		<div class="container">
			<div class="row">
				<div class="action">
					<div class="col-sm-12">
						<h1 class="title">Like</h1>
						<p>내가 좋아한 공원 리스트 입니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--/#page-breadcrumb-->

<div class="container text-center">
	<div class="row">
		<div class="col-md-3 col-sm-5">
			<br> <br>
			<div class="sidebar blog-sidebar">
				<div class="sidebar-item categories">
					<h3>Categories</h3>
					<ul class="nav navbar-stacked">
						<li><a href="me.htm">회원 정보 수정</a></li>
						<li><a href="#">좋아요 리스트</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="table100 ver4 m-b-110 col-md-9 col-sm-7">
			<div class="table100-head">
				<table>
					<thead>
						<tr class="row100 head">
							<th class="cell100 column1">Class name</th>
							<th class="cell100 column2">Type</th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="table100-body js-pscroll">
				<table>
					<tbody>
						<tr class="row100 body">
							<td class="cell100 column1">Like a butterfly</td>
							<td class="cell100 column2">Boxing</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script src="js/perfect-scrollbar.min.js"></script>
  <script>
    $('.js-pscroll').each(function(){
      var ps = new PerfectScrollbar(this);

      $(window).on('resize', function(){
        ps.update();
      })
    });
</script>
