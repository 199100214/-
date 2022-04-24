package com.cq.dao;

import com.cq.pojo.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
//    登录的查询
    SysUser Login(@Param("loginName") String loginName, @Param("loginPwd") String loginPwd);
    //列表页的查询所有的数据
    List<SysUser> userList();
    //增加用户
    int userAdd(SysUser user);
    //查看单个用户
    SysUser userSee(int id);
    //更改单个用户
     int userUpdate(SysUser user);
    //删除用户
    int UserDelete(int id);

}
