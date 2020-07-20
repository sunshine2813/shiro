package com.sdhh.service;

import com.sdhh.exception.CustomException;
import com.sdhh.mapper.PermissionMapper;
import com.sdhh.po.Permission;
import com.sdhh.po.User;
import com.sdhh.util.MD5;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description 不带shiro框架的登陆认证和授权
 * 
 * @author wy
 * @Date 2019年7月24日
 */
@Service("SysService")
public class SysServiceImpl implements SysService {
	private static Logger logger = Logger.getLogger(SysServiceImpl.class);
	
	
	@Autowired
	private PermissionMapper PermissionMapperCustom;

	public User authenticat(String usercode, String password) throws Exception {
		logger.debug("<---------->======ServiceImple.MD5 for admin:\n"+new MD5().getMD5ofStr("admin"));
		logger.debug("<---------->======ServiceImple.MD5 for lisi:\n"+new MD5().getMD5ofStr("ls"));
		logger.debug("<---------->======ServiceImple.MD5 for zs:\n"+new MD5().getMD5ofStr("zs"));
		/**
		 * 认证过程： 根据用户身份(账号)查询数据库，如果查询不到则用户不存在 
		 * 对输入的密码和数据库密码进行比对，如果一致则认证通过
		 */
		// 根据用户账号查询数据库
		User User = this.findUserByUserCode(usercode);

		if (User == null) {
			// 抛出异常
			throw new CustomException("用户账号不存在");
		}

		// 数据库密码（MD5加密后的密码）
		String password_db = User.getPassword();
        
		// 对输入的密码和数据库密码进行比对，如果一致，认证通过
		// 对页面输入的密码进行MD5加密
		String password_input_md5 = new MD5().getMD5ofStr(password);
		if (!password_db.equalsIgnoreCase(password_input_md5)) {
			//抛出异常
			throw new CustomException("用户名或密码错误");
		}
		//得到用户id
		Long userid = User.getId();
		
		//根据用户id查询菜单
		List<Permission> menus = this.findMenuListByUserId(userid);
		logger.debug("<---------->ServiceImple.可访问的菜单:");
		for(Permission sp : menus)
			logger.debug("<---------->"+sp.getName());
		//根据用户id查询权限url
		List<Permission> permissions = this.findPermissionListByUserId(userid);
		logger.debug("<---------->ServiceImple.可访问的url:");
		for(Permission sp : permissions)
			logger.debug("<---------->"+sp.getUrl());
		
		//认证通过，返回用户身份信息
		User activeUser = new User();
		activeUser.setId(userid);
		activeUser.setUsercode(usercode);
		activeUser.setUsername(User.getUsername());
		
        //放入权限范围的菜单和url
		//activeUser.setMenus(menus);
		//activeUser.setPermissions(permissions);
		
		return activeUser;
	}

	public User findUserByUserCode(String userCode) throws Exception {
		/*UserExample UserExample = new UserExample();
		UserExample.Criteria criteria = UserExample.createCriteria();
		criteria.andUsercodeEqualTo(userCode);

		List<User> list = UserMapper.selectByExample(UserExample);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		 */
		return null;
	}
	
	@Override
	public List<Permission> findMenuListByUserId(Long userid) throws Exception {
		return PermissionMapperCustom.findMenuListByUserId(userid);
	}

	@Override
	public List<Permission> findPermissionListByUserId(Long userid) throws Exception {
		return PermissionMapperCustom.findPermissionListByUserId(userid);
	}


}
