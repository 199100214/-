package com.cq.controller;

import com.cq.exception.LoginException;
import com.cq.pojo.SysUser;
import com.cq.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class UserController {
    @Resource
    private UserService userService;
    private Logger logger = Logger.getLogger(UserController.class);
//    查看所有成员的信息
    @RequestMapping(value = "/user/list")
    public ModelAndView userList(){
        ModelAndView modelAndView = new ModelAndView();
        List<SysUser> userList = userService.userList();
        logger.debug(userList);
        modelAndView.addObject("userList",userList);
        modelAndView.setViewName("/sysUser/list");
        return modelAndView;
    }
    //添加操作
    @RequestMapping(value = "/user/add",method = RequestMethod.POST)
    @ResponseBody
    public String userInsert(SysUser user,HttpServletRequest request){
        logger.debug(request.getParameter("name"));
        logger.debug(user.toString());

        try {
            userService.Login(user.getAccount(),user.getPassword());
        } catch (LoginException e) {
            e.printStackTrace();
            String msg  = e.getMessage();
            logger.debug(msg);//这里利用前端写的登录来保证拒绝重名的注册，只有查出来为空的时候才继续执行插入
            //捕捉的信息应该是 账户密码错误
            int count = userService.userAdd(user);
            if (count == 1){
                return "ok";
            }else{
                return "default";
            }
        }
        return "default";
    }
    //修改操作，等于 先查在显示，显示结束之后再提交，这个方法直通过id的方式查询
    @RequestMapping(value = "/user/edit")
    public String userSee(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        SysUser user = userService.userSee(id);
        logger.debug(user.toString());
        request.setAttribute("user",user);
        return "forward:/view/sysUser/edit.jsp";
    }
    //显示结束之后在这里提交数据进行修改
    @RequestMapping(value = "/user/edit/update",produces = "text/html;charset=utf-8",method = RequestMethod.POST)
    @ResponseBody
    public String userUpdate(SysUser user){
        logger.debug(user.toString());
        try {
            int count = userService.userUpdate(user);
            logger.debug(count);
        } catch (LoginException e) {
            e.printStackTrace();
            String msg  = e.getMessage();
            logger.debug(msg);//这里利用前端写的登录来保证拒绝重名的修改，只有查出来为空的时候才继续执行插入
            //捕捉的信息应该是 账户密码错误
           return msg;
        }
        return "ok";
    }
    @RequestMapping(value = "/user/delete")
    @ResponseBody
    public String UserDelete(String id){
        int did = Integer.parseInt(id);
        int count = userService.UserDelete(did);
        if (count == 1){
            return "ok";
        }else{
            return "default";
        }

    }
    @RequestMapping(value = "/user/detail")
    public String userSee(String id,HttpServletRequest request){
        int did = Integer.parseInt(id);
        SysUser user= userService.userSee(did);
        logger.debug(user.toString());
        request.setAttribute("user",user);
        return "forward:/view/sysUser/see.jsp";

    }
}
