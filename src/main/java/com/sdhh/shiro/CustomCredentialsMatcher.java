package com.sdhh.shiro;

import com.sdhh.util.CipherUtil;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;

/**
*  
* 重写shiro的密码验证
* @author WangYing
* @time 2019年7月25日下午4:04:26
*/

public class CustomCredentialsMatcher extends SimpleCredentialsMatcher{
	@Override
	public boolean doCredentialsMatch(AuthenticationToken authcToken, AuthenticationInfo info) {
		UsernamePasswordToken token2 = (UsernamePasswordToken) authcToken;
		SimpleAuthenticationInfo simpleAuthenticationInfo = (SimpleAuthenticationInfo)info;
		Object tokenHashedCredentials = CipherUtil.getHashedPwdBySalt(new String(token2.getPassword()), simpleAuthenticationInfo.getCredentialsSalt());
		//Object tokenCredentials = userService.matchHashedPwd(String.valueOf(token2.getUsername()), String.valueOf(token2.getPassword()));
		Object accountCredentials = getCredentials(info);
		return equals(tokenHashedCredentials, accountCredentials);

	//将密码加密与系统加密后的密码校验，内容一致就返回true,不一致就返回false 
	//return super.doCredentialsMatch(token, info) ;
	}

}
