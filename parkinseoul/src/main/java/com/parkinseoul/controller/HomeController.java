package com.parkinseoul.controller;



import java.security.Principal;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import com.parkinseoul.service.LoginService;
import com.parkinseoul.service.MemberRestService;
import com.parkinseoul.dto.MemberDto;


@Controller
public class HomeController {

  private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
  
  //비동기
  @Autowired
  private View jsonview;

  @Autowired
  private MemberRestService service;

  @RequestMapping(value = "/home.htm")
  public String home() {
   
    return "home.index";
  }
  
  @RequestMapping(value = "/homein.htm")
  public String home2(Authentication auth,Model model) {
    System.out.println(auth.getName());
    if(auth.getName()!=null)
    {
      MemberDto member = service.infoMember(auth.getName());
      System.out.println(member.toString());
      model.addAttribute("dto",member);
    }
    return "home.index";
  }

  @RequestMapping(value = "loginproc.htm")
  public void loginprocess(Authentication auth) {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    System.out.println(authentication.getName());
    System.out.println(authentication.getDetails());
    System.out.println("loginproc");
    
  }

  @RequestMapping(value = "join.htm")
  public String join() {
    System.out.println("login page");
    return "home.join";
  }
  
  @RequestMapping(value="login.htm",method=RequestMethod.GET)
  public String login(Authentication auth) {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    System.out.println(authentication.getName());
    System.out.println(authentication.toString());
    System.out.println("login");
      return "home.login";
  }
  
  
  
  
  //test
  @ResponseBody
  @RequestMapping(value = "test.htm")
  public /*ModelAndView View*/void test(Model model) {
   // ModelAndView mav = new ModelAndView();
    System.out.println("ajax");
   //model.addAttribute("result", "success");
   // return "success";
  }

}
