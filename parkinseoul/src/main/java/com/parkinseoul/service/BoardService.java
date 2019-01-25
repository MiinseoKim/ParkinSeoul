package com.parkinseoul.service;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.parkinseoul.dao.BoardDao;
import com.parkinseoul.dao.BoardupDao;
import com.parkinseoul.dto.BoardDto;
import com.parkinseoul.dto.BoardupDto;

@Service
public class BoardService {
  
  @Autowired
  SqlSession sqlSession;
  
  
  public List<BoardDto> getBoardList() {
    List<BoardDto> board=new ArrayList<BoardDto>();
    board = sqlSession.getMapper(BoardDao.class).getBoardList();
    return board;
  }
  
  @Transactional
  public int insertBoard(BoardDto dto) {
    int a = sqlSession.getMapper(BoardDao.class).writeBoard(dto);
    return a;
  }
  
  @Transactional
  public int updateView(int b_no) {
    int a =sqlSession.getMapper(BoardDao.class).viewPlus(b_no);
    return a;
  }
  
  public BoardDto getBoardDetail(int b_no) {
    BoardDto dto=sqlSession.getMapper(BoardDao.class).getBoardDetail(b_no);
    return dto;
  }
  
  @Transactional
  public int deleteBoard(int b_no) {
    int a=sqlSession.getMapper(BoardDao.class).deleteBoard(b_no);
    return a;
  }
  
  
  @Transactional
  public int updateBoard(BoardDto dto) {
    int a=sqlSession.getMapper(BoardDao.class).editBoard(dto);
    return a;
  }
  
  
  public List<BoardupDto> boardRank() {
    List<BoardupDto> board=new ArrayList<BoardupDto>();
    board=sqlSession.getMapper(BoardDao.class).boardRank();
    return board;
  }
  
  


  
  public int getUpCnt(int bnum) {
    int count = 0; 
    count = sqlSession.getMapper(BoardupDao.class).getUpCnt(bnum);
    return count;
  }
  
  public int upChk(BoardupDto budto) {
    int count = 0;
    count = sqlSession.getMapper(BoardupDao.class).chkUp(budto);
    return count;
  }
  
  @Transactional
  public int insertUp(BoardupDto budto) {
    int a=sqlSession.getMapper(BoardupDao.class).upPlus(budto);
    return a;
  }
  
  @Transactional
  public void deleteUp(BoardupDto budto) {
    sqlSession.getMapper(BoardupDao.class).upMinus(budto);
  }
}
