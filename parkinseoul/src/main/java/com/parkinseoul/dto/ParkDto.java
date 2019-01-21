package com.parkinseoul.dto;

public class ParkDto {
  private int P_IDX;                //공원 번호
  private String P_PARK;            //공원 이름
  private String P_LIST_CONTENT;    //공원 개요
  private String area;              //공원 면적
  private String open_dt;           //개원일
  private String main_equip;        //주요시설
  private String main_plants;       //주요식물
  private String guidance;          //안내도
  private String visit_road;        //오시는길
  private String use_reffer;         //이용시참고사항
  private String P_IMG;             //이미지
  private String P_ZONE;            //지역
  private String P_ADDR;            //공원주소
  private String P_NAME;            //관리부서
  private String P_ADMINTEL;        //전화번호
  private String G_LONGITUDE;       //X좌표(GRS80TM)
  private String G_LATITUDE;        //Y좌표(GRS80TM)
  private String longitude;         //X좌표(WGS84)
  private String latitude;          //Y좌표(WGS84)
  private String template_url;      //홈페이지 바로가기
  
  
  /*like 기능용 변수 */
  private int likecount;           //해당 공원 좋아요수
  private String id;               //회원 id
  
  
  public int getP_IDX() {
    return P_IDX;
  }
  public void setP_IDX(int p_IDX) {
    P_IDX = p_IDX;
  }
  public String getP_PARK() {
    return P_PARK;
  }
  public void setP_PARK(String p_PARK) {
    P_PARK = p_PARK;
  }
  public String getP_LIST_CONTENT() {
    return P_LIST_CONTENT;
  }
  public void setP_LIST_CONTENT(String p_LIST_CONTENT) {
    P_LIST_CONTENT = p_LIST_CONTENT;
  } 
  public String getArea() {
    return area;
  }
  public void setArea(String area) {
    this.area = area;
  }
  public String getOpen_dt() {
    return open_dt;
  }
  public void setOpen_dt(String open_dt) {
    this.open_dt = open_dt;
  }
  public String getMain_equip() {
    return main_equip;
  }
  public void setMain_equip(String main_equip) {
    this.main_equip = main_equip;
  }
  public String getMain_plants() {
    return main_plants;
  }
  public void setMain_plants(String main_plants) {
    this.main_plants = main_plants;
  }
  public String getGuidance() {
    return guidance;
  }
  public void setGuidance(String guidance) {
    this.guidance = guidance;
  }
  public String getVisit_road() {
    return visit_road;
  }
  public void setVisit_road(String visit_road) {
    this.visit_road = visit_road;
  }
  public String getUse_reffer() {
    return use_reffer;
  }
  public void setUse_reffer(String use_reffer) {
    this.use_reffer = use_reffer;
  }
  public String getP_IMG() {
    return P_IMG;
  }
  public void setP_IMG(String p_IMG) {
    P_IMG = p_IMG;
  }
  public String getP_ZONE() {
    return P_ZONE;
  }
  public void setP_ZONE(String p_ZONE) {
    P_ZONE = p_ZONE;
  }
  public String getP_ADDR() {
    return P_ADDR;
  }
  public void setP_ADDR(String p_ADDR) {
    P_ADDR = p_ADDR;
  }
  public String getP_NAME() {
    return P_NAME;
  }
  public void setP_NAME(String p_NAME) {
    P_NAME = p_NAME;
  }
  public String getP_ADMINTEL() {
    return P_ADMINTEL;
  }
  public void setP_ADMINTEL(String p_ADMINTEL) {
    P_ADMINTEL = p_ADMINTEL;
  }
  public String getG_LONGITUDE() {
    return G_LONGITUDE;
  }
  public void setG_LONGITUDE(String g_LONGITUDE) {
    G_LONGITUDE = g_LONGITUDE;
  }
  public String getG_LATITUDE() {
    return G_LATITUDE;
  }
  public void setG_LATITUDE(String g_LATITUDE) {
    G_LATITUDE = g_LATITUDE;
  }  
  public String getLongitude() {
    return longitude;
  }
  public void setLongitude(String longitude) {
    this.longitude = longitude;
  }
  public String getLatitude() {
    return latitude;
  }
  public void setLatitude(String latitude) {
    this.latitude = latitude;
  }
  public String getTemplate_url() {
    return template_url;
  }
  public void setTemplate_url(String template_url) {
    this.template_url = template_url;
  }
  
  /*for likes*/
  public int getLikecount() {
    return likecount;
  }
  public void setLikecount(int likecount) {
    this.likecount = likecount;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  
  @Override
  public String toString() {
    return "ParkDto [P_IDX=" + P_IDX + ", P_PARK=" + P_PARK + ", P_LIST_CONTENT=" + P_LIST_CONTENT
        + ", area=" + area + ", open_dt=" + open_dt + ", main_equip=" + main_equip
        + ", main_plants=" + main_plants + ", guidance=" + guidance + ", visit_road=" + visit_road
        + ", use_reffer=" + use_reffer + ", P_IMG=" + P_IMG + ", P_ZONE=" + P_ZONE + ", P_ADDR="
        + P_ADDR + ", P_NAME=" + P_NAME + ", P_ADMINTEL=" + P_ADMINTEL + ", G_LONGITUDE="
        + G_LONGITUDE + ", G_LATITUDE=" + G_LATITUDE + ", longitude=" + longitude + ", latitude="
        + latitude + ", template_url=" + template_url + ", likecount=" + likecount + ", id=" + id
        + "]";
  }
  
  
  
}
