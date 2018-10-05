package com.interceptor;


import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

    private static Logger logger = Logger.getLogger(LoginInterceptor.class);

    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler)throws Exception {

        logger.debug(request.getRequestURI());
//       if(request.getRequestURI().contains("admin/login")||request.getRequestURI().contains("web")||request.getRequestURI().contains("admin/index")){
////            return true;
////        }
////        String username =  (String)request.getSession().getAttribute("user");
////        if(username == null){
////            request.getRequestDispatcher("/WEB-INF/web/login.jsp").forward(request, response);
////            return false;
////        }else
////            return true;


        if(request.getRequestURI().equals("/")){
            request.getRequestDispatcher("/WEB-INF/jsp/system/login.jsp").forward(request, response);
            return false;
        }

        return true;


    }
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler,
                                Exception ex) throws Exception {
    }
}
