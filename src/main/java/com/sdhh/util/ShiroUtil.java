package com.sdhh.util;

import com.sdhh.shiro.UserRealm;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.cache.MemoryConstrainedCacheManager;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.subject.Subject;

public class ShiroUtil {
    static{
        DefaultSecurityManager defaultSecurityManager = new DefaultSecurityManager();

        Realm realm = new UserRealm();
        /*Realm realm = new IniRealm("classpath:zlgl.ini");*/
        defaultSecurityManager.setRealm(realm);
        SecurityUtils.setSecurityManager(defaultSecurityManager);

        /*配置缓存角色权限管理器*/
        CacheManager cacheManager = new MemoryConstrainedCacheManager();
        defaultSecurityManager.setCacheManager(cacheManager);
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
