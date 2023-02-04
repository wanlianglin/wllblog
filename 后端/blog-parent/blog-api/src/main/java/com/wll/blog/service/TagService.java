package com.wll.blog.service;

import com.wll.blog.dao.vo.Result;
import com.wll.blog.dao.vo.TagVo;

import java.util.List;

public interface TagService {

    List<TagVo> findTagsByArticleId(Long articleId);

    Result hots(int limit);

    Result findAll();

    Result findAllDetail();

    Result findAllDetailById(Long id);
}
