package com.parkinseoul.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

  @RequestMapping(value = "me.htm")
  public String me() {
      return "mypage.mypage";
  }
  
  @RequestMapping(value = "hearts.htm")
  public String hearts() {
      return "mypage.hearts";
  }

  
}
