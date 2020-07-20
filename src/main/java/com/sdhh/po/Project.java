package com.sdhh.po;

import java.math.BigDecimal;

/**
 * Created by Administrator on 2020/7/2
 */
public class Project {

  private String id      ;
  private String pnm     ;
  private String ptyp    ;
  private String pfwh    ;
  private BigDecimal tzje;
  private String tzlb    ;
  private String kgsj    ;
  private String wgsj    ;
  private String htwgyssj;
  private String cbyssj  ;
  private String jgyssj  ;
  private String sbazdd  ;
  private String yxwhdw  ;
  private int year    ;

  public Project() {  }
  public Project(String id) {
    this.id = id;
  }

    public Project(String id, String pnm, String ptyp, String pfwh, BigDecimal tzje, String tzlb, String kgsj, String wgsj, String htwgyssj, String cbyssj, String jgyssj, String sbazdd, String yxwhdw, int year) {
        this.id = id;
        this.pnm = pnm;
        this.ptyp = ptyp;
        this.pfwh = pfwh;
        this.tzje = tzje;
        this.tzlb = tzlb;
        this.kgsj = kgsj;
        this.wgsj = wgsj;
        this.htwgyssj = htwgyssj;
        this.cbyssj = cbyssj;
        this.jgyssj = jgyssj;
        this.sbazdd = sbazdd;
        this.yxwhdw = yxwhdw;
        this.year = year;
    }

    public Project(String pnm, String ptyp, String pfwh, BigDecimal tzje, String tzlb, String kgsj, String wgsj, String htwgyssj, String cbyssj, String jgyssj, String sbazdd, String yxwhdw, int year) {
        this.pnm = pnm;
        this.ptyp = ptyp;
        this.pfwh = pfwh;
        this.tzje = tzje;
        this.tzlb = tzlb;
        this.kgsj = kgsj;
        this.wgsj = wgsj;
        this.htwgyssj = htwgyssj;
        this.cbyssj = cbyssj;
        this.jgyssj = jgyssj;
        this.sbazdd = sbazdd;
        this.yxwhdw = yxwhdw;
        this.year = year;
    }

    public String getTzlb() {
        return tzlb;
    }

    public void setTzlb(String tzlb) {
        this.tzlb = tzlb;
    }

    public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

    public String getPnm() {
        return pnm;
    }

    public void setPnm(String pnm) {
        this.pnm = pnm;
    }

    public String getPtyp() {
    return ptyp;
  }

  public void setPtyp(String ptyp) {
    this.ptyp = ptyp;
  }

  public String getPfwh() {
    return pfwh;
  }

  public void setPfwh(String pfwh) {
    this.pfwh = pfwh;
  }

  public BigDecimal getTzje() {
    return tzje;
  }

  public void setTzje(BigDecimal tzje) {
    this.tzje = tzje;
  }

  public String getKgsj() {
    return kgsj;
  }

  public void setKgsj(String kgsj) {
    this.kgsj = kgsj;
  }

  public String getWgsj() {
    return wgsj;
  }

  public void setWgsj(String wgsj) {
    this.wgsj = wgsj;
  }

  public String getHtwgyssj() {
    return htwgyssj;
  }

  public void setHtwgyssj(String htwgyssj) {
    this.htwgyssj = htwgyssj;
  }

  public String getCbyssj() {
    return cbyssj;
  }

  public void setCbyssj(String cbyssj) {
    this.cbyssj = cbyssj;
  }

  public String getJgyssj() {
    return jgyssj;
  }

  public void setJgyssj(String jgyssj) {
    this.jgyssj = jgyssj;
  }

  public String getSbazdd() {
    return sbazdd;
  }

  public void setSbazdd(String sbazdd) {
    this.sbazdd = sbazdd;
  }

  public String getYxwhdw() {
    return yxwhdw;
  }

  public void setYxwhdw(String yxwhdw) {
    this.yxwhdw = yxwhdw;
  }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }
}


