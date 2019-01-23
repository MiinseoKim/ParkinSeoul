package com.parkinseoul.dto;

public class LikeDto {

  private int park_num;
  private String park_name;
  private String id;

  // 좋아요 순위 
  private int count;
  
  
  public int getCount() {
    return count;
  }
  public void setCount(int count) {
    this.count = count;
  }
  public int getPark_num() {
    return park_num;
  }
  public void setPark_num(int park_num) {
    this.park_num = park_num;
  }
  public String getPark_name() {
    return park_name;
  }
  public void setPark_name(String park_name) {
    this.park_name = park_name;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  
}
