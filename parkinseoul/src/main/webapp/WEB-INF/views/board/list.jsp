<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
  $(document).ready(function() {
    $('#table').DataTable({
      "order":[[0,"desc"]]
    });
  });
</script>
<section id="page-breadcrumb">
	<div class="vertical-center sun">
		<div class="container">
			<div class="row">
				<div class="action">
					<div class="col-sm-12">
						<h1 class="title">Community</h1>
						<p>공원 정보를 공유하는 자유 게시판 입니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--/#page-breadcrumb-->
 
<section id="about-company" class="padding-top margin-bottom"
	data-wow-duration="400ms" data-wow-delay="400ms">
	<div class="container">
		<div class="row">
			<table class="col-sm-12 text-center display" id="table">
				<thead>
					<tr>
						<th>글번호</th>
						<th>닉네임</th>
						<th style="width:50%;">제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="article" value="${boardlist }" />
					<c:choose>
						<c:when test="${empty article}">
							<tr >
								<td></td>
								<td></td>
								<td>게시글을 등록해주세요.</td>
								<td></td>
								<td></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="a" items="${article }">
								<tr>
									<td>${a.b_no }</td>
									<td>${a.name }</td>
									<td class="title"><a href="article.htm?no=${a.b_no }">${a.b_title }</a></td>
									<td>${a.b_regdate }</td>
									<td>${a.b_view }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<se:authorize access="hasRole('ROLE_USER')">
			<br> <a class="col-sm-1 text-center display btn btn-default"
				href="write.htm">글쓰기</a>
				</se:authorize>
		</div>
	</div>

</section>
<style>
.title, a{
color: #000;
text-align : left;
padding-left:5px;
}

</style>
