package com.sdhh.controller;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Classname ShiroController
 * @Description
 * 权限控制器
 * @Date 2019/8/13 10:19
 * @Created by WY
 */

@Controller
public class ShiroController {
    private static Logger logger = Logger.getLogger(ShiroController.class);

    /**
     * 无权限返回页面 unauthorized.jsp
     * @return
     */
    @RequestMapping("/gounauthorized")
    public String gounauthorized(){
        return "unauthorized";
    }

    /**
     * 超时登陆 跳转到login页面
     * @return
     */
    @RequestMapping("/gologin.action")
    public String gologin(){
        return "redirect:/login.jsp";
    }

    /*退出登录 调用currentUser.logout() removes all identifying information and invalidates their session too.*/
    @RequestMapping("/logout.action")
    public String gologout(){
        SecurityUtils.getSubject().logout();
        //SecurityUtils.getSubject().getSession().setAttribute("activeUser", null);
        return "redirect:/login.jsp";
    }
}
