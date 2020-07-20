package com.sdhh.controller;

import com.sdhh.po.ActiveUser;
import com.sdhh.service.UserService;
import com.sdhh.util.CipherUtil;
import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * 登录和退出
 * @author wy
 *
 */
@Controller
public class LoginController {
	private static Logger logger = Logger.getLogger(LoginController.class);

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/userLogin.action", method=RequestMethod.POST)
	public String login( @RequestParam(value="username") String username, @RequestParam(value="password") String password,
						 HttpServletRequest request, HttpServletResponse response) throws Exception{
        System.out.println("<---------->"+"=========LoginController/login");
        System.out.println("<---------->"+"username:"+username);
			//调用shiro 校验用户账号和密码的正确性
			boolean  loginFlag = userService.userLogin(username, password);
			if(loginFlag){
				if(username.equals("admin")) {
                    return "redirect:/adminIndex.action";
                }
                /*可以通过请求action返回*/
/*                return "redirect:/toAddDict.action";*/
				/*改成返回资料管理的首页*/
				return "redirect:/toIndex.action";
                /*也可以直接返回页面*/
                /*return "ziliao/addDict";*/
                /*之前的普通用户登录首页*/
                /*return "redirect:/userIndex.action";*/
			}
		String tip = "用户名错误";
        request.setAttribute("tip", tip);
		return "redirect:/login.jsp";
	}

	@RequiresUser
	@RequestMapping("/userIndex")
	public String index()throws Exception{
		return "userIndex";
	}

	/**
	 * 管理员登陆
	 * @param username
	 * @param password
	 * @return 管理员成功登陆的主页面
	 * @throws Exception
	 */
	@RequestMapping(value = "/adminLogin", method=RequestMethod.POST)
	public String adminLogin( @RequestParam(value="username") String username, @RequestParam(value="password") String password) throws Exception{
		//this.session = request.getSession();
		logger.debug("<---------->"+"=========LoginController/adminLogin");
		logger.debug("<---------->"+"username:"+username);
		//调用shiro 校验用户账号和密码的正确性
		boolean  loginFlag = userService.userLogin(username, password);
		if(loginFlag){
			ActiveUser activeUser = userService.findActiveUserByUsername(username);
			//如果Service校验通过，将用户身份记录到Session
			//session.setAttribute("activeUser", activeUser);
		}
		return "redirect:/adminIndex.action";
	}

	/**
	 * 管理员默认主页面
	 * @throws Exception
	 */
	@RequiresUser
	@RequestMapping("/adminIndex")
	public String adminIndex()throws Exception{
		return "admin/adminIndex_bk";
	}


    @RequiresUser
    @RequestMapping("/toAddDict")
    public String goToAddDict()throws Exception{
        return "ziliao/addDict";
    }

	@RequiresUser
	@RequestMapping("/toIndex")
	public String goToIndex()throws Exception{
		return "ziliao/index";
	}



    @RequestMapping(value="editPwdSelf", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> editPwdSelfAction(String username, String oldPassword, String newPassword){
        Map<String, Object> map = new HashMap<>();
//        判断用户的旧密码是否正确
        map.put("code", "0");
        boolean  loginFlag = userService.matchPwdByUsername(username, oldPassword);
        if(loginFlag)
            map.put("code", "1");
		else
			return map;

        Map<String, String> pair = new HashMap<>();
        //pair为传递过去的map,pair2是需要返回随机生成的salt和hashed密码
        pair.put("newPwd", newPassword);
        Map<String, String> pair2 =  CipherUtil.getHashedPwd(pair);
        String salt = pair2.get("salt");
        String hashedNewPwd = pair2.get("hashedNewPwd");

        logger.debug("<---------->"+"editPwdSelfAction.action.salt:" + salt + ",修改后的密码是:" + newPassword + ",hashedNewPwd:" + hashedNewPwd);
        int code = userService.updatePasswordByUsername(username, hashedNewPwd, salt);
        if(code != 1) {
            logger.debug("<---------->"+"用户" + username + "修改密码失败");
            map.put("code", "0");
        }
        return map;
    }
}