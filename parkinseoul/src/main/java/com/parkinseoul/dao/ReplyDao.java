package com.parkinseoul.dao;

import java.util.List;
import com.parkinseoul.dto.ReplyDto;

public interface ReplyDao {
  
  //댓글 처리
  List<ReplyDto> getReply(int b_no);
  
  int writeReply(ReplyDto dto);
  
  int deleteReply(int c_no);
}
