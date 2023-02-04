package com.wll.blog.service;


import com.wll.blog.dao.vo.Result;
import com.wll.blog.dao.vo.params.CommentParam;

public interface CommentsService {

    Result commentsByArticleId(Long id);

    Result comment(CommentParam commentParam);
}
