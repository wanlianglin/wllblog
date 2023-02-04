package com.wll.blog.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.wll.blog.admin.mapper.AdminMapper;
import com.wll.blog.admin.pojo.Admin;
import com.wll.blog.admin.pojo.Permission;
import com.wll.blog.admin.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin findAdminByUsername(String username) {
        LambdaQueryWrapper<Admin> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Admin::getUsername,username);
        queryWrapper.last("limit 1");
        Admin admin = adminMapper.selectOne(queryWrapper);
        return admin;
    }


    @Override
    public List<Permission> findPermissionByAdminId(Long adminId) {
        List<Permission> permissionList = adminMapper.findPermissionByAdminId(adminId);
        return permissionList;
    }
}
