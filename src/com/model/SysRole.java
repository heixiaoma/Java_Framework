package com.model;

import javax.persistence.Column;

public class SysRole {
    @Column(name = "roleid")
    private int roleid;
    @Column(name="roleName")
    private String roleName;

    public int getRoleid() {
        return roleid;
    }

    public void setRoleid(int roleid) {
        this.roleid = roleid;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
