package com.sdhh.interceptor;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Administrator on 2020/7/18.
 */
public class AuthHandlerInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("自定义拦截器 preHandle =============");
        System.out.println("request.getRequestURI:"+request.getRequestURI());
        return true;
        /*return super.preHandle(request, response, handler);*/
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("自定义拦截器 postHandle =============");
        /*super.postHandle(request, response, handler, modelAndView);*/
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        /*super.afterCompletion(request, response, handler, ex);*/
        System.out.println("自定义拦截器 afterCompletion =============");
    }
}
