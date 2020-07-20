package com.sdhh.po;

public class Yytxxt {
    private String eid;

    private String ptyp;

    private String etyp;

    private String enm;

    private String esbxh;

    private String eazdd;

    private String eipdz;

    private String extpzzdrl;

    private String extpzrl;

    private int ezdfxs;

    private int ecjhmzcws;

    private int ejshmzcws;

    private String ezjfx;

    private String ezjrl;

    private int eyhms;

    private String etryxsj;

    private String ebz;

    public Yytxxt(String eid) {
        this.eid = eid;
    }

    public Yytxxt(String eid, String ptyp, String etyp, String enm) {
        this.eid = eid;
        this.ptyp = ptyp;
        this.etyp = etyp;
        this.enm = enm;
    }

    public Yytxxt(String eid, String ptyp, String etyp, String enm, String esbxh, String eazdd, String eipdz, String extpzzdrl, String extpzrl, int ezdfxs, int ecjhmzcws, int ejshmzcws, String ezjfx, String ezjrl, int eyhms, String etryxsj, String ebz) {
        this.eid = eid;
        this.ptyp = ptyp;
        this.etyp = etyp;
        this.enm = enm;
        this.esbxh = esbxh;
        this.eazdd = eazdd;
        this.eipdz = eipdz;
        this.extpzzdrl = extpzzdrl;
        this.extpzrl = extpzrl;
        this.ezdfxs = ezdfxs;
        this.ecjhmzcws = ecjhmzcws;
        this.ejshmzcws = ejshmzcws;
        this.ezjfx = ezjfx;
        this.ezjrl = ezjrl;
        this.eyhms = eyhms;
        this.etryxsj = etryxsj;
        this.ebz = ebz;
    }

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid == null ? null : eid.trim();
    }

    public String getPtyp() {
        return ptyp;
    }

    public void setPtyp(String ptyp) {
        this.ptyp = ptyp == null ? null : ptyp.trim();
    }

    public String getEtyp() {
        return etyp;
    }

    public void setEtyp(String etyp) {
        this.etyp = etyp == null ? null : etyp.trim();
    }

    public String getEnm() {
        return enm;
    }

    public void setEnm(String enm) {
        this.enm = enm == null ? null : enm.trim();
    }

    public String getEsbxh() {
        return esbxh;
    }

    public void setEsbxh(String esbxh) {
        this.esbxh = esbxh == null ? null : esbxh.trim();
    }

    public String getEazdd() {
        return eazdd;
    }

    public void setEazdd(String eazdd) {
        this.eazdd = eazdd == null ? null : eazdd.trim();
    }

    public String getEipdz() {
        return eipdz;
    }

    public void setEipdz(String eipdz) {
        this.eipdz = eipdz == null ? null : eipdz.trim();
    }

    public String getExtpzzdrl() {
        return extpzzdrl;
    }

    public void setExtpzzdrl(String extpzzdrl) {
        this.extpzzdrl = extpzzdrl == null ? null : extpzzdrl.trim();
    }

    public String getExtpzrl() {
        return extpzrl;
    }

    public void setExtpzrl(String extpzrl) {
        this.extpzrl = extpzrl == null ? null : extpzrl.trim();
    }

    public int getEzdfxs() {
        return ezdfxs;
    }

    public void setEzdfxs(int ezdfxs) {
        this.ezdfxs = ezdfxs;
    }

    public int getEcjhmzcws() {
        return ecjhmzcws;
    }

    public void setEcjhmzcws(int ecjhmzcws) {
        this.ecjhmzcws = ecjhmzcws;
    }

    public int getEjshmzcws() {
        return ejshmzcws;
    }

    public void setEjshmzcws(int ejshmzcws) {
        this.ejshmzcws = ejshmzcws;
    }

    public String getEzjfx() {
        return ezjfx;
    }

    public void setEzjfx(String ezjfx) {
        this.ezjfx = ezjfx == null ? null : ezjfx.trim();
    }

    public String getEzjrl() {
        return ezjrl;
    }

    public void setEzjrl(String ezjrl) {
        this.ezjrl = ezjrl == null ? null : ezjrl.trim();
    }

    public int getEyhms() {
        return eyhms;
    }

    public void setEyhms(int eyhms) {
        this.eyhms = eyhms;
    }

    public String getEtryxsj() {
        return etryxsj;
    }

    public void setEtryxsj(String etryxsj) {
        this.etryxsj = etryxsj == null ? null : etryxsj.trim();
    }

    public String getEbz() {
        return ebz;
    }

    public void setEbz(String ebz) {
        this.ebz = ebz == null ? null : ebz.trim();
    }
}