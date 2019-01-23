package com.parkinseoul.controller;

import java.io.BufferedInputStream;
import java.net.URL;
import javax.servlet.http.HttpServletRequest;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;
import com.parkinseoul.dto.ParkDto;
import com.parkinseoul.service.HeartService;
import com.parkinseoul.service.MemberRestService;


@Controller
public class ParkController {

  @Autowired
  HeartService heartService;
  
  @Autowired
  private View jsonview;
  
  @Autowired
  MemberRestService memberService;
  
  public ParkDto dto =new ParkDto();
  
  @RequestMapping(value = "findpark.htm")
  public String list() {
      return "park.findpark";
  }
  
  @RequestMapping(value = "likeproc.htm", method = RequestMethod.POST)
  public View like(HttpServletRequest request,Model model) {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    System.out.println(authentication.getName());
    System.out.println(dto.getP_PARK());
    dto.setId(authentication.getName());
    if(heartService.checkLiked(dto)>0) {      
      heartService.deleteLike(dto);
      dto.setLikecount(dto.getLikecount()-1);
      model.addAttribute("updown", "minus");
    }else {
      heartService.insertLike(dto);
      dto.setLikecount(dto.getLikecount()+1);
      model.addAttribute("updown", "plus");
    }
    model.addAttribute("cnt", dto.getLikecount());
    request.setAttribute("dto", dto);
    return jsonview;
  }
  
  
  @RequestMapping(value = "park.htm")
  public String detail(@RequestParam String P_PARK, HttpServletRequest request) throws Exception {
    request.setCharacterEncoding("UTF-8");
    JSONParser parser=new JSONParser();
    JSONObject obj=(JSONObject)parser.parse(readUrl());
    JSONObject json =  (JSONObject) obj.get("SearchParkInfoService");
    JSONArray array = (JSONArray)json.get("row");
    for(int i = 0 ; i < array.size(); i++){        
        JSONObject entity = (JSONObject)array.get(i);
        if(entity.get("P_PARK").equals(P_PARK)) {
          dto.setP_IDX(Integer.parseInt((String)entity.get("P_IDX")));
          dto.setP_PARK((String)entity.get("P_PARK"));
          dto.setP_LIST_CONTENT((String)entity.get("P_LIST_CONTENT"));
          dto.setArea((String)entity.get("AREA"));
          dto.setOpen_dt((String)entity.get("OPEN_DT"));
          dto.setMain_equip((String)entity.get("MAIN_EQUIP"));
          dto.setMain_plants((String)entity.get("MAIN_PLANTS"));
          dto.setGuidance((String)entity.get("GUIDANCE"));
          dto.setVisit_road((String)entity.get("VISIT_ROAD"));
          dto.setUse_reffer((String)entity.get("USE_REFER"));
          dto.setP_IMG((String)entity.get("P_IMG"));
          dto.setP_ZONE((String)entity.get("P_ZONE"));
          dto.setP_ADDR((String)entity.get("P_ADDR"));
          dto.setP_NAME((String)entity.get("P_NAME"));
          dto.setP_ADMINTEL((String)entity.get("P_ADMINTEL"));
          dto.setG_LONGITUDE((String)entity.get("G_LONGITUDE"));
          dto.setG_LATITUDE((String)entity.get("G_LATITUDE"));
          dto.setLongitude((String)entity.get("LONGITUDE"));
          dto.setLatitude((String)entity.get("LATITUDE"));
          dto.setTemplate_url((String)entity.get("TEMPLATE_URL"));
          dto.setLikecount(heartService.getLikeCnt(dto.getP_IDX()));
          break;
        }          
    }
    System.out.println(dto);
    request.setAttribute("dto", dto);
      return "park.aboutpark";
  }
  
  
  public String readUrl() throws Exception{
    BufferedInputStream reader = null;
    try {
        String api="http://openAPI.seoul.go.kr:8088/4e495075516d6969373872544e4a6a/json/SearchParkInfoService/1/200/";
        URL url = new URL(api);
        reader = new BufferedInputStream(url.openStream());
        StringBuffer buffer = new StringBuffer();
        int i;
        byte[] b = new byte[4096];
        while( (i = reader.read(b)) != -1){
          buffer.append(new String(b, 0, i));
        }
        return buffer.toString();
    } finally {
        if (reader != null)
            reader.close();
    }
  }
  
  
  
  
  
  
}
