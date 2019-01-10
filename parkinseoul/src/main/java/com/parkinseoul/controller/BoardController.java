package com.parkinseoul.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

  @RequestMapping(value = "boardlist.htm")
  public String list() {
    return "board.list";
  }
}
