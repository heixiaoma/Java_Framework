package com.test;

import com.google.gson.Gson;
import com.model.SysMenu;

import java.util.ArrayList;
import java.util.List;

public class test {
    public static void main(String[] args) {
        List<SysMenu> menus=new ArrayList<>();
        SysMenu s1=new SysMenu();
        s1.setId(1);
        s1.setName("后台首页");
        SysMenu s2=new SysMenu();
        s2.setId(2);
        s2.setName("系统管理");
        SysMenu s3=new SysMenu();
        s3.setId(3);
        s3.setName("用户管理");
        s3.setPid(2);
        SysMenu s4=new SysMenu();
        s4.setId(4);
        s4.setName("AOP日志");
        s4.setPid(2);
        SysMenu s5=new SysMenu();
        s5.setId(5);
        s5.setName("权限管理");
        s5.setPid(2);
        menus.add(s1);
        menus.add(s2);
        menus.add(s3);
        menus.add(s4);
        menus.add(s5);

    }
}
