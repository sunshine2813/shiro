package com.sdhh.shiro;

import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import java.util.HashSet;
import java.util.Set;

public class UserRealm extends AuthorizingRealm {

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        System.out.println("登录成功后获取权限");
        String username = principals.getPrimaryPrincipal().toString();
        System.out.println("查询用户" + username + "的权限");
        Set<String> roleNameSet = new HashSet<>();
        roleNameSet.add("admin");
        roleNameSet.add("public");
        Set<String> permissionNameSet = new HashSet<>();
        permissionNameSet.add("product:view");
        permissionNameSet.add("www:create");
        permissionNameSet.add("product:delete");
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        simpleAuthorizationInfo.addRoles(roleNameSet);

        simpleAuthorizationInfo.addStringPermissions(permissionNameSet);
        System.out.println("完成授权返回"); 
        return simpleAuthorizationInfo;

    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        System.out.println("subject.login时进行认证");
        /*获取subject.login的参数token*/
        UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;
        String username = usernamePasswordToken.getUsername();
        String password = new String(usernamePasswordToken.getPassword());
        /*验证username和password是否正确*/
        SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(usernamePasswordToken.getPrincipal(), usernamePasswordToken.getCredentials(), getName());
        if(username.equals("1") && password.equals("1")){
            System.out.println("登录成功");
            return simpleAuthenticationInfo;
        }
        return null;
    }
}
