package com.parkinseoul.dao;

import com.parkinseoul.dto.ParkDto;

public interface ParkDao {
  int getLikeCnt(int P_IDX);
  
  int checkLiked(ParkDto dto);
  
  int insertLike(ParkDto dto);
  
  int deleteLike(ParkDto dto);
}
