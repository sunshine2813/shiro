package com.sdhh.shiro.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.realm.text.IniRealm;
import org.apache.shiro.subject.Subject;

/**
 * Created by Administrator on 2020/7/16.
 */
public class ShiroUtil {
    static{
        DefaultSecurityManager defaultSecurityManager = new DefaultSecurityManager();

        Realm realm = new IniRealm("classpath:shiro.ini");
        defaultSecurityManager.setRealm(realm);
        SecurityUtils.setSecurityManager(defaultSecurityManager);
    }
    public static void login(String username, String password){
        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(username,password);
        Subject subject = SecurityUtils.getSubject();
        subject.login(usernamePasswordToken);
        System.out.println("已认证:" + subject.isAuthenticated());
    }
    public static void logout(){
        Subject subject = SecurityUtils.getSubject();
        System.out.println("已退出:" + subject.isAuthenticated());
    }

}
