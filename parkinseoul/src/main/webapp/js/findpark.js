var guPos = {
  "전체": [37.566535, 126.97796919999996],
  "종로구": [37.5729503, 126.97935789999997],
  "중구": [37.5640907, 126.99794029999998],
  "용산구": [37.5384272, 126.96544419999998],
  "성동구": [37.5633415, 127.03710249999995],
  "광진구": [37.5384843, 127.0822938],
  "동대문구": [37.57436819999999, 127.04001889999995],
  "중랑구": [37.6065602, 127.09265189999996],
  "성북구": [37.589116, 127.01821459999996],
  "강북구": [37.6396099, 127.02565749999997],
  "도봉구": [37.6687738, 127.04707059999998],
  "노원구": [37.6541917, 127.05679299999997],
  "은평구": [37.6026957, 126.92911189999995],
  "서대문구": [37.5791158, 126.93677890000004],
  "마포구": [37.5637561, 126.90842109999994],
  "양천구": [37.5168721, 126.86639850000006],
  "강서구": [37.5509786, 126.84953819999998],
  "구로구": [37.4954031, 126.88736900000004],
  "금천구": [37.4518527, 126.90203580000002],
  "영등포구": [37.5263715, 126.89622830000008],
  "동작구": [37.512402, 126.93925250000007],
  "관악구": [37.4784063, 126.95161329999996],
  "서초구": [37.4837121, 127.03241120000007],
  "강남구": [37.5172363, 127.04732480000007],
  "송파구": [37.5145437, 127.10659710000004],
  "강동구": [37.5301251, 127.12376199999994]
};

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
  center: new daum.maps.LatLng(guPos["전체"][0], guPos["전체"][1]), // 지도의
                                                                            // 중심좌표
  level: 7
// 지도의 확대 레벨
};

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var clickedOverlay = null;
var gu = [];
var marker = [];
var pos = [];
var overlay = [];

$.getJSON(parkapi, function(data) {
  park = data.SearchParkInfoService.row;
  $(park).each(function(key, item) {
    if ($.inArray(item.P_ZONE, gu) === -1 && item.P_ZONE != "") {
      gu.push(item.P_ZONE);
      $("#gu").append("<option>" + item.P_ZONE + "</option>");
    }
    mapHandle(key, item, marker);
  });
});

$("#gu").change(function () {
  console.log(guPos[$("#gu option:selected").text()]);
  marker = [];
  pos = [];
  overlay = [];
  mapOption.center = new daum.maps.LatLng(guPos[$("#gu option:selected").text()][0], guPos[$("#gu option:selected").text()][1]);
  map = new daum.maps.Map(mapContainer, mapOption);
  $.getJSON(parkapi, function (data) {
      park = data.SearchParkInfoService.row;
      $(park).each(function (key, item) {
          if ($("#gu option:selected").text() == "전체") {
              mapHandle(key,item,marker);
          } else if (item.P_ZONE == $("#gu option:selected").text()) {
              mapHandle(key,item,marker);
          }
      });
  });
});

function mapHandle(key, item, marker) {
  // 오버레이&마커 위치

  pos[key] = {
    latlng: new daum.maps.LatLng(item.LATITUDE, item.LONGITUDE)
  };

  marker[key] = new daum.maps.Marker({
    map: map,
    position: pos[key].latlng
  });

  overlay[key] = new daum.maps.CustomOverlay({
    position: pos[key].latlng
  });

  var content = document.createElement('div');
  content.className = 'wrap';

  var info = document.createElement('div');
  info.className = 'info';

  var title = document.createElement('div');
  title.className = 'title';
  title.appendChild(document.createTextNode(item.P_PARK));
  document.createe

  var closeBtn = document.createElement('button');
  closeBtn.className = 'close';

  var body = document.createElement('div');
  body.className = 'body';

  var imgDiv = document.createElement('div');
  imgDiv.className = 'img';

  var img = document.createElement('img');
  img.src = item.P_IMG;
  img.setAttribute('width', '73');
  img.setAttribute('height', '70');

  var desc = document.createElement('div');
  desc.className = 'desc';

  var ellipsis = document.createElement('div');
  ellipsis.className = 'ellipsis';
  ellipsis.appendChild(document.createTextNode("주소 :"));

  var jibun = document.createElement('div');
  jibun.className = 'jibun ellipsis';
  jibun.appendChild(document.createTextNode(item.P_ADDR));

  var div = document.createElement('div');

  var form = document.createElement('form');
  form.setAttribute('action', "park.htm");
  form.setAttribute('method', "post");

  var at = document.createElement('input');
  at.setAttribute('type', "submit");
  at.setAttribute('value', ' 공원 상세 정보 보기 ');

  var input = document.createElement('input');
  input.setAttribute('type', "hidden");
  input.setAttribute('name', 'P_PARK');
  input.setAttribute('value', item.P_PARK);

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
  div.appendChild(form);
  form.appendChild(at);
  form.appendChild(input);

  closeBtn.onclick = function() {
    overlay[key].setMap(null);
  };

  overlay[key].setContent(content);

  daum.maps.event.addListener(marker[key], 'click', function() {
    if (clickedOverlay) {
      clickedOverlay.setMap(null);
    }
    overlay[key].setMap(map);
    clickedOverlay = overlay[key];

    pos[key] = marker[key].getPosition();
    map.panTo(pos[key]);

  });

}