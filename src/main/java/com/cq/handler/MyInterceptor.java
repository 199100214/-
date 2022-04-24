package com.cq.handler;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyInterceptor implements HandlerInterceptor {
    private Logger logger = Logger.getLogger(MyInterceptor.class);
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        logger.debug("==========开始进入preHandle拦截器=========");
        Object attr =  request.getSession().getAttribute("userCount");
        String path = request.getContextPath();
        logger.debug(attr);
        logger.debug(path);
        if (attr == null){
            logger.debug("111111111");
            response.sendRedirect(path+"/view/login.jsp");
            logger.debug("222222222");
            return false;
        }
        logger.debug("==========结束preHandle拦截器=========");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        logger.debug("=========中间的postHandle==========");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        logger.debug("=========afterHandle=============");
    }
}
