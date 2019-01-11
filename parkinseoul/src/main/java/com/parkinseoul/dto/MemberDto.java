package com.parkinseoul.dto;

import java.util.Collection;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.User;

public class MemberDto {

  private int seq;
  private String id;
  private String name;
  private String password;
  private int auth_seq;


  @Override
  public String toString() {
    return "MemberDto [seq=" + seq + ", id=" + ", name=" + name + ", password=" + ", auth_seq="
        + auth_seq + "]";
  }

  public int getSeq() {
    return seq;
  }

  public void setSeq(int seq) {
    this.seq = seq;
  }

  public String getId() { return id; } 
  
  public void setId(String id) { this.id = id; }
  
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

   public String getPassword() {
     return password; } 
   
   public void setPassword(String password) {
   this.password = password; }
  
  public int getAuth_seq() {
    return auth_seq;
  }

  public void setAuth_seq(int auth_seq) {
    this.auth_seq = auth_seq;
  }



}
