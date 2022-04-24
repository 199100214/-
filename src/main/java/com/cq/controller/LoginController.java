package com.cq.controller;

import com.cq.exception.LoginException;
import com.cq.pojo.SysUser;
import com.cq.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {

    @Resource
    private UserService userService;
    private Logger logger = Logger.getLogger(LoginController.class);
    @RequestMapping(value = {"/login1","/login2"})
    public String index(HttpServletRequest request){
        logger.debug("进入处理");
        String path = request.getContextPath();
        String path2 = request.getRequestURI();
        logger.debug(path);
        if (path2.equals(path+"/login2")){
            return "index";
        }
        return "login";
    }
    @RequestMapping(value = "/login.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> Login(String loginName, String loginPwd, HttpSession session){
        Map<String,Object> map =new HashMap<String, Object>();
        logger.debug(loginName+loginPwd);
        try {
            SysUser user = userService.Login(loginName,loginPwd);
            session.setAttribute("userCount",user.getAccount());
            session.setAttribute("userId",user.getId());
        } catch (LoginException e) {
            e.printStackTrace();
            e.printStackTrace();
            String msg  = e.getMessage();
            map.put("success",false);
            map.put("msg",msg);
            return map;
        }
        map.put("success",true);
        map.put("msg","成功");
        return map;

    }
    @RequestMapping("/loginOut")
    public String LoginOut(HttpSession session){
        session.invalidate();//session销毁
        return "redirect:index.jsp";
    }
}
