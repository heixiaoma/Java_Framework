package com.model;

public class SysLog {

  private long id;
  private String time;
  private String ip;
  private String content;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getTime() {
    return time;
  }

  public void setTime(String time) {
    this.time = time;
  }


  public String getIp() {
    return ip;
  }

  public void setIp(String ip) {
    this.ip = ip;
  }


  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

}
