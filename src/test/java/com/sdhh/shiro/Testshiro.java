package com.sdhh.shiro;

import com.sdhh.shiro.util.ShiroUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.realm.text.IniRealm;
import org.apache.shiro.subject.Subject;
import org.junit.Test;

import java.net.Authenticator;

/**
 * Created by Administrator on 2020/7/15.
 */
public class Testshiro {
    @Test
    public void test01(){
        DefaultSecurityManager defaultSecurityManager = new DefaultSecurityManager();

        Realm realm = new IniRealm("classpath:shiro.ini");
        defaultSecurityManager.setRealm(realm);
        SecurityUtils.setSecurityManager(defaultSecurityManager);

        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken("1","1");
        Subject subject = SecurityUtils.getSubject();
        subject.login(usernamePasswordToken);
        System.out.println("已认证:" + subject.isAuthenticated());

        System.out.println("1是否有角色admin:" + subject.hasRole("admin"));
        System.out.println("1是否有权限product:view:"+subject.isPermitted("product:view"));

        subject.logout();
        System.out.println("未认证:" + subject.isAuthenticated());
    }
    @Test
    public void test02(){
        ShiroUtil.login("1","1");
        ShiroUtil.logout();
    }

}
