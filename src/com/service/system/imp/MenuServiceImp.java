package com.service.system.imp;

import com.dao.system.SysMenuMapper;
import com.model.Menu;
import com.model.SysMenu;
import com.service.system.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class MenuServiceImp implements MenuService {
    @Autowired
    private SysMenuMapper sysMenuMapper;

    @Override
    public List<Menu> getMenu() {

        List<Menu> temp = new ArrayList<>();
        //一二级菜单分离
        for (SysMenu s : sysMenuMapper.selectAll()) {
            Menu menu = new Menu();
            if (s.getPid() == 0) {
                menu.setId(s.getId());
                menu.setTitle(s.getName());
                temp.add(menu);
            }
        }
        return temp;
    }

    @Override
    public boolean addMenu(Menu menu) {
        SysMenu sysMenu = new SysMenu();
        sysMenu.setName(menu.getTitle());
        sysMenu.setHref(menu.getHref());
        sysMenu.setIcon("&#xe672;");
        if (menu.getId() != 0) {
            sysMenu.setPid(menu.getId());
            sysMenuMapper.addMenu2(sysMenu);
        } else {
            sysMenuMapper.addMenu1(sysMenu);
        }

        return false;
    }

    @Override
    public List<SysMenu> showMenu() {
        List<SysMenu> menus = sysMenuMapper.selectAll();
        return menus;
    }

    @Override
    public void del(String id) {
        sysMenuMapper.del(id);
    }
}
