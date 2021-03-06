package com.parkinseoul.dto;

public class BoardDto {
  private int b_no;
  private String b_title;
  private String b_content;
  private int b_view;
  private String b_regdate;
  private String id;
  private String name;
  private int seq;
  
  
  
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
  
  public String getB_content() {
    return b_content;
  }
  public void setB_content(String b_content) {
    this.b_content = b_content;
  }
  public int getB_view() {
    return b_view;
  }
  public void setB_view(int b_view) {
    this.b_view = b_view;
  }
  public String getB_regdate() {
    return b_regdate;
  }
  public void setB_regdate(String b_regdate) {
    this.b_regdate = b_regdate;
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
    return "BoardDto [b_no=" + b_no + ", b_title=" + b_title + ", b_content=" + b_content
        + ", b_view=" + b_view + ", b_regdate=" + b_regdate + ", id=" + id + ", name=" + name
        + ", seq=" + seq + "]";
  }
  
  
  
  
}
