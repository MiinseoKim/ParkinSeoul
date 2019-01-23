package com.parkinseoul.dao;

import com.parkinseoul.dto.BoardupDto;

public interface BoardupDao {

  // 추천 처리
  int getUpCnt(int b_no);

  int chkUp(BoardupDto dto);

  int upPlus(BoardupDto dto);

  int upMinus(BoardupDto dto);
}
