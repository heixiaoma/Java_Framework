package com.service.system.imp;

import com.dao.system.SysMenuMapper;
import com.dao.system.SysUserMapper;
import com.google.gson.Gson;
import com.model.Menu;
import com.model.SysMenu;
import com.model.SysUser;
import com.service.system.IndexService;
import com.util.Const;
import com.util.beanutil.SysUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class IndexServiceImp implements IndexService {
    //注入session
    @Autowired
    private SysUtil sysUtil;
    @Autowired
    private SysUserMapper sysUserMapper;
    @Autowired
    private SysMenuMapper sysMenuMapper;

    @Override
    public SysUser login(SysUser user) {
        //或者调用自定义的Mapper.xml文件的方案
        SysUser sysUser = sysUserMapper.login(user);
        if (sysUser != null) {
            sysUtil.getHttpSession().setAttribute(Const.SESSION, sysUser);
            return sysUser;
        } else {
            sysUtil.getHttpSession().removeAttribute(Const.SESSION);
            return user;
        }
    }

    @Override
    public String getMenu() {
        return showMenu(sysMenuMapper.selectAll());
    }

    private String showMenu(List<SysMenu> menus) {

        List<Menu> temp1 = new ArrayList<>();
        List<Menu> temp2 = new ArrayList<>();
        //一二级菜单分离
        for (SysMenu s : menus) {
            Menu menu = new Menu();
            if (s.getPid() == 0) {
                menu.setId(s.getId());
                menu.setTitle(s.getName());
                menu.setHref(s.getHref());
                menu.setIcon(s.getIcon());
                menu.setPid(s.getPid());
                temp1.add(menu);
            } else {
                menu.setId(s.getId());
                menu.setTitle(s.getName());
                menu.setPid(s.getPid());
                menu.setHref(s.getHref());
                menu.setIcon(s.getIcon());
                temp2.add(menu);
            }
        }
        //总菜单处理
        for (Menu sm2 : temp2) {
            for (Menu sm1 : temp1) {
                if (sm2.getPid() == sm1.getId()) {
                    sm1.addChildren(sm2);
                }
            }
        }
        Gson gson = new Gson();
        String s = gson.toJson(temp1);
        return s;

    }
}
