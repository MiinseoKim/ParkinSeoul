<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="css/select2.min.css">
<link rel="stylesheet" type="text/css" href="css/perfect-scrollbar.css">
<link rel="stylesheet" type="text/css" href="css/likeutil.css">
<link rel="stylesheet" type="text/css" href="css/like.css">
<script src="js/popper.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/likemain.js"></script>

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
			<h1>날씨 정보, 인기 공원 순위, 인기글 순위 들어갈 곳(contents)</h1>
			<br> <br> <br> <br> <br>
			<br> <br> <br> <br>


			<div class="col-sm-4 text-center padding wow fadeIn"
				data-wow-duration="1000ms" data-wow-delay="300ms">
				<div class="single-service">
					<div class="wow scaleIn" data-wow-duration="500ms"
						data-wow-delay="300ms">
						<img src="images/home/icon1.png" alt="">
					</div>
					<h2>Incredibly Responsive</h2>
					<p>Ground round tenderloin flank shank ribeye. Hamkevin
						meatball swine. Cow shankle beef sirloin chicken ground round.</p>
				</div>
			</div>
			<div class="col-sm-4 text-center padding wow fadeIn"
				data-wow-duration="1000ms" data-wow-delay="600ms">
				<div class="single-service">
					<div class="wow scaleIn" data-wow-duration="500ms"
						data-wow-delay="600ms">
						<img src="images/home/icon2.png" alt="">
					</div>
					<h2>Superior Typography</h2>
					<p>Hamburger ribeye drumstick turkey, strip steak sausage
						ground round shank pastrami beef brisket pancetta venison.</p>
				</div>
			</div>
			<div class="table100 ver4 m-b-110 col-sm-4">
      <div class="table100-head">
        <table>
          <thead>
            <tr class="row100 head" style="font-weight: initial;">
              <th width="20%" class="cell100 column2">#</th>
              <th width="60%" class="cell100 column5">공원 이름</th>
              <th class="cell100 column2">좋아요</th>
            </tr>
          </thead>
        </table>
      </div>
      <div class="table100-body js-pscroll">
        <table>
          <tbody>
            <c:forEach var="l" items="${like}" begin="0" end="4" step="1" varStatus="status">
              <tr class="row100 body">
                <td width="20%">${status.count}</td>
                <td width="60%"><a href=park.htm?P_PARK=${l.park_name}>${l.park_name}</a></td>
                <td class="cell100 column1">${l.count}</td>
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



