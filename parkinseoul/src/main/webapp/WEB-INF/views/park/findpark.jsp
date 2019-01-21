<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section id="page-breadcrumb">
	<div class="vertical-center sun">
		<div class="container">
			<div class="row">
				<div class="action">
					<div class="col-sm-12">
						<h1 class="title">Find Park</h1>
						<p>서울시 공원을 찾아보세요!</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<meta charset="utf-8" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d9e23a5363a7bc0c5284bc04e7e8dd07"></script>
<title>공원찾기</title>
<link href="css/map.css" rel="stylesheet">


<div id="map" style="width: 100%; height: 700px;"></div>
<br>
<br>
<br>
<br>

<script>
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
  mapOption = {
    center: new daum.maps.LatLng(37.5710052, 126.9882853), // 지도의 중심좌표
    level: 6
  // 지도의 확대 레벨
  };

  var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

  var clickedOverlay = null;

  //  P_PARK
  //  LATITUDE    x
  //  LONGITUDE    y
  //  P_ADDR 주소
  //  P_IMG 이미지

  $(function() {
    var api = "http://openapi.seoul.go.kr:8088/627576684361736434307777707870/json/SearchParkInfoService/1/1000/";
    $.getJSON(api, function(data) {
      park = data.SearchParkInfoService.row;
      //       console.log(park);
      var label = new Array();
      var addr = new Array();
      var lat = new Array();
      var lng = new Array();
      var pimg = new Array();

      $(park).each(function(key, item) {
        label = item.P_PARK;
        addr = item.P_ADDR;
        lat = item.LATITUDE;
        lng = item.LONGITUDE;
        pimg = item.P_IMG;

        var pos = {
          latlng: new daum.maps.LatLng(lat, lng)
        };

        var marker = new daum.maps.Marker({
          map: map,
          position: pos.latlng
        });

        var overlay = new daum.maps.CustomOverlay({
          position: pos.latlng
        });

        var content = document.createElement('div');
        content.className = 'wrap';

        var info = document.createElement('div');
        info.className = 'info';

        var title = document.createElement('div');
        title.className = 'title';
        title.appendChild(document.createTextNode(label));
        document.createe

        var closeBtn = document.createElement('button');
        closeBtn.className = 'close';

        var body = document.createElement('div');
        body.className = 'body';

        var imgDiv = document.createElement('div');
        imgDiv.className = 'img';

        var img = document.createElement('img');
        img.src = pimg;
        img.setAttribute('width', '73');
        img.setAttribute('height', '70');

        var desc = document.createElement('div');
        desc.className = 'desc';

        var ellipsis = document.createElement('div');
        ellipsis.className = 'ellipsis';
        ellipsis.appendChild(document.createTextNode("주소 :"));

        var jibun = document.createElement('div');
        jibun.className = 'jibun ellipsis';
        jibun.appendChild(document.createTextNode(addr));

        /* 
        var div = document.createElement('div');
        
        var at = document.createElement('a');
        at.setAttribute('href', "http://www.kakaocorp.com/main");
        at.setAttribute('target', "_blank");
        at.className = 'link';
        at.appendChild(document.createTextNode("홈페이지"));
         */

        content.appendChild(info);
        info.appendChild(title);
        title.appendChild(closeBtn);
        info.appendChild(body);
        body.appendChild(imgDiv);
        imgDiv.appendChild(img);
        body.appendChild(desc);
        desc.appendChild(ellipsis);
        desc.appendChild(jibun);
        // 		    desc.appendChild(div);
        // 		    div.appendChild(at);

        closeBtn.onclick = function() {
          overlay.setMap(null);
        };

        overlay.setContent(content);

        daum.maps.event.addListener(marker, 'click', function() {
          if (clickedOverlay) {
            clickedOverlay.setMap(null);
          }
          overlay.setMap(map);
          clickedOverlay = overlay;
        });
      });
    });
  });
</script>


