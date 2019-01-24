package com.parkinseoul.controller;

import java.text.SimpleDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
  
  @RequestMapping(value = "reply.htm", method = RequestMethod.POST)
  public View insert(@RequestBody ReplyDto dto,Model model) {
    service.writeReply(dto);
    SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
    dto.setR_regdate(format1.format (System.currentTimeMillis()));
    model.addAttribute("insertrep", dto);
    return jsonview;
  }
  //등록 삭제 추천up down
  @RequestMapping(value = "reply.htm", method = RequestMethod.DELETE)
  public void deleterep(@RequestBody ReplyDto dto) {
    service.deleteReply(dto.getR_no());
  }
}
