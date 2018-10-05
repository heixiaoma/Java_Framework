package com.action.system;

import com.model.Menu;
import com.service.system.IndexService;
import com.service.system.MenuService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 菜单管理
 */
@Controller
@RequestMapping(value = "/system")
public class MenuAction {

    private static final Logger logger=Logger.getLogger(MenuAction.class);

    @Autowired
    private MenuService menuService;

    /**
     * menu、菜单管理
     *
     * @return
     */
    @RequestMapping(value = "/menu")
    public String menu(ModelMap map) {
        map.addAttribute("menus",menuService.getMenu());
        map.addAttribute("menu",menuService.showMenu());
        return "system/menu";
    }


    /**
     * 添加菜单
     * @param menu
     * @return
     */
    @RequestMapping(value = "/addMenu")
    @ResponseBody
    public String addMenu(Menu menu) {
        boolean b = menuService.addMenu(menu);
        logger.debug(b);
        return b+"";
    }

    /**
     * 显示菜单
     * @return
     */
    @RequestMapping(value = "/add")
    public String add(ModelMap map) {
        map.addAttribute("menus",menuService.getMenu());
        return "/system/addMenu";
    }

    /**
     * 更具菜单id删除
     * @param id
     * @return
     */
    @RequestMapping(value = "/delMenu")
    public String del(String id) {
        menuService.del(id);
        return "forward:/system/menu";
    }


}
