<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		
		<div class="col-md-9 col-sm-7" style="height: 500px;">
			<div class="table100 ver4 m-b-110 "
				style="margin-top: 5%; width: 55%; margin-left: 10%;">
				
				<div class="table100-head">
					<table>
						<thead>
							<tr class="row100 head" style="font-weight: initial;">
								<th class="cell100 column1" style="text-align: center;">공원
									목록</th>
								<th class="cell100 column2" style="text-align: center;">좋아요</th>
							</tr>
						</thead>
					</table>
				</div>
				
				<div class="table100-body js-pscroll" style="height: 500px;">
					<table>
						<tbody>
							<c:forEach var="l" items="${list}">
								<tr class="row100 body">
									<td class="cell100 column1"><a
										href=park.htm?P_PARK=${l.park_name}>${l.park_name}</a></td>
									<td style="display: none;">${l.park_num}</td>
									<td class="cell100 column2">
										<button type="button" class="btn btn-default deletelike"
											id="likebtn">
											<i class="fa fa-heart"></i>&nbsp;취소
										</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
			</div>
		</div>
		
		
	</div>
</div><br><br><br><br>

<script>
  $('.deletelike').click(function() {
    var pno = $(this).parent().parent().children().eq(1).text();
    var tr = $(this).parent().parent();

    $.ajax({
      url: 'mydeletelike.htm',
      type: 'POST',
      data: {
        'park_num': pno
      },
      success: function(data) {
        tr.remove();
      }
    });

  });

  $('.js-pscroll').each(function() {
    var ps = new PerfectScrollbar(this);

    $(window).on('resize', function() {
      ps.update();
    })
  });
</script>