package com.action.system;

import com.model.SysLog;
import com.service.system.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 首页
 */
@Controller
@RequestMapping(value = "/system")
public class AopAction {

    @Autowired
    private SysLogService sysLogService;

    /**
     * aop、性能展示
     *
     * @return
     */
    @RequestMapping(value = "/aop")
    public String aopList(ModelMap modelMap,Integer page) {
        modelMap.addAttribute("logs",sysLogService.getPage(page));
        return "system/aop";
    }

    /**
     * aop、删除
     *
     * @return
     */
    @RequestMapping(value = "/aopdel")
    public String aopdel(ModelMap modelMap,Integer page,Integer id) {
        sysLogService.del(id);
        modelMap.addAttribute("logs",sysLogService.getPage(page));
        return "system/aop";
    }



}
