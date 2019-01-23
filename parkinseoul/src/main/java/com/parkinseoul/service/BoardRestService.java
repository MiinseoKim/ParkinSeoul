package com.parkinseoul.service;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.parkinseoul.dao.BoardDao;
import com.parkinseoul.dao.ParkDao;
import com.parkinseoul.dto.BoardDto;

@Service
public class BoardRestService {
  
  @Autowired
  SqlSession sqlSession;
  
  
  public List<BoardDto> getBoardList() {
    List<BoardDto> board=new ArrayList<BoardDto>();
    board = sqlSession.getMapper(BoardDao.class).getBoardList();
    System.out.println(board);
    return board;
  }

}
