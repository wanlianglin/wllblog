package com.wll.blog.controller;

import com.wll.blog.dao.vo.Result;
import com.wll.blog.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/categorys")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    // /categorys
    @GetMapping
    public Result catefories(){
        return categoryService.findAll();
    }

    // /categorys/detail
    @GetMapping("/detail")
    public Result categoriesDetail(){
        return categoryService.findAllDetail();
    }

    // /categorys/detail/{id}
    @GetMapping("/detail/{id}")
    public Result categoryDetailById(@PathVariable("id") Long id){
        return categoryService.categoryDetailById(id);
    }
}
