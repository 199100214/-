package com.cq.service.impl;

import com.cq.dao.UserDao;
import com.cq.exception.LoginException;
import com.cq.pojo.SysUser;
import com.cq.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;
    @Override
    public SysUser Login(String loginName, String loginPwd) throws LoginException {

        SysUser user = userDao.Login(loginName,loginPwd);
        if (user == null){
            throw new LoginException("账号密码错误");
        }
        //程序进入到这 密码账户正确
        //验证是否失效
        int lockState = user.getStatus();
//        String allowIps = user.getAllowIps();
        if (1 == lockState){
            throw new LoginException("账号锁定,请联系管理员");

        }
//        if (!allowIps.contains(ip)){
//            throw new LoginException("ip受限");
//
//        }
        return user;
    }

    @Override
    public List<SysUser> userList() {
        return userDao.userList();
    }


    @Override
    public int userAdd(SysUser user) {
        return userDao.userAdd(user);
    }

    @Override
    public SysUser userSee(int id) {
        return userDao.userSee(id);
    }

    @Override
    public int userUpdate(SysUser user) throws LoginException{
        SysUser user1 = userDao.userSee(user.getId());//先通过他的id查一次，对比信息变更
        //通过他改过的密码账户在查 如果两个前后相等 表示 是同id下更改除账户和密码的其他选项 则通过
        //如果查到 为空 也通过
        SysUser userSee = userDao.Login(user.getAccount(),user.getPassword());
        if (user.getAccount().equals(user1.getAccount())&&user.getPassword().equals(user1.getPassword())){
            return userDao.userUpdate(user);
        }
        if (!(userSee == null)){
            throw new LoginException("登录账号账号重名字,请重新来过");
        }
        return userDao.userUpdate(user);
    }

    @Override
    public int UserDelete(int id) {
        return userDao.UserDelete(id);
    }
}
