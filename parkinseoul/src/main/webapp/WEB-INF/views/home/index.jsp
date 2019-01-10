<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
$(document).ready(function(){
  $('#test').click(function(){
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
				<a href="join.htm" class="btn btn-common">SIGN UP</a>&nbsp; <a
					href="login.htm" class="btn btn-common">SIGN IN</a>
				<!-- 	&nbsp; <a id="test" class="btn btn-common">test</a> -->
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
			<br> <br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>


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
			<div class="col-sm-4 text-center padding wow fadeIn"
				data-wow-duration="1000ms" data-wow-delay="900ms">
				<div class="single-service">
					<div class="wow scaleIn" data-wow-duration="500ms"
						data-wow-delay="900ms">
						<img src="images/home/icon3.png" alt="">
					</div>
					<h2>Swift Page Builder</h2>
					<p>Venison tongue, salami corned beef ball tip meatloaf bacon.
						Fatback pork belly bresaola tenderloin bone pork kevin shankle.</p>
				</div>
			</div>
		</div>
	</div>
</section>
<!--/#services-->



