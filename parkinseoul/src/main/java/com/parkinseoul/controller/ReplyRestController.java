package com.parkinseoul.controller;

import java.text.SimpleDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.View;
import com.parkinseoul.dto.ReplyDto;
import com.parkinseoul.service.ReplyRestService;

@RestController
public class ReplyRestController {

  @Autowired
  private View jsonview;
  
  @Autowired
  ReplyRestService service; 
  
  @RequestMapping(value = "writerep.htm", method = RequestMethod.POST)
  public String insert(@RequestBody ReplyDto dto) {
    service.writeReply(dto);
    SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
    String time = format1.format (System.currentTimeMillis());
    return time;
  }
  //등록 삭제 추천up down
  
}
