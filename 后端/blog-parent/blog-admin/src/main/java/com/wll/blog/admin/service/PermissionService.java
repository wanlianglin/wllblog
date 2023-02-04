package com.wll.blog.admin.service;

import com.wll.blog.admin.model.params.PageParam;
import com.wll.blog.admin.vo.PermissionVo;
import com.wll.blog.admin.vo.Result;

public interface PermissionService {

    Result listPermission(PageParam pageParam);

    Result addPermission(PermissionVo permissionVo);

    Result updatePermission(PermissionVo permissionVo);

    Result deletePermissionById(Long id);
}
