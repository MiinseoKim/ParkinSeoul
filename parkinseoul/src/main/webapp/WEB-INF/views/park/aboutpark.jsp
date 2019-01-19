<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="park" value="${requestScope.dto}"></c:set>
<section id="page-breadcrumb">
	<div class="vertical-center sun">
		<div class="container">
			<div class="row">
				<div class="action">
					<div class="col-sm-12">
						<h1 class="title">About Park</h1>
						<p>${park.p_PARK }&nbsp;상세페이지입니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--/#page-breadcrumb-->

<section id="about-company" class="padding-top wow fadeInUp"
	data-wow-duration="400ms" data-wow-delay="400ms">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">
				<img src="${park.p_IMG }" class="margin-bottom" alt="">
				<h1 class="margin-bottom">${park.p_PARK }<br> <br>
					<button type="button" class="btn btn-default">
						<i class="fa fa-heart"></i>&nbsp;12 LIKE
					</button>
				</h1>
				<p>${park.p_LIST_CONTENT}</p>
			</div>
		</div>
	</div>
</section>
<!--/#about-company-->




<section id="company-information" class="padding-top" >
	<div class="container">
		<div class="row">
			<div class="about-us">
				<div class="col-sm-12 wow fadeInLeft" data-wow-duration="1000ms"
					data-wow-delay="300ms">
					<h2 class="bold" style="margin-left:42.5%;">기본 정보</h2>
					<div class="row">
						<div class="col-sm-5 wow scaleIn" data-wow-duration="500ms"
							data-wow-delay="600ms">
							<img src="${park.guidance }" class="img-responsive" alt="">
						</div>						
						<div class="col-sm-7">							
							<h5 class="top-zero">면적</h5>
							<p>${park.area }</p><br>
								<h5 class="top-zero">개원일</h5>
								<p>${park.open_dt }</p><br>
								<h5 class="top-zero">주요 시설</h5>
								<p>${park.main_equip }</p><br>
								<h5 class="top-zero">주요 식물</h5>
								 <p>${park.main_plants }</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br> <br> <br> <br> <br>
		<div class="row">
			<div class="about-us">
				<div class="col-sm-12 wow fadeInLeft" data-wow-duration="1000ms"
					data-wow-delay="300ms">
					<h2 class="bold">공원 찾기</h2>
					<div class="row">
						<div class="col-sm-7">
							<h4 class="top-zero">주소</h4>
							<p>
								${park.p_ADDR }<br>${park.p_ADMINTEL }<br><a href="${park.template_url }"></a>
							</p>
							<br>
							<h4 class="top-zero">오시는 길</h4>
							<p>${park.visit_road }</p>
							<br>
							<h4 class="top-zero">이용 안내</h4>
							<p>${park.use_reffer}</p>
						</div>
						<div class="col-sm-5 wow scaleIn" id="map"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

</section>
<!--/#company-information-->
<style>
#map{
width: 41%;
 height: 430px;
}
</style>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d9e23a5363a7bc0c5284bc04e7e8dd07"></script>
<script type="text/javascript">
var longitude=${park.longitude};
var latitude=${park.latitude};
console.log(longitude, latitude);
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
  mapOption = {
    center: new daum.maps.LatLng(${park.latitude}, ${park.longitude}), // 지도의 중심좌표
    level: 3
  // 지도의 확대 레벨
  };

  var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

  //마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
  var positions = [{
    latlng: new daum.maps.LatLng(${park.latitude}, ${park.longitude})
  }];
  
  positions.forEach(function(pos) {
    var marker = new daum.maps.Marker({
      map: map,
      position: pos.latlng
    });

    

  });
</script>