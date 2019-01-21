package com.parkinseoul.dao;

import java.util.List;
import com.parkinseoul.dto.MemberDto;

public interface MemberDao {
 
  int getSeq(MemberDto memberDto);
  
  int getAuthority(String string);
  
  void insertUsers(MemberDto memberDto);
  
  int idcheck(String id);
  
  MemberDto infoMember(String id);
  
  
  
  
  List<MemberDto> selectMember();
  
  void deleteUsers(int seq);
  
  

  List<MemberDto> searchMember(MemberDto memberDto);
  
}
