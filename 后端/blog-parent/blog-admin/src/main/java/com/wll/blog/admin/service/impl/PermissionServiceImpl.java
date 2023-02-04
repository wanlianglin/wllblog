package com.wll.blog.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wll.blog.admin.mapper.PermissionMapper;
import com.wll.blog.admin.model.params.PageParam;
import com.wll.blog.admin.pojo.Permission;
import com.wll.blog.admin.service.PermissionService;
import com.wll.blog.admin.vo.PageResult;
import com.wll.blog.admin.vo.PermissionVo;
import com.wll.blog.admin.vo.Result;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public Result listPermission(PageParam pageParam) {
        Page<Permission> page = new Page<>(pageParam.getCurrentPage(), pageParam.getPageSize());
        LambdaQueryWrapper<Permission> queryWrapper = new LambdaQueryWrapper<>();
        if (StringUtils.isNotBlank(pageParam.getQueryString())){
            queryWrapper.like(Permission::getName,pageParam.getQueryString());
        }
        Page<Permission> permissionPage = permissionMapper.selectPage(page, queryWrapper);
        PageResult<Permission> pageResult = new PageResult<>();
        pageResult.setList(permissionPage.getRecords());
        pageResult.setTotal(permissionPage.getTotal());
        return Result.success(pageResult);
    }

    @Override
    public Result addPermission(PermissionVo permissionVo) {
        Permission permission = new Permission();
        permission.setName(permissionVo.getName());
        permission.setDescription(permissionVo.getDescription());
        permission.setPath(permissionVo.getPath());
        permissionMapper.insert(permission);
        return Result.success(null);
    }

    @Override
    public Result updatePermission(PermissionVo permissionVo) {
        Permission permission = new Permission();
        permission.setId(permissionVo.getId());
        permission.setName(permissionVo.getName());
        permission.setPath(permissionVo.getPath());
        permission.setDescription(permissionVo.getDescription());
        permissionMapper.updateById(permission);
        return Result.success(null);
    }

    @Override
    public Result deletePermissionById(Long id) {
        permissionMapper.deleteById(id);
        return Result.success(null);
    }
}
