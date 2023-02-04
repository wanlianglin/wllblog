package com.wll.blog.admin.service;

import com.wll.blog.admin.pojo.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;

/**
 * 登录认证
 */
@Component
public class SecurityUserService implements UserDetailsService {

    @Autowired
    private AdminService adminService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //登录的时候，会把username传递到这里
        //通过username查询 admin表，如果admin存在将密码告诉spring security
        //如果不存在 返回null 认证失败了
        Admin adminByUsername = adminService.findAdminByUsername(username);
        if (adminByUsername == null){
            //登录失败
            return null;
        }
        //交给security进行密码验证
        UserDetails userDetails = new User(username,adminByUsername.getPassword(),new ArrayList<>());
        return userDetails;
    }
}
