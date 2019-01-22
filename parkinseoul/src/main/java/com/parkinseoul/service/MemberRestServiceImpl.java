package com.parkinseoul.service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.parkinseoul.dao.MemberDao;
import com.parkinseoul.dto.MemberDto;

@Service
public class MemberRestServiceImpl implements MemberRestService {

  @Autowired
  SqlSession sqlSession;

  @Autowired
  BCryptPasswordEncoder encoder;

  @Transactional
  @Override
  public void insertMember(MemberDto memberDto) {
    memberDto.setAuth_seq(1);
    memberDto.setPassword(encoder.encode(memberDto.getPassword()));
    sqlSession.getMapper(MemberDao.class).insertUsers(memberDto);
    System.out.println("insert done");
  }

  @Transactional
  @Override
  public void updateMember(MemberDto memberDto) {
    memberDto.setSeq(sqlSession.getMapper(MemberDao.class).getSeq(memberDto));
    // sqlSession.getMapper(MemberDao.class).updateMember(memberDto);
  }

  @Override
  public MemberDto infoMember(String id) {
    MemberDto member = sqlSession.getMapper(MemberDao.class).infoMember(id);
    System.out.println("infoMemberend");
    return member;
  }

  
  @Override
  public int idcheck(String id) {
    int count = 0;
    count = sqlSession.getMapper(MemberDao.class).idcheck(id);
    return count;
  }
  
  @Override
  public int namecheck(String name) {
    int count = 0;
    count = sqlSession.getMapper(MemberDao.class).namecheck(name);
//    System.out.println("service " + count);
    return count;
  }
  
  
  
  
  
  
  
  
  
  @Override
  public String selectMember() {
    List<MemberDto> list = sqlSession.getMapper(MemberDao.class).selectMember();
    JSONArray array = new JSONArray();
    for (MemberDto memberDto : list) {
      JSONObject mem = new JSONObject();
      mem.put("seq", memberDto.getSeq());
      mem.put("id", memberDto.getId());
      mem.put("name", memberDto.getName());
      // mem.put("phone", memberDto.getPhone());
      // mem.put("email", memberDto.getEmail());
      array.put(mem);
    }

    return array.toString();
  }


  @Transactional
  @Override
  public void deleteMember(MemberDto memberDto) {
    memberDto.setSeq(sqlSession.getMapper(MemberDao.class).getSeq(memberDto));
    // sqlSession.getMapper(MemberDao.class).deleteMember(memberDto.getSeq());
    sqlSession.getMapper(MemberDao.class).deleteUsers(memberDto.getSeq());
  }

  

  @Override
  public String searchMember(MemberDto memberDto) {
    List<MemberDto> list = sqlSession.getMapper(MemberDao.class).searchMember(memberDto);
    JSONArray array = new JSONArray();
    for (MemberDto member : list) {
      JSONObject mem = new JSONObject();
      mem.put("seq", member.getSeq());
      mem.put("id", member.getId());
      mem.put("name", member.getName());
      array.put(mem);
    }
    System.out.println(array.toString());
    return array.toString();
  }
}
