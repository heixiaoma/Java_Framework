package com.test;
import com.model.SysUser;
import com.service.system.IndexService;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Log4jConfigurer;

import java.io.FileNotFoundException;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:com/config/mvc.xml" })
public class ce {

    static {
        try {
            Log4jConfigurer.initLogging("classpath:com/config/log4j.properties");
        } catch (FileNotFoundException ex) {
            System.err.println("Cannot Initialize log4j");
        }
    }

    private static Logger logger = Logger.getLogger(ce.class);
    @Autowired
    private IndexService userService;
    @Test
    public void test() {
         SysUser user=new SysUser();
        user.setId(1);
        SysUser login = userService.login(user);
        System.out.println(login);
        logger.debug("Spring 调试");
    }
}