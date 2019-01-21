package com.parkinseoul.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class BoardRestService {
  
  @Autowired
  SqlSession sqlSession;

}
