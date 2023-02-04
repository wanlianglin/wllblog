package com.wll.blog.service;

import com.wll.blog.dao.vo.CategoryVo;
import com.wll.blog.dao.vo.Result;

import java.util.List;

public interface CategoryService {
    /**
     * 根据标签id查询Category
     * @param categoryId
     * @return
     */
    CategoryVo findCategoryById(Long categoryId);

    /**
     * 文章所有的分类
     * @return
     */
    Result findAll();

    /**
     * 文章分类详细展示
     * @return
     */
    Result findAllDetail();

    /**
     * 根据id查询文章分类详细展示
     * @param id
     * @return
     */
    Result categoryDetailById(Long id);
}
