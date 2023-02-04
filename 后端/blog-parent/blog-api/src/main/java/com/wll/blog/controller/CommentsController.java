package com.wll.blog.controller;

import com.wll.blog.dao.vo.Result;
import com.wll.blog.dao.vo.params.CommentParam;
import com.wll.blog.service.CommentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("comments")
public class CommentsController {

    @Autowired
    private CommentsService commentsService;

    // comments/article/{id}

    /**
     * 子评论查询
     * @param id
     * @return
     */
    @GetMapping("/article/{id}")
    public Result comments(@PathVariable("id")Long id){
        return commentsService.commentsByArticleId(id);
    }

    /**
     * 评论功能
     * @param commentParam
     * @return
     */
    @PostMapping("/create/change")
    public Result comment(@RequestBody CommentParam commentParam){
        return commentsService.comment(commentParam);
    }

}
