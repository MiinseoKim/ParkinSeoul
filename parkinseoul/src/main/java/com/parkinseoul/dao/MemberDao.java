package com.parkinseoul.dao;

import java.util.List;
import com.parkinseoul.dto.MemberDto;

public interface MemberDao {
 
  int getSeq(String id);
  
  int getAuthority(String string);
  
  void insertUsers(MemberDto memberDto);
  
  void updateMember(MemberDto memberDto);
  
  int idcheck(String id);
  
  int namecheck(String name);
  
  MemberDto infoMember(String id);
  
  
  
  
}
