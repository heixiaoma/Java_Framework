package com.service.system;

import com.model.Menu;
import com.model.SysMenu;

import java.util.List;

public interface MenuService {

    List<Menu> getMenu();
    boolean addMenu(Menu menu);
    List<SysMenu> showMenu();
    void del(String id);
}
