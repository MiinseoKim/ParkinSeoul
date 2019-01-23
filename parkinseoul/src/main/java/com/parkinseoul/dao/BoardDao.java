package com.parkinseoul.dao;

import java.util.List;
import com.parkinseoul.dto.BoardDto;
import com.parkinseoul.dto.BoardupDto;
import com.parkinseoul.dto.ReplyDto;

public interface BoardDao {

  List<BoardDto> getBoardList();
  
  BoardDto getBoardDetail(int b_no);
  
  int writeBoard(BoardDto dto);
  
  int editBoard(BoardDto dto);
  
  int deleteBoard(int b_no);
  
  int getViewCnt(int b_no);
  
  int viewPlus(int b_no);
  
  //int getArticleSeq()
  
}
