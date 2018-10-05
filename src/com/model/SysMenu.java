package com.model;


public class SysMenu {
    private int id;
    private String name;
    private String href;
    private String icon;
    private int pid;


    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }


    @Override
    public String toString() {
        return "SysMenu{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pid=" + pid +
                '}';
    }
}
