package com.parkinseoul.service;

import java.util.Map;
import com.parkinseoul.dto.MemberDto;

public interface MemberRestService {


  MemberDto infoMember(String id);

  void insertMember(MemberDto memberDto);

  void updateMember(MemberDto memberDto);
  
  int idcheck(String id);
  
  int namecheck(String name);

  int getSeq(String id);
  
}
