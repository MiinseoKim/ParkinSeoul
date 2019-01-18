package com.parkinseoul.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ParkController {

  @RequestMapping(value = "findpark.htm")
  public String list() {
      return "park.findpark";
  }
  
  @RequestMapping(value = "park.htm", method = RequestMethod.POST)
  public String detailproc(@RequestParam String autoparkname, HttpServletRequest request) {
    System.out.println(autoparkname);
    request.setAttribute("parkname", autoparkname);
      return "park.aboutpark";
  }
  

}
