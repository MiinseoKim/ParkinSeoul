package com.parkinseoul.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.View;
import com.parkinseoul.service.BoardRestService;

@RestController
public class BoardRestController {

  @Autowired
  private View jsonview;
  
  @Autowired
  private BoardRestService service;
  
  
  @RequestMapping(value = "/getlist.htm" ,method = RequestMethod.GET)
  public String list() {
    return "home.index";
  }
}
