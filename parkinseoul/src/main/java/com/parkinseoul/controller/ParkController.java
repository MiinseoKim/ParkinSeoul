package com.parkinseoul.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ParkController {

  @RequestMapping(value = "findpark.htm")
  public String list() {
      return "park.findpark";
  }
}
