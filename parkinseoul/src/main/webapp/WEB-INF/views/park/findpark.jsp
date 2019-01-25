<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section id="page-breadcrumb">
	<div class="vertical-center sun">
		<div class="container">
			<div class="row">
				<div class="action">
					<div class="col-sm-12">
						<h1 class="title">Find Park</h1>
						<p>
							서울시&nbsp;&nbsp;<select id="gu" name="gu">
								<option value="all">전체</option>
							</select>&nbsp;&nbsp;&nbsp;공원을 찾아보세요!
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<div id="map" style="width: 100%; height: 700px;"></div>
<br>
<br>

<br>
<br>
<script type="text/javascript"
  src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d9e23a5363a7bc0c5284bc04e7e8dd07"></script>
<link href="css/map.css" rel="stylesheet">
<script type="text/javascript" src="js/findpark.js"></script>







