package com.aspect;


import com.model.SysLog;
import com.model.SysUser;
import com.service.system.SysLogService;
import com.util.Const;
import com.util.beanutil.SysUtil;
import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
//切面注解
@Aspect
public class LoginLog {

    @Autowired
    private SysUtil sysUtil;

    @Autowired
    private SysLogService sysLogService;

    private static Logger logger = Logger.getLogger(LoginLog.class);

    /**
     * 切入点注解
     */
    @Pointcut("execution(* com.service.system.IndexService.login(..))")
    public void cut() {
    }

    /**
     * 目标类方法执行后执行该方法
     *
     * @param joinPoint
     * @param object
     */
    @AfterReturning(value = "cut()", argNames = "joinPoint,object", returning = "object")
    public void after(JoinPoint joinPoint, Object object) {
        logger.debug("aop 被执行 方法名：" + joinPoint.toLongString());
        SysUser sysUser = (SysUser) object;
        SysLog sysLog = new SysLog();
        sysLog.setIp(sysUtil.getIpAddr());
        sysLog.setTime(sysUtil.getNowTime());
        if (sysUtil.getHttpSession().getAttribute(Const.SESSION) != null) {
            sysLog.setContent("账号：" + sysUser.getUsername() + "登录成功");
        } else {
            sysLog.setContent("账号：" + sysUser.getUsername() + "登录失败");
        }
        boolean b = sysLogService.addLog(sysLog);
        logger.debug("注入结果：" + b);
    }

}
