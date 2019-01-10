package com.parkinseoul.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("tes/")
public class ResttController {
  
  @RequestMapping(value = "test1.htm" )
  public /*ModelAndView View */void test(Model model) {
   // ModelAndView mav = new ModelAndView();
    System.out.println("test1 d restcontroller");
   //model.addAttribute("result", "success");
   // return "success";
  }

}
