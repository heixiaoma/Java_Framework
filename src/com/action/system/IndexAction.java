package com.action.system;

import com.model.SysUser;
import com.service.system.IndexService;
import com.util.Const;
import com.util.beanutil.SysUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 主框架
 */
@Controller
public class IndexAction {

    @Autowired
    private SysUtil sysUtil;

    @Autowired
    private IndexService indexService;

    /**
     * 登录方法
     * @param sysUser
     * @param map
     * @return
     */
    @RequestMapping(value = "/sys_login")
    public String login(SysUser sysUser, ModelMap map){
        indexService.login(sysUser);
        SysUser login = (SysUser) sysUtil.getHttpSession().getAttribute(Const.SESSION);
        if(login!=null){
            //获取菜单列表
            map.addAttribute("menu",indexService.getMenu());
            return "system/index";
        }else {
            return "system/login";
        }
    }

}
