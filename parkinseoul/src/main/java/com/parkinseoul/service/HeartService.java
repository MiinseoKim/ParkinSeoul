package com.parkinseoul.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.parkinseoul.dao.ParkDao;
import com.parkinseoul.dto.ParkDto;

@Service
public class HeartService {

  @Autowired
  SqlSession sqlSession;
  
  
  public int getLikeCnt(int pnum) {
    int count = 0;
    count = sqlSession.getMapper(ParkDao.class).getLikeCnt(pnum);
    return count;
  }
  
  public int checkLiked(ParkDto parkDto) {
    int count = 0;
    count = sqlSession.getMapper(ParkDao.class).checkLiked(parkDto);
    return count;
  }
  
  @Transactional
  public int insertLike(ParkDto parkDto) {
    int a=sqlSession.getMapper(ParkDao.class).insertLike(parkDto);
    System.out.println(a);
    return a;
  }
  
  @Transactional
  public void deleteLike(ParkDto parkDto) {
    sqlSession.getMapper(ParkDao.class).deleteLike(parkDto);
  }

}