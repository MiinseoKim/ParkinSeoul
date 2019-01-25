package com.parkinseoul.controller;

import java.net.URLDecoder;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.View;
import com.parkinseoul.dto.MemberDto;
import com.parkinseoul.service.MemberRestService;



@RestController
public class MemberRestController {

  @Autowired
  private View jsonview;
  
  @Autowired
  MemberRestService memberRestService;

  @RequestMapping(value = "memberrest.htm", method = RequestMethod.POST)
  public void insert(@RequestBody MemberDto memberDto) {
    memberRestService.insertMember(memberDto);
  }
  
  @RequestMapping(value = "memberrest.htm", method = RequestMethod.PUT)
  public void update(@RequestBody MemberDto memberDto) {
    System.out.println("Hello update");
    System.out.println(memberDto);
    memberRestService.updateMember(memberDto);
  }

  @RequestMapping(value = "idcheck.htm", method = RequestMethod.POST)
  public View idcheck(@RequestBody String id,Model model) {
    int count = 0;
    System.out.println(id);
    String decode=URLDecoder.decode(id).substring(3);
    System.out.println(decode);
    count = memberRestService.idcheck(decode);
    model.addAttribute("cnt", count);
   // map.put("cnt", count);

    return jsonview;
  }
  
  @RequestMapping(value = "namecheck.htm", method = RequestMethod.POST)
  public View namecheck(@RequestBody String name, Model model) {
    int count = 0;
//    System.out.println(name);
//    String decode = URLDecoder.decode(name).substring(3);
//    System.out.println("decode " + decode);
    count = memberRestService.namecheck(name);
    System.out.println(count);
    model.addAttribute("cnt", count);
    
    return jsonview;
  }

  
  
  
  
  
  @RequestMapping(value = "memberrest/{id}", method = RequestMethod.GET)
  public String detail(@PathVariable(value="id") String id) {
    return memberRestService.infoMember(id).toString();
  }
  
}
