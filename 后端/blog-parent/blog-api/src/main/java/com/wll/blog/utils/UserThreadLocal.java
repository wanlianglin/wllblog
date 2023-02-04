package com.wll.blog.utils;

import com.wll.blog.dao.pojo.SysUser;

public class UserThreadLocal {

    //声明为私有的
    private UserThreadLocal(){}

    private static final ThreadLocal<SysUser> LOCAL = new ThreadLocal<>();

    //放
    public static void put(SysUser sysUser){
        LOCAL.set(sysUser);
    }

    //取
    public static SysUser get(){
        return LOCAL.get();
    }

    //删除
    public static void remove(){
        LOCAL.remove();
    }
}
