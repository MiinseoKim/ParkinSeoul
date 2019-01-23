package com.parkinseoul.dao;

import java.util.List;
import com.parkinseoul.dto.LikeDto;
import com.parkinseoul.dto.ParkDto;

public interface ParkDao {
  int getLikeCnt(int P_IDX);
  
  int checkLiked(ParkDto dto);
  
  int insertLike(ParkDto dto);
  
  int deleteLike(ParkDto dto);
  
  int mydeletelike(LikeDto likeDto);
  
  int deleteuser(String id);
  
  List<LikeDto> myLikelist(String id);
  
}
