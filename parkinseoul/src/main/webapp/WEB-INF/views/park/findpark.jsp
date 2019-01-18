<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section id="page-breadcrumb">
	<div class="vertical-center sun">
		<div class="container">
			<div class="row">
				<div class="action">
					<div class="col-sm-12">
						<h1 class="title">Find Park</h1>
						<p>각종 공원 정보를 공유하는 자유 게시판 입니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<html>
<head>
  <meta charset="utf-8"/>
  <title>Daum 지도 시작하기</title>
  <style type="text/css">
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    
    .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
/*     .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;} */
    
    .overlay {
    position:absolute;
    left: -50px;
    top:0;
    width:100px;
    height: 100px;
    background: #fff;
    border:1px solid #ccc;
    border-radius: 5px;
    padding:5px;
    font-size:12px;
    text-align: center;
    white-space: pre;
    word-wrap: break-word;
    }
  </style>
</head>
<body>

  
  <div id="map" style="width:100%;height:450px;"></div><br><br><br><br>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d9e23a5363a7bc0c5284bc04e7e8dd07"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
  mapOption = { 
      center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
      level: 3 // 지도의 확대 레벨
  };

	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions = [
	  {
      latlng: new daum.maps.LatLng(33.450705, 126.570677)
	  },
	  {
	      latlng: new daum.maps.LatLng(33.450936, 126.569477)
	  },
	  {
	      latlng: new daum.maps.LatLng(33.450879, 126.569940)
	  },
	  {
      content: '<div>텃밭</div>', 
	      latlng: new daum.maps.LatLng(33.451393, 126.570738)
	  }
	];

    positions.forEach(function(pos) {
      var marker = new daum.maps.Marker({
        map: map, 
        position: pos.latlng
      });
      
      var overlay = new daum.maps.CustomOverlay({
        position: pos.latlng
      });
      
      var content = document.createElement('div');
      content.className = 'overlay';
      content.innerHTML = '파크 :D';

      var closeBtn = document.createElement('button');
      closeBtn.src = "close.png";
//       closeBtn.className += ' close';
      closeBtn.onclick = function() { overlay.setMap(null); };
      content.appendChild(closeBtn);
      
      overlay.setContent(content);
      
	    daum.maps.event.addListener(marker, 'click', function() {
	      overlay.setMap(map);
	    });
      
    });
    



    /* 아래와 같이도 할 수 있습니다 */
    /*
     for (var i = 0; i < positions.length; i ++) {
     // 마커를 생성합니다
     var marker = new daum.maps.Marker({
     map: map, // 마커를 표시할 지도
     position: positions[i].latlng // 마커의 위치
     });

     // 마커에 표시할 인포윈도우를 생성합니다 
     var infowindow = new daum.maps.InfoWindow({
     content: positions[i].content // 인포윈도우에 표시할 내용
     });

     // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
     // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
     (function(marker, infowindow) {
     // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
     daum.maps.event.addListener(marker, 'mouseover', function() {
     infowindow.open(map, marker);
     });

     // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
     daum.maps.event.addListener(marker, 'mouseout', function() {
     infowindow.close();
     });
     })(marker, infowindow);
     }
     */
  </script>
</body>
</html>


