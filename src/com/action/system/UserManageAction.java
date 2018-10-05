package com.action.system;

import com.github.pagehelper.PageInfo;
import com.model.SysRole;
import com.model.SysUser;
import com.service.system.UserManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 用户管理Action
 */

@Controller
@RequestMapping("/system")
public class UserManageAction {

    @Autowired
    private UserManageService userManageService;

    /**
     * 默认页面,用户展示
     *
     * @return
     */
    @RequestMapping("/user")
    public String user(ModelMap map, Integer page) {
        //用户数据发送到前台，
        PageInfo allUsers = userManageService.getAllUsers(page);
        map.addAttribute("AllUsers", allUsers);
        //把用户组发送到前台;
        map.addAttribute("Roles", userManageService.getAllSysRoles());
        return "system/user";
    }

    /**
     * 删除用户数据，
     * @param map
     * @param page,当前页码
     * @param id 删除的id
     * @return
     */
    @RequestMapping("/delUser")
    public String delUser(ModelMap map,Integer page,String id){
        userManageService.delUser(id);
        PageInfo allUsers = userManageService.getAllUsers(page);
        map.addAttribute("AllUsers", allUsers);
        return "system/user";
    }

    /**
     * 编辑用户函数或者添加
     * @param map
     * @param page 编辑的当前的页面数
     * @param sysUser 编辑的用户对象
     * @return
     */
    @RequestMapping("/editUser")
    public String editUser(ModelMap map,Integer page,SysUser sysUser){

        if(sysUser.getId()!=0) {
            userManageService.editUser(sysUser);
        }else {
            userManageService.saveUser(sysUser);
        }

        PageInfo allUsers = userManageService.getAllUsers(page);
        map.addAttribute("AllUsers", allUsers);
        //把用户组发送到前台;
        map.addAttribute("Roles", userManageService.getAllSysRoles());
        return "system/user";
    }


    /**
     * 管理用户组
     *
     * @return
     */
    @RequestMapping("/manageRole")
    public String addRole(ModelMap map) {
        map.addAttribute("Roles", userManageService.getAllSysRoles());
        return "system/manageRole";
    }

    /**
     * 编辑用户组
     * @param map
     * @param sysRole
     * @return
     */
    @RequestMapping("/editRole")
    public String editRole(ModelMap map, SysRole sysRole){

        if(sysRole.getRoleid()!=0) {
            userManageService.editRole(sysRole);
        }else {
            userManageService.saveRole(sysRole);
        }
        map.addAttribute("Roles", userManageService.getAllSysRoles());
        return "system/manageRole";
    }

    /**
     * 删除用户组
     * @param map
     * @param id
     * @return
     */
    @RequestMapping("/delRole")
    public String delRole(ModelMap map,String id){
        userManageService.delRole(id);
        map.addAttribute("Roles", userManageService.getAllSysRoles());
        return "system/manageRole";
    }

}
