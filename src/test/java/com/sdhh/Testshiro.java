package com.sdhh;

import com.sdhh.shiro.UserRealm;
import com.sdhh.util.ShiroUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.subject.Subject;
import org.junit.Test;

import java.util.UUID;

/**
 * Created by Administrator on 2020/7/15.
 */
public class Testshiro {
    @Test
    public void test01(){
        DefaultSecurityManager defaultSecurityManager = new DefaultSecurityManager();

        Realm realm = new UserRealm();
        /*Realm realm = new IniRealm("classpath:zlgl.ini");*/
        defaultSecurityManager.setRealm(realm);

        SecurityUtils.setSecurityManager(defaultSecurityManager);
        /*配置缓存角色权限管理器*/
        /*CacheManager cacheManager = new MemoryConstrainedCacheManager();*/
        CacheManager cacheManager = new EhCacheManager();
        defaultSecurityManager.setCacheManager(cacheManager);

        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken("1","1");
        Subject subject = SecurityUtils.getSubject();
        subject.login(usernamePasswordToken);
        System.out.println("已认证:" + subject.isAuthenticated());

        System.out.println("1是否有角色admin=============" + subject.hasRole("admin"));
        System.out.println("1是否有权限www:create:=========="+subject.isPermitted("www:create"));
        System.out.println("1是否有权限product:delete=========="+subject.isPermitted("product:delete"));
        System.out.println("1是否有权限product:view=========="+subject.isPermitted("product:view"));

        subject.logout();
        System.out.println("退出,未认证:" + subject.isAuthenticated());
    }
    @Test
    public void test02(){
        ShiroUtil.login("1", "1");
        ShiroUtil.logout();
    }

    @Test
    public void test03() throws Exception{
        String md5Hash = new Md5Hash("admin", UUID.randomUUID()).toString();
    }

}
