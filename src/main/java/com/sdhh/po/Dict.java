package com.sdhh.po;

/**
 * Created by Administrator on 2020/6/21.
 */
public class Dict {

    private String id;
    private String ptyp;
    private String etyp;
    private String enm;

    public Dict() {
    }

    public Dict(String id, String ptyp, String etyp, String enm) {
        this.id = id;
        this.ptyp = ptyp;
        this.etyp = etyp;
        this.enm = enm;
    }

    public String getPtyp() {
        return ptyp;
    }

    public void setPtyp(String ptyp) {
        this.ptyp = ptyp;
    }

    public String getEtyp() {
        return etyp;
    }

    public void setEtyp(String etyp) {
        this.etyp = etyp;
    }

    public String getEnm() {
        return enm;
    }

    public void setEnm(String enm) {
        this.enm = enm;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}

