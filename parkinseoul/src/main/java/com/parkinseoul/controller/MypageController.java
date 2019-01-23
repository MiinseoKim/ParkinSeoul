package com.parkinseoul.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.parkinseoul.dto.LikeDto;
import com.parkinseoul.dto.MemberDto;
import com.parkinseoul.dto.ParkDto;
import com.parkinseoul.service.HeartService;


@Controller
//@RequestMapping("mypage/")
public class MypageController {
  
  @Autowired
  HeartService heartService;
  
  @RequestMapping(value = "me.htm")
  public String me() {
    return "mypage.mypage";
  }

  @RequestMapping(value = "hearts.htm")
  public String hearts(Model model) {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String id = authentication.getName();
    List<LikeDto> list = heartService.myLikelist(id);
    model.addAttribute("list", list);
    
    return "mypage.hearts";
  }

  @RequestMapping(value = "mydeletelike.htm")
  public String mydeletelike(int park_num) {
    LikeDto dto = new LikeDto();
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    dto.setId(authentication.getName());
    dto.setPark_num(park_num);
    
    heartService.mydeletelike(dto);
    
    return "mypage.hearts";
    
  }

}
