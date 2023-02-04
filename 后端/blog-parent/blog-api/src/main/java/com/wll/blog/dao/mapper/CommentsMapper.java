package com.wll.blog.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wll.blog.dao.pojo.Comment;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentsMapper extends BaseMapper<Comment> {
}
