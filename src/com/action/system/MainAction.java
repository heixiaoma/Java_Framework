package com.action.system;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 首页
 */
@Controller
@RequestMapping(value = "/system")
public class MainAction {
    /**
     * main、性能展示
     *
     * @return
     */
    @RequestMapping(value = "/main")
    public String main() {
        return "system/main";
    }
}
