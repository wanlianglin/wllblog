package com.wll.blog.service;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.wll.blog.dao.mapper.ArticleMapper;
import com.wll.blog.dao.pojo.Article;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

@Component
public class ThreadService {

    //期望此操作在线程池执行不会影啊原有的主线程
    @Async("taskExecutor") //将此方法放到taskExecutor线程池中执行（异步执行）
    public void updateAtricleViewCount(ArticleMapper articleMapper, Article article) {
        //获取当前浏览数
        int viewCounts = article.getViewCounts();
        Article articleUpdate = new Article();
        articleUpdate.setViewCounts(viewCounts+1);
        //update article set view_count=100 where view_count=99 and id = 1
        LambdaUpdateWrapper<Article> updateWrapper = new LambdaUpdateWrapper<>();
        updateWrapper.eq(Article::getViewCounts,viewCounts);
        updateWrapper.eq(Article::getId,article.getId());
        articleMapper.update(articleUpdate,updateWrapper);
    }
}
