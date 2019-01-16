package com.parkinseoul.security;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Controller;
import com.parkinseoul.service.MemberRestService;
import com.parkinseoul.dto.MemberDto;



public class LoginSuccessHandler implements AuthenticationSuccessHandler{
  private static int TIME = 60 * 60; // 1시간
 
  //MemberRestService service=new MemberRestServiceImpl();
  
  @Autowired
  private MemberRestService service;
  
  @Override
  public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException {
    //세션타임아웃 수정 및 마지막 로그인 일시 기록하기
    request.getSession().setMaxInactiveInterval(TIME); 
/*    System.out.println(auth.getName()+" loginsuccess");
    MemberDto member = service.infoMember(auth.getName());
    System.out.println(member);*/
    request.getSession().setAttribute("dto", auth.getName());
    
    //System.out.println(auth.getDetails());
   // System.out.println(auth.getPrincipal().toString());
  //  super.onAuthenticationSuccess(request, response, auth);
    response.sendRedirect(request.getContextPath() +  "/home.htm");
   
    

  }
}
