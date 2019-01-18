<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript">
  $(function() {
    console.log('${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}');
    var api = "http://openAPI.seoul.go.kr:8088/4e495075516d6969373872544e4a6a/json/SearchParkInfoService/1/1000/";
    $.getJSON(api, function(data) {
      park = data.SearchParkInfoService.row;
      console.log(data.SearchParkInfoService.list_total_count);
      var label = new Array();
      $(park).each(function(key, element) {
        label[key] = element.P_PARK;
      });
          

      $("#autoparkname").autocomplete({
        minLength: 1,
        source: label,
        focus: function(event, ui) {
          $("#autoparkname").val(ui.item.label);
          return false;
        },
        select: function(event, ui) {
          $("#autoparkname").val(ui.item.label);
          return false;
        }
      });
    });
    
    
  });
</script>
<header id="header">
	<!-- 	<div class="container"> -->
	<div class="row">
		<div class="col-sm-12 overflow">
			<div class="social-icons pull-right">
				<ul class="nav nav-pills">
					<se:authentication property="name" var="loginuser" />
					<se:authorize access="hasRole('ROLE_USER')">
						<li><a href="me.htm" id="username">${sessionScope.dto.name}
								&nbsp;회원님</a></li>
						<li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
					</se:authorize>
					<se:authorize access="isAnonymous()">
              &nbsp;
            </se:authorize>
				</ul>
			</div>
		</div>
	</div>
	<!-- 	</div> -->
	<div class="navbar navbar-inverse" role="banner">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

				<a class="navbar-brand" href="home.htm" id="logo">
					<h1>
						<img src="images/logo.png" alt="logo"> Park in Seoul
					</h1>
				</a>

			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right" id="menu">
					<li><a href="home.htm">Home</a></li>
					<li><a href="${pageContext.request.contextPath }/findpark.htm">공원
							찾기</a></li>
					<li><a
						href="${pageContext.request.contextPath }/boardlist.htm">커뮤니티</a></li>
					<se:authorize access="hasRole('ROLE_USER')">
						<li class="dropdown"><a>마이페이지<i class="fa fa-angle-down"></i></a>
							<ul role="menu" class="sub-menu">
								<li><a href="me.htm">나의 정보</a></li>
								<li><a href="hearts.htm">좋아요 리스트</a></li>
							</ul></li>
					</se:authorize>

				</ul>
			</div>


			<div class="search">
				<form role="form" action="park.htm" method="post" accept-charset="utf-8">
					<i class="fa fa-search"></i>
					<div class="field-toggle">
						<input type="text" class="search-form" autocomplete="off"
							id="autoparkname" name="autoparkname" placeholder="공원명을 입력해 주세요.">
					</div>
				</form>
			</div>


		</div>
	</div>
</header>
<!--/#header-->