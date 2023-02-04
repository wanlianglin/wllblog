package com.wll.blog.admin.controller;

import com.wll.blog.admin.model.params.PageParam;
import com.wll.blog.admin.service.PermissionService;
import com.wll.blog.admin.vo.PermissionVo;
import com.wll.blog.admin.vo.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private PermissionService permissionService;

    /**
     * 分页查询
     * @param pageParam
     * @return
     */
    @PostMapping("/permission/permissionList")
    public Result listPermission(@RequestBody PageParam pageParam){
        return permissionService.listPermission(pageParam);
    }

    /**
     * 添加权限
     * @param permissionVo
     * @return
     */
    @PostMapping("/permission/add")
    public Result addPermission(@RequestBody PermissionVo permissionVo){
        return permissionService.addPermission(permissionVo);
    }

    /**
     * 修改权限
     * @param permissionVo
     * @return
     */
    @PostMapping("/permission/update")
    public Result updatePermission(@RequestBody PermissionVo permissionVo){
        return permissionService.updatePermission(permissionVo);
    }

    /**
     * 根据id删除对应的权限
     * @param id
     * @return
     */
    @GetMapping("/permission/delete/{id}")
    public Result deletePermissionById(@PathVariable("id") Long id){
        return permissionService.deletePermissionById(id);
    }
}
