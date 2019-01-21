package com.parkinseoul.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.View;

@RestController
public class BoardController {

  @Autowired
  private View jsonview;
  
}
