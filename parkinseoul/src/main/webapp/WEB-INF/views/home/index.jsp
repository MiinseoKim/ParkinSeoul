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


			<div class="col-sm-4 text-center padding wow fadeIn"	data-wow-duration="1000ms" data-wow-delay="300ms">
				<div id="openweathermap-widget-12" style="margin-left:15%;"></div>
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
								<th class="cell100 column3" style="text-align: center;">추천수</th>
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
									<td class="cell100 column3" style="text-align: center;">${b.count}</td>
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



<script type="text/javascript">
  var css_file = document.createElement("link");
  css_file.setAttribute("rel", "stylesheet");
  css_file.setAttribute("type", "text/css");
  css_file.setAttribute("href",
          'https://s.bookcdn.com/css/w/booked-wzs-widget-160x275.css?v=0.0.1');
  document.getElementsByTagName("head")[0].appendChild(css_file);
  function setWidgetData(data) {
    if (typeof (data) != 'undefined' && data.results.length > 0) {
      for (var i = 0; i < data.results.length; ++i) {
        var objMainBlock = document
                .getElementById('m-booked-bl-simple-week-vertical-83712');
        if (objMainBlock !== null) {
          var copyBlock = document.getElementById('m-bookew-weather-copy-'
                  + data.results[i].widget_type);
          objMainBlock.innerHTML = data.results[i].html_code;
          if (copyBlock !== null) objMainBlock.appendChild(copyBlock);
        }
      }
    } else {
      alert('data=undefined||data.results is empty');
    }
  }
</script>
<script>
  window.myWidgetParam ? window.myWidgetParam : window.myWidgetParam = [];
  window.myWidgetParam.push({
    id: 12,
    cityid: '1835848',
    appid: '070d6d3bce73ebf47c54303d4179f6d3',
    units: 'metric',
    containerid: 'openweathermap-widget-12',
  });
  (function() {
    var script = document.createElement('script');
    script.async = true;
    script.charset = "utf-8";
    script.src = "//openweathermap.org/themes/openweathermap/assets/vendor/owm/js/weather-widget-generator.js";
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(script, s);
  })();
</script>