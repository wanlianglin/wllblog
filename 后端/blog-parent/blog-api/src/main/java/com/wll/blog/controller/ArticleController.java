package com.wll.blog.controller;

import com.wll.blog.common.aop.LogAnnotation;
import com.wll.blog.common.cache.Cache;
import com.wll.blog.dao.vo.Result;
import com.wll.blog.dao.vo.params.ArticleParam;
import com.wll.blog.dao.vo.params.PageParams;
import com.wll.blog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("articles")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    /**
     * 搜索文章
     * @param articleParam
     * @return
     */
    @PostMapping("search")
    public Result search(@RequestBody ArticleParam articleParam){
        //写一个搜索接口
        String search = articleParam.getSearch();
        return articleService.searchArticle(search);
    }
    /**
     * 文章列表
     * @param pageParams
     * @return
     */
    @PostMapping
    //加上此注解，表示对此注解进行日志输出
    @LogAnnotation(module="文章",operator="获取文章列表")
//    @Cache(expire = 5 * 60 * 1000,name = "listArticle")
    public Result listArticle(@RequestBody PageParams pageParams){

        return articleService.listArticle(pageParams);
    }

    /**
     * 首页 最热文章
     * @return
     */
    @PostMapping("hot")
    public Result hotArticle(){
        int limit = 5;
        return articleService.hotArticle(limit);
    }

    /**
     * 首页 最新文章
     * @return
     */
    @PostMapping("new")
    public Result newArticles(){
        int limit = 5;
        return articleService.newArticle(limit);
    }

    /**
     * 首页 文章回档
     * @return
     */
    @PostMapping("listArchives")
    public Result listArchives(){
        return articleService.listArchives();
    }

    /**
     * 文章详情
     * @param articleId
     * @return
     */
    @PostMapping("view/{id}")
    public Result findArticleById(@PathVariable("id") Long articleId){
        return articleService.findAticleById(articleId);
    }

    // /articles/publish 发布文章
    @PostMapping("/publish")
    public Result publish(@RequestBody ArticleParam articleParam){
        return articleService.publish(articleParam);
    }

    @PostMapping("{id}")
    public Result articleById(@PathVariable("id") Long articleId){

        return articleService.findAticleById(articleId);
    }
}
