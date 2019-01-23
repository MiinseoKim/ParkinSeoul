package com.parkinseoul.dto;

public class ReplyDto {
  private int r_no;
  private String r_content;
  private String r_regdate;
  private int b_no;
  private String id;
  private String name;
  private int seq;
  
  
  
  
  public int getR_no() {
    return r_no;
  }
  public void setR_no(int r_no) {
    this.r_no = r_no;
  }
  public String getR_content() {
    return r_content;
  }
  public void setR_content(String r_content) {
    this.r_content = r_content;
  }
  public String getR_regdate() {
    return r_regdate;
  }
  public void setR_regdate(String r_regdate) {
    this.r_regdate = r_regdate;
  }
  public int getB_no() {
    return b_no;
  }
  public void setB_no(int b_no) {
    this.b_no = b_no;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public int getSeq() {
    return seq;
  }
  public void setSeq(int seq) {
    this.seq = seq;
  }
  @Override
  public String toString() {
    return "ReplyDto [r_no=" + r_no + ", r_content=" + r_content + ", r_regdate=" + r_regdate
        + ", b_no=" + b_no + ", id=" + id + ", name=" + name + ", seq=" + seq + "]";
  }
  
  
}
