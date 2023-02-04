package com.wll.blog.admin.service;

import com.wll.blog.admin.pojo.Admin;
import com.wll.blog.admin.pojo.Permission;

import java.util.List;

public interface AdminService {

    Admin findAdminByUsername(String username);

    List<Permission> findPermissionByAdminId(Long adminId);
}
