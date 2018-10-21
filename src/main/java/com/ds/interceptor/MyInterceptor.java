package com.ds.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @类名称：MyInterceptor
 * @作者: 段大神经
 * @创建时间: 2018/9/29 22:03
 * @说明: 拦截器类
 */
public class MyInterceptor extends HandlerInterceptorAdapter {
    private final static Logger logger = LoggerFactory.getLogger(MyInterceptor.class);
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object loginUser = request.getSession().getAttribute("loginUser");
        /*if (request.getRequestURI().equals("/login") || request.getRequestURI().equals("/toIndex")){
            return true;
        }*/
        if (loginUser == null){
            //被拦截的路径后要重定向的路径
           response.sendRedirect("login");
            return false;
        }else {
            return true;
        }

    }
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }




}
