package com.parkinseoul.service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.parkinseoul.dao.ReplyDao;
import com.parkinseoul.dto.ReplyDto;

@Service
public class ReplyRestService {

  @Autowired
  SqlSession sqlSession;
  
  
  public List<ReplyDto> getReplyList(int b_no) {
    List<ReplyDto> reply=sqlSession.getMapper(ReplyDao.class).getReply(b_no);
    return reply;
  }
  
  public int writeReply(ReplyDto dto) {
    int a =sqlSession.getMapper(ReplyDao.class).writeReply(dto);
    return a;
  }
}
