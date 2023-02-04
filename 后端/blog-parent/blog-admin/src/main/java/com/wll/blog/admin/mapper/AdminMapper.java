package com.wll.blog.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wll.blog.admin.pojo.Admin;
import com.wll.blog.admin.pojo.Permission;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminMapper extends BaseMapper<Admin> {

    @Select("SELECT id,`name`,path,description FROM wll_permission WHERE id IN (SELECT permission_id FROM wll_admin_permission WHERE admin_id = #{adminId})")
    List<Permission> findPermissionByAdminId(Long adminId);
}
