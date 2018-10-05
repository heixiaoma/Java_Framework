package com.test;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Log4jConfigurer;

import java.io.FileNotFoundException;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:com/config/mvc.xml" })
public class MyTest {

    static {
        try {
            Log4jConfigurer.initLogging("classpath:com/config/log4j.properties");
        } catch (FileNotFoundException ex) {
            System.err.println("Cannot Initialize log4j");
        }
    }


    private static Logger logger = Logger.getLogger(MyTest.class);
    @Test
    public void test() {

        logger.debug("Spring 调试");
        System.out.println("Spring 调试类");
    }
}