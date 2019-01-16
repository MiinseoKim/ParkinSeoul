<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Naver login service</title>
</head>
<body>
	<script type="text/javascript"
		src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
		charset="utf-8"></script>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script type="text/javascript">
  var naver_id_login = new naver_id_login("dcDbM7Yxxl3oWl91et2n", "http://localhost:8090/parkinseoul/callback.jsp");
  // 접근 토큰 값 출력
  //alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    var param =JSON.stringify({
      "id":naver_id_login.getProfileData('email'),
      "name":naver_id_login.getProfileData('name'),
      "password":naver_id_login.getProfileData('id')
    });
    $.ajax({
      type:'POST',
      url:'idcheck.htm',
      data : {"id":naver_id_login.getProfileData('email')},
      contentType: 'application/json;charset=UTF-8',
      dataType:"json",
      success:function(data){
        console.log(data.cnt);
        if(data.cnt==0){
          console.log("insert ajax");
          $.ajax({
            type:'POST',
            contentType: 'application/json;charset=UTF-8',
            url:'memberrest.htm',
            data : param,
            success:function(){
              console.log("login");
              $.ajax({
                type:'post',
                url:'login',
                data : {"username":naver_id_login.getProfileData('email'),"password":naver_id_login.getProfileData('id')},
                success:function(data){
                  window.close(); 
                  window.opener.location.href="home.htm"
                }
              });
            }
          });
        }else{
          $.ajax({
            type:'post',
            url:'login',
            data : {"username":naver_id_login.getProfileData('email'),"password":naver_id_login.getProfileData('id')},
            success:function(){
              window.close(); 
              window.opener.location.href="home.htm"
            }
          });
        }
      },
      error:function(error) {
        console.log(error);
        console.log(error.status);
      }
    }); 
  }
</script>

</body>
</html>