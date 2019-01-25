package com.parkinseoul.controller;


import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;
import com.parkinseoul.service.BoardService;
import com.parkinseoul.service.ReplyRestService;
import com.parkinseoul.dto.BoardDto;
import com.parkinseoul.dto.ReplyDto;

@Controller
public class BoardController {

  @Autowired
  private View jsonview;
  
  @Autowired
  private BoardService service;
  
  @Autowired
  private ReplyRestService rservice;
  
  
  
  @RequestMapping(value = "/boardlist.htm")
  public String list(Model model) {
    List<BoardDto> list=service.getBoardList();
    model.addAttribute("boardlist", list);
    return "board.list";
  }
  
  
  @RequestMapping(value = "/write.htm")
  public String write() {
    return "board.write";
  }
  
  @RequestMapping(value = "/writeproc.htm", method = RequestMethod.POST)
  public View writeproc(@RequestBody BoardDto dto, Model model) {
    int result=service.insertBoard(dto);
    model.addAttribute("article",dto);
    return jsonview;
  }
  
  @RequestMapping(value = "/article.htm",method=RequestMethod.GET )
  public String detail(HttpServletRequest request, Model model) {
    int bnum=Integer.parseInt(request.getParameter("no"));    
    BoardDto article=service.getBoardDetail(bnum);
    List<ReplyDto> reply= rservice.getReplyList(bnum);
    int repcnt=rservice.getrepCnt(bnum);
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    if(!article.getId().equals(authentication.getName())) {
      service.updateView(bnum);
      article.setB_view(article.getB_view()+1);
    }
    model.addAttribute("article", article);
    model.addAttribute("replylist", reply);
    model.addAttribute("repcnt", repcnt);
    return "board.detail";
  }
  
  @RequestMapping(value = "/delete.htm" ,method=RequestMethod.POST)
  public String delete(int no) {
    service.deleteBoard(no);
    return "board.list";
  }
  
  
  @RequestMapping(value = "/edit.htm" )
  public String edit(@RequestParam String no, Model model) {
    BoardDto dto=service.getBoardDetail(Integer.parseInt(no));
    System.out.println(dto);
    model.addAttribute("article", dto);
    return "board.edit";
  }
  
  
  @RequestMapping(value = "/editproc.htm" )
  public View editproc(@RequestBody BoardDto dto) {
    int a=service.updateBoard(dto);
    return jsonview;
  }
  
  
}
