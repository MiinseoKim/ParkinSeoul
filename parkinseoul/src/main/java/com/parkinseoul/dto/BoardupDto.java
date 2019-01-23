package com.parkinseoul.dto;

public class BoardupDto {
  private int seq;
  private int b_no;
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
  @Override
  public String toString() {
    return "BoardupDto [seq=" + seq + ", b_no=" + b_no + "]";
  }
  
  

}
