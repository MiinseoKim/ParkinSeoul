package com.parkinseoul.dto;

public class BoardupDto {
  private int seq;
  private int b_no;
  
  //for rank
  private String b_title;
  private int count;
  
  
  public int getSeq() {
    return seq;
  }
  public void setSeq(int seq) {
    this.seq = seq;
  }
  public int getB_no() {
    return b_no;
  }
  public void setB_no(int b_no) {
    this.b_no = b_no;
  }
  public String getB_title() {
    return b_title;
  }
  public void setB_title(String b_title) {
    this.b_title = b_title;
  }
  public int getCount() {
    return count;
  }
  public void setCount(int count) {
    this.count = count;
  }
  @Override
  public String toString() {
    return "BoardupDto [seq=" + seq + ", b_no=" + b_no + ", b_title=" + b_title + ", count=" + count
        + "]";
  }

  

}
