package com.sdhh.util;

import org.apache.log4j.Logger;
import org.apache.shiro.util.ByteSource;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
*  加密 解密
* 
* @author WangYing
* @time 2019年7月24日下午3:55:17
*/

public class CipherUtil {

	private static Logger logger = Logger.getLogger(CipherUtil.class);
	/**
	 * 加密
	 * 加密方法:password经过MD5方法,加盐(盐是6位随机数+usercode),加盐后再经过MD5方法,
	 * 生成的newPwd进行持久化
	 * @param password
	 */
	public static Map<String, String> encrypt(String password) {
		Map<String, String> map = new HashMap<String, String>();
		String salt = String.valueOf((int)(Math.random() * 1000000));
		String newPwdTmp = new StringBuffer(new MD5().getMD5ofStr(password)).append(salt).toString();
		String newPwd = new MD5().getMD5ofStr(newPwdTmp);
		map.put("salt", salt);
		map.put("encryptedPwd", newPwd);
		logger.debug("<---------->"+"password:" + password + "\nencryptedPwd:" + newPwd);
		return map;
	}

	/*用于修改密码,先随机生成salt,然后加密*/
	public static String getHashedPwd(String password, String salt) {
		//用UUID生成随机盐
		salt = UUID.randomUUID().toString();
		logger.debug("<---------->"+"修改密码随机生成的salt:" + salt);
		return new MD5().getMD5ofStr((password+ByteSource.Util.bytes(salt)));
	}

    /**
     * 参数map有newPwd这个key,表示新增的明文密码
     * @param map
     * @return map 包括随机生成的salt,hashed后的密文
     */
	public static Map<String, String> getHashedPwd(Map<String, String> map) {
		String password = map.get("newPwd");
		//用UUID生成随机盐
		String salt = UUID.randomUUID().toString();
		logger.debug("<---------->"+"修改密码随机生成的salt:" + salt);
		map.put("salt", salt);
		String hashedNewPwd = new MD5().getMD5ofStr(password + ByteSource.Util.bytes(salt));
		map.put("hashedNewPwd",  hashedNewPwd);
		return map;
	}

	public static Object matchHashedPwd(String pwd, String salt){
		return new MD5().getMD5ofStr((pwd+salt));
	}

	/*根据密码明文和盐生成加密后的密文*/
	public static Object getHashedPwdBySalt(String password, ByteSource salt) {
		return new MD5().getMD5ofStr((password+salt));
	}

}
