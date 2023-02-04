package com.wll.blog.admin.service;

import com.wll.blog.admin.pojo.Admin;
import com.wll.blog.admin.pojo.Permission;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 权限认证
 */
@Service
public class AuthService {

    @Autowired
    private AdminService adminService;

    public boolean auth(HttpServletRequest request, Authentication authentication){
        //权限认证
        //请求路径
        String requestURI = request.getRequestURI();
        //用户详细信息
        Object principal = authentication.getPrincipal();
        if (principal == null || "anonymousUser".equals(principal)){ //如果用户为空，或者为匿名用户
            //未登录
            return false;
        }
        UserDetails userDetails = (UserDetails) principal;
        String username = userDetails.getUsername();
        Admin admin = adminService.findAdminByUsername(username);
        if (admin == null){
            return false;
        }
        if (1 == admin.getId()){ //如果admin的id为1，则认为他是超级管理员，直接放行
            return true;
        }
        Long adminId = admin.getId();

        List<Permission> permissionList = adminService.findPermissionByAdminId(adminId);
        requestURI = StringUtils.split(requestURI,'?')[0]; //如果有？，去除请求？后面的参数
        for (Permission permission : permissionList) {
            if (requestURI.equals(permission.getPath())){ //判断请求路径与权限表中的路径是否相同
                return true;
            }
        }
        return false;
    }
}
