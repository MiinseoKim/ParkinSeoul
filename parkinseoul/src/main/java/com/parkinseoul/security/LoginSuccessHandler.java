package com.parkinseoul.security;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import com.parkinseoul.service.MemberRestService;
import com.parkinseoul.dto.MemberDto;



public class LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler{
  private static int TIME = 60 * 60; // 1시간
  
  @Autowired
  private MemberRestService service;
  
  @Override
  public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException {
    //세션타임아웃 수정 및 마지막 로그인 일시 기록하기
    request.getSession().setMaxInactiveInterval(TIME);
  //  userService.updateLoginDateBy(((User) auth.getPrincipal()).getId()); 
    
 //   MemberDto member = service.infoMember(auth.getName());
//    request.getSession().setAttribute("id",auth.getName() );
//    request.getSession().setAttribute("name", member.getName());
//    request.getSession().setAttribute("pwd", member.getPassword());
    
    System.out.println(auth.getName());
    System.out.println(auth.getDetails());
    System.out.println(request.getParameter("name"));
    System.out.println(auth.getPrincipal().toString());
  //  super.onAuthenticationSuccess(request, response, auth);
    response.sendRedirect(request.getContextPath() +  "/homein.htm");
   
    

  }
}
