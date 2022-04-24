package com.cq.service;

import com.cq.exception.LoginException;
import com.cq.pojo.SysUser;

import java.util.List;

public interface UserService {
    //    登录的查询
    SysUser Login(String loginName, String loginPwd) throws LoginException;
    //列表页的查询所有的数据
    List<SysUser> userList();
    //增加用户
    int userAdd(SysUser user);
    //查看单个用户
    SysUser userSee(int id);
    //更改单个用户
    int userUpdate(SysUser user) throws LoginException;
    //删除用户
    int UserDelete(int id);
}
