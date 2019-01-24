package com.parkinseoul.controller;



import java.net.URLDecoder;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;
import com.parkinseoul.service.BoardService;
import com.parkinseoul.service.HeartService;
import com.parkinseoul.service.MemberRestService;
import com.parkinseoul.dto.BoardDto;
import com.parkinseoul.dto.LikeDto;
import com.parkinseoul.dto.MemberDto;


@Controller
public class HomeController {

  private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

  // 비동기
  @Autowired
  private View jsonview;

  
  @Autowired
  HeartService heartService;
  
  @Autowired
  BoardService boardService;

  @Autowired
  private MemberRestService mservice;
  


  @RequestMapping(value = "/home.htm")
  public String home(Model model) {
    List<LikeDto> like = heartService.likerank();
    List<BoardDto> board=boardService.boardRank();
    model.addAttribute("like", like);
    model.addAttribute("board", board);
    
    return "home.index";
  }


  @RequestMapping(value = "/getuser.htm")
  public View getuser(@RequestBody String id, Model model) {
    System.out.println(id.substring(3));
    String decode=URLDecoder.decode(id).substring(3);
    if (!decode.equals("")) {
      MemberDto member = mservice.infoMember(decode);
      System.out.println("getuser end");
      model.addAttribute("dto", member);

    }
    return jsonview;
  }

  @RequestMapping(value = "loginproc.htm")
  public void loginprocess(Authentication auth) {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    System.out.println(authentication.getName());
    System.out.println(authentication.getDetails());
    System.out.println("loginproc");

  }

  @RequestMapping(value = "join.htm")
  public String join() {
    System.out.println("login page");
    return "home.join";
  }


  @RequestMapping(value = "login.htm", method = RequestMethod.GET)
  public String login(Authentication auth) {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    System.out.println(authentication.getName());
    System.out.println(authentication.toString());
    System.out.println("login end");
    return "home.login";
  }
  

}
