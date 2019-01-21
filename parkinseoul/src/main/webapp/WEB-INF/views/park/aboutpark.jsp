<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="css/map.css" rel="stylesheet">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d9e23a5363a7bc0c5284bc04e7e8dd07"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
  var clickedOverlay = null;
  var mapContainer = document.getElementById('detailmap'), // 지도를 표시할 div
  mapOption = {
    center: new daum.maps.LatLng(${dto.latitude}, ${dto.longitude}), // 지도의 중심좌표
    level: 3
  // 지도의 확대 레벨ㅡ
  };
  
  var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
  var position = new daum.maps.LatLng(${dto.latitude}, ${dto.longitude});
  //마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
  var marker = new daum.maps.Marker({
    map: map,
    position: position
  }); 
  
  
  var content = document.createElement('div');
  content.className = 'wrap';

  var info = document.createElement('div');
  info.className = 'info';

  var title = document.createElement('div');
  title.className = 'title';
  title.appendChild(document.createTextNode('카카오내비 길찾기 (모바일 전용)'));
  document.createe

  var closeBtn = document.createElement('button');
  closeBtn.className = 'close';

  var body = document.createElement('div');
  body.className = 'body';

  var imgDiv = document.createElement('div');
  imgDiv.className = 'img';

  var img = document.createElement('img');
  img.src = 'images/kakaonavi_btn.png';
  img.setAttribute('width', '73');
  img.setAttribute('height', '70');

  var desc = document.createElement('div');
  desc.className = 'desc';

  var ellipsis = document.createElement('div');
  ellipsis.className = 'ellipsis';
  ellipsis.appendChild(document.createTextNode("주소 :"));

  var jibun = document.createElement('div');
  jibun.className = 'jibun ellipsis';
  jibun.appendChild(document.createTextNode('${dto.p_ADDR }'));

  
  var div = document.createElement('div');
  
  var at = document.createElement('a');
  at.setAttribute('onclick', 'navi()');
  at.appendChild(document.createTextNode("찾아 가기"));
  
  

  content.appendChild(info);
  info.appendChild(title);
  title.appendChild(closeBtn);
  info.appendChild(body);
  body.appendChild(imgDiv);
  imgDiv.appendChild(img);
  body.appendChild(desc);
  desc.appendChild(ellipsis);
  desc.appendChild(jibun);
  desc.appendChild(div);
  div.appendChild(at);
  
  var overlay = new daum.maps.CustomOverlay({
    content: content,
    map:map,
    position: position
  });
  
  closeBtn.onclick = function() {
    overlay.setMap(null);
  };
  
  daum.maps.event.addListener(marker, 'click', function() {
    if (clickedOverlay) {
      clickedOverlay.setMap(null);
    }
    overlay.setMap(map);
    clickedOverlay = overlay;
  }); 
  
  
  $("#likebtn").click(function(){
    if('${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}'==""){
      alert("로그인 후 이용 가능합니다.");
      console.log("like");
    }else{      
      $.ajax({
        url:'likeproc.htm',
        type:'POST',
        success: function(data) {
          document.getElementById("likebtn").innerHTML='<i class="fa fa-heart">';
          if(data.updown=="plus"){       
            $("#likebtn").append(' '+data.cnt+' LIKE');
          }else{
            $("#likebtn").append(' '+data.cnt+' LIKE');
          }
        },
        error: function(error) {
          console.log("error : " + JSON.stringify(error));
        }
      });
    }
  });
  
});
Kakao.init('d9e23a5363a7bc0c5284bc04e7e8dd07');

function navi(){
  Kakao.Navi.start({
    name: "${dto.p_PARK }",
    x: ${dto.longitude}, 
    y: ${dto.latitude},
    coordType: 'wgs84'
    });
  
}

</script>
<section id="page-breadcrumb">
	<div class="vertical-center sun">
		<div class="container">
			<div class="row">
				<div class="action">
					<div class="col-sm-12">
						<h1 class="title">About Park</h1>
						<p>${dto.p_PARK }&nbsp;상세페이지입니다.</p>
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
				<img src="${dto.p_IMG }" class="col-xs-12 margin-bottom" alt="">
				<h1 class="margin-bottom">${dto.p_PARK }<br> <br>
					<button type="button" class="btn btn-default" id="likebtn" value="">
						<i class="fa fa-heart"></i>&nbsp;${dto.likecount}&nbsp;LIKE
					</button>
				</h1>
				<p>${dto.p_LIST_CONTENT}</p>
			</div>
		</div>
	</div>
</section>
<!--/#about-company-->




<section id="company-information" class="padding-top">
	<div class="container">
		<div class="row">
			<div class="about-us">
				<div class="col-sm-12 wow fadeInLeft" data-wow-duration="1000ms"
					data-wow-delay="300ms">
					<h2 class="bold" style="margin-left: 42.5%;">기본 정보</h2>
					<div class="row">
						<div class="col-sm-5 wow scaleIn" data-wow-duration="500ms"
							data-wow-delay="600ms">
							<img src="${dto.guidance }" class="img-responsive" alt="">
						</div>
						<div class="col-sm-7">
							<h5 class="top-zero">면적</h5>
							<p>${dto.area }</p>
							<br>
							<h5 class="top-zero">개원일</h5>
							<p>${dto.open_dt }</p>
							<br>
							<h5 class="top-zero">주요 시설</h5>
							<p>${dto.main_equip }</p>
							<br>
							<h5 class="top-zero">주요 식물</h5>
							<p>${dto.main_plants }</p>
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
								${dto.p_ADDR }<br>${dto.p_ADMINTEL }<br> <a
									href="${dto.template_url }"></a>
							</p>
							<br>
							<h4 class="top-zero">오시는 길</h4>
							<p>${dto.visit_road }</p>
							<br>
							<h4 class="top-zero">이용 안내</h4>
							<p>${dto.use_reffer}</p>
						</div>
						<br>
						<div class="col-xs-12 col-sm-5 wow scaleIn" id="detailmap"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

</section>
<!--/#company-information-->

