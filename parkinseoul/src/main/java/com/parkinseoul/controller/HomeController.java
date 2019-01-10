package com.parkinseoul.controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

@Controller
public class HomeController {

  private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
  
  //비동기
  @Autowired
  private View jsonview;


  @RequestMapping(value = "/home.htm")
  public String home() {
    return "home.index";
  }

  @RequestMapping(value = "login.htm")
  public String login() {
    return "home.login";
  }

  @RequestMapping(value = "join.htm")
  public String join() {
    return "home.join";
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
