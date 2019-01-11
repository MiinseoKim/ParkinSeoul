package com.parkinseoul.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.View;

@Service
public class LoginService {
  @Autowired
  private View jsonview;
  
  @Autowired
  SqlSession sqlSession;
  
    

}
