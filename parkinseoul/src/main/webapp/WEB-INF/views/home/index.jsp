<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
  $(document).ready(function() {
    $('#test').click(function() {
      $.ajax({
        type: 'GET',
        url: "tes/test1.htm",
        dataType: 'text',
        success: function() {
          alert("dd");

        },
        error: function(error) {
          console.log("error : " + JSON.stringify(error));
        }
      });
    });

  });
</script>

<section id="home-slider">
	<div class="container">
		<div class="main-slider">
			<div class="slide-text">
				<h1>오늘 공원 어디가지?</h1>
				<p>서울시에 있는 공원 정보를 한눈에 확인하세요!</p>
				<!-- Spring security가 제공하는 SPEL :jsp에서 사용할 수 있는 script언어 -->
				<se:authorize access="isAnonymous()">
					<a href="join.htm" class="btn btn-common">SIGN UP</a>&nbsp; <a
						href="login.htm" class="btn btn-common">SIGN IN</a>
					<!-- 	&nbsp; <a id="test" class="btn btn-common">test</a> -->
				</se:authorize>
			</div>
			<img src="images/home/slider/hill.png" class="slider-hill"
				alt="slider image"> <img src="images/home/slider/house.png"
				class="slider-house" alt="slider image"> <img
				src="images/home/slider/sun.png" class="slider-sun"
				alt="slider image"> <img src="images/home/slider/birds1.png"
				class="slider-birds1" alt="slider image"> <img
				src="images/home/slider/birds2.png" class="slider-birds2"
				alt="slider image">
		</div>
	</div>
	<div class="preloader">
		<i class="fa fa-sun-o fa-spin"></i>
	</div>
</section>
<!--/#home-slider-->

<section id="services">
	<div class="container">
		<div class="row">
			<br> <br> <br> <br>


			<div class="col-sm-4 text-center padding wow fadeIn"
				data-wow-duration="1000ms" data-wow-delay="300ms">
				<div class="single-service">
					<a target="_blank" href="https://booked.kr/weather/seoul-18406"><img
						src="https://w.bookcdn.com/weather/picture/32_18406_1_24_3498db_250_2980b9_ffffff_ffffff_1_2071c9_ffffff_0_6.png?scode=2&domid=593&anc_id=10573"
						alt="booked.net" /></a>
				</div>
			</div>

			<div class="col-sm-4">
				<div class="table100 ver4 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head" style="font-weight: initial;">
									<th class="cell100 column1"
										style="width: 33%; text-align: left;">인기 공원 #</th>
									<th class="cell100 column2" style="width: 47%;">공원 이름</th>
									<th class="cell100 column3" style="text-align: center;">좋아요</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<c:forEach var="l" items="${like}" begin="0" end="4" step="1"
									varStatus="status">
									<tr class="row100 body">
										<td class="cell100 column1"
											style="width: 33%; text-align: center;">${status.count}</td>
										<td class="cell100 column2" style="width: 47%;"><a
											href=park.htm?P_PARK=${l.park_name}>${l.park_name}</a></td>
										<td class="cell100 column3" style="text-align: center;">${l.count}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="table100 ver4 m-b-110">
				<div class="table100-head">
					<table>
						<thead>
							<tr class="row100 head" style="font-weight: initial;">
								<th class="cell100 column1" style="width: 33%;">인기 글 #</th>
								<th class="cell100 column2" style="width: 47%;">제목</th>
								<th class="cell100 column3" style="text-align: center;">조회수</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="table100-body js-pscroll">
					<table>
						<tbody>
							<c:forEach var="b" items="${board}" begin="0" end="4" step="1"
								varStatus="status">
								<tr class="row100 body">
									<td class="cell100 column1"
										style="width: 33%; text-align: center;">${status.count}</td>
									<td class="cell100 column2" style="width: 47%;"><a
										href="article.htm?no=${b.b_no }">${b.b_title}</a></td>
									<td class="cell100 column3" style="text-align: center;">${b.b_view}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>
</section>
<!--/#services-->


<%-- <section>
	<div class="forecast-table col-sm-4">
		<div class="container">
			<div class="forecast-container" style="width: 200px;">
				<div class="today forecast">
					<div class="forecast-header">
						<div class="day">Monday</div>
						<div class="date">6 Oct</div>
					</div>
					<!-- .forecast-header -->
					<div class="forecast-content">
						<div class="location">New York</div>
						<div class="degree">
							<div class="num">
								23<sup>o</sup>C
							</div>
							<div class="forecast-icon">
								<img src="images/weather/icons/icon-1.svg" alt="" width=90>
							</div>
						</div>
						<span><img src="images/weather/icon-umberella.png" alt="">20%</span>
						<span><img src="images/weather/icon-wind.png" alt="">18km/h</span>
						<span><img src="images/weather/icon-compass.png" alt="">East</span>
					</div>
				</div>

			</div>
		</div>
	</div>
</section> --%>

<!-- <link rel="stylesheet" href="css/weather.css"> -->