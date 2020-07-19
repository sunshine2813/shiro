package com.sdhh.po;

import java.util.List;

/*
* Created by
  User: WY
  Date: 2020/7/2
  Function:
* */
public class YearProjectTree {
    private String id;
    private String text;
    private String checked;
    private String state;
    private String iconCls;
    private String url;
    private List<YearProjectTree> children;

    public YearProjectTree(){}

    public YearProjectTree(String id, String text, String checked, String state, String iconCls, String url) {
        this.id = id;
        this.text = text;
        this.checked = checked;
        this.state = state;
        this.iconCls = iconCls;
        this.url = url;
    }

    public List<YearProjectTree> getChildren() {
        return children;
    }

    public void setChildren(List<YearProjectTree> children) {
        this.children = children;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getChecked() {
        return checked;
    }

    public void setChecked(String checked) {
        this.checked = checked;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
