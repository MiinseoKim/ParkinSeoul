package com.parkinseoul.service;

import java.util.Map;
import com.parkinseoul.dto.MemberDto;

public interface MemberRestService {
  
  String selectMember();

  MemberDto infoMember(String id);

  void insertMember(MemberDto memberDto);

  void updateMember(MemberDto memberDto);

  void deleteMember(MemberDto memberDto);
  
  int idcheck(String id);
  
  int namecheck(String name);

  String searchMember(MemberDto memberDto);

//  void insertKakao(MemberDto memberDto);
  
}
