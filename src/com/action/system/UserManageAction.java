package com.action.system;

import com.github.pagehelper.PageInfo;
import com.model.SysUser;
import com.service.system.UserManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * 用户管理Action
 */

@Controller
@RequestMapping("/system")
public class UserManageAction {

    @Autowired
    private UserManageService userManageService;

    /**
     * 默认页面
     * @return
     */
    @RequestMapping("/user")
    public String user(ModelMap map,Integer page){
        PageInfo allUsers = userManageService.getAllUsers(page);
        map.addAttribute("AllUsers",allUsers);
        return "system/user";
    }


    /**
     * 管理用户组
     * @return
     */
    @RequestMapping("/manageRole")
    public String addRole(ModelMap map){
        map.addAttribute("Roles",userManageService.getAllSysRoles());
        return "system/manageRole";
    }


}
