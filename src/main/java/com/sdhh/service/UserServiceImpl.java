package com.sdhh.service;

import com.sdhh.mapper.UserMapper;
import com.sdhh.po.ActiveUser;
import com.sdhh.po.User;
import com.sdhh.util.CipherUtil;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.*;

/**
*  
* 
* @author WangYing
* @time 2019年7月23日下午3:48:29
*/
@Service("userService")
public class UserServiceImpl implements UserService{
    private static Logger logger = Logger.getLogger(UserServiceImpl.class);

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User createUser(User user) {
		//加密密码
		String password = user.getPassword();
		Map<String, String> map = CipherUtil.encrypt(password);
		String md5Pwd = map.get("encryptedPwd");
		String salt = map.get("salt");
		user.setPassword(md5Pwd);
		user.setSalt(salt);
	    return userMapper.createUser(user);
	}

    @Override
    public boolean userLogin(String username, String password) {
        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(username, password);
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(usernamePasswordToken);
        } catch (AuthenticationException e) {
            e.printStackTrace();
            logger.debug("<---------->"+username+"登录失败"+"AuthenticationException");
            return false;
        }
        return true;
		/*//创建Subject实例对象
		subject = SecurityUtils.getSubject();
		//如果当前用户  没有 成功登录过
		if( !subject.isAuthenticated()){
			UsernamePasswordToken token2 = new UsernamePasswordToken(username, password);
			try {
				subject.login(token2);
			} catch (AuthenticationException e) {
				e.printStackTrace();
				logger.debug("<---------->"+username+"登录失败"+"AuthenticationException");
				return false;
			}
		}
		return true;*/
    }

	@Override
	public void changePassword(long userId, String newPassword) {
		Map<String, String> map = CipherUtil.encrypt(newPassword);
		String md5Pwd = map.get("encryptedPwd");
		String salt = map.get("salt");
		userMapper.changePassword(userId, md5Pwd, salt);
	}

	@Override
	public void correlationRoles(long userId, long... roleIds) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void uncorrelationRoles(long userId, long... roleIds) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User findUserByName(String username) {
		return userMapper.findUserByName(username);
	}

	@Override
	public Set<String> findRolesByName(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Set<String> findPermissionsByName(String username) {
		// TODO Auto-generated method stub
		return null;
	}




	/*
	验证密码是否正确
	* */
	@Override
	public boolean matchPwdByUsername(String username, String password){
        Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token2 = new UsernamePasswordToken(username, password);
		try {
			subject.login(token2);
		} catch (AuthenticationException e) {
			logger.debug("<---------->"+username+"修改密码验证失败"+"AuthenticationException");
			return false;
		}
		return true;
	}

	@Override
	public ActiveUser findActiveUserByUsercode(String usercode) {
		return userMapper.findActiveUserByUsercode(usercode);
	}

	@Override
	public ActiveUser findActiveUserByUsername(String username) {
		return userMapper.findActiveUserByUsername(username);
	}

	@Override
	public List<User> getUsers(){
		return userMapper.getUsers();
	};

	@Override
	public int updatePasswordById(long id, String newPwd, String salt){
		return userMapper.updatePasswordById(id, newPwd, salt);
	}

    @Override
    public int updatePasswordByUsername(String username, String newPwd, String salt){
        return  userMapper.updatePasswordByUsername(username, newPwd, salt);
    }

    @Override
    public int delUserById(long id){
        return userMapper.delUserById(id);
    }

    @Override
    public int addUser(User record){
//       生成salt和hashed密码再调用userMapper.addUser方法
        Map<String, String> map = new HashMap<>();
        map.put("newPwd", record.getPassword());
        map = CipherUtil.getHashedPwd(map);
        String hashedNewPwd = map.get("hashedNewPwd");
        record.setPassword(map.get("hashedNewPwd"));
        record.setSalt(map.get("salt"));
        return  userMapper.addUser(record);
    }

    @Override
    public List<User> getUserPerms(){
        return userMapper.getUserPerms();
    }

    @Override
    public List<User> getUserPermsByUsername(String username){
        return  userMapper.getUserPermsByUsername(username);
    }

    @Override
    public List<User> getUserPermsById(long id){
        return  userMapper.getUserPermsById(id);
    }

    @Override
    public int addPermsById(Long id, String add_permissions){
        ArrayList<HashMap> list = new ArrayList<HashMap>();
        String [] perms = add_permissions.replaceAll("_",":").split(",");
        for(int i=0; i < perms.length; i++){
            HashMap tmp = new HashMap<>();
            tmp.put("user_id", id);
            tmp.put("permission_name", perms[i]);
            list.add(tmp);
        }
        return userMapper.addPermsById(list);
    }

    @Override
    public int delUserPermsById(Long id){
        return userMapper.delUserPermsById(id);
    }

}
