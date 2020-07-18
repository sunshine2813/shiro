package com.sdhh;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.apache.shiro.mgt.SecurityManager;
import org.junit.Test;
/*
* Created by 
  User: WY
  Date: 2020/7/16
  Function: 
* */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-config.xml"})
public class Testclass2 {
    @Autowired
    private SecurityManager securityManager;

    @Test
    public void test04(){
        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken("1","1");
        Subject subject = SecurityUtils.getSubject();
        subject.login(usernamePasswordToken);
        System.out.println("333333333");
        System.out.println(subject.isAuthenticated());
        System.out.println("有权限www:create:"+subject.hasRole("www:create"));
        System.out.println("没有权限product:create:"+subject.hasRole("product:create"));
    }


}
