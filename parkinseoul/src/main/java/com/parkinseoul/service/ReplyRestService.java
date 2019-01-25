package com.parkinseoul.service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.parkinseoul.dao.ReplyDao;
import com.parkinseoul.dto.ReplyDto;

@Service
public class ReplyRestService {

  @Autowired
  SqlSession sqlSession;
  
  
  public List<ReplyDto> getReplyList(int b_no) {
    List<ReplyDto> reply=sqlSession.getMapper(ReplyDao.class).getReplyList(b_no);
    return reply;
  }
  
  @Transactional
  public int writeReply(ReplyDto dto) {
    int a =sqlSession.getMapper(ReplyDao.class).writeReply(dto);
    return a;
  }
  
  @Transactional
  public int deleteReply(int r_no) {
    int a =sqlSession.getMapper(ReplyDao.class).deleteReply(r_no);
    return a;
  }
  
  public int getrepCnt(int b_no) {
    int a =sqlSession.getMapper(ReplyDao.class).getReplyCnt(b_no);
    return a;
  }
}
