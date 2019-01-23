package com.parkinseoul.dao;

import java.util.List;
import com.parkinseoul.dto.LikeDto;
import com.parkinseoul.dto.ParkDto;

public interface ParkDao {
  int getLikeCnt(int P_IDX);
  
  int checkLiked(ParkDto dto);
  
  int insertLike(ParkDto dto);
  
  int deleteLike(ParkDto dto);
  
  List<LikeDto> myLikelist(String id);
  
}
