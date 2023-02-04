package com.wll.blog.service.mq;

import com.alibaba.fastjson.JSON;
import com.wll.blog.dao.vo.Result;
import com.wll.blog.dao.vo.params.ArticleMessage;
import com.wll.blog.service.ArticleService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.digest.DigestUtils;
//import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
//import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.time.Duration;
import java.util.Set;

/**
 * 使用RocketMQ解决list列表缓存不更新问题，因为自己的云服务器内容不够，未使用
 */
//@Slf4j
//@Component
//@RocketMQMessageListener(topic = "blog-update-article",consumerGroup = "blog-update-article-group")
//public class ArticleListener implements RocketMQListener<ArticleMessage> {
//
//    @Autowired
//    private ArticleService articleService;
//    @Autowired
//    private RedisTemplate redisTemplate;
//
//    @Override
//    public void onMessage(ArticleMessage message) {
//        //更新查看文章详情的缓存
//        Long articleId = message.getArticleId();
//        String params = DigestUtils.md5Hex(articleId.toString());
//        String redisKey = "view_article::ArticleController::findArticleById::" +params;
//        Result articlResult = articleService.findAticleById(articleId);
//        redisTemplate.opsForValue().set(redisKey,JSON.toJSONString(articlResult), Duration.ofMillis(5 * 60 *1000));
//        log.info("更新了缓存" ,redisKey);
//        // 文章列表的缓存，不知道参数，解决方法：直接删除缓存
//        Set<String> keys = redisTemplate.keys("listArticle*");
//        keys.forEach(s -> {
//            redisTemplate.delete(s);
//            log.info("删除了文章列表的缓存===========================================：{}",s);
//        });
//    }
//}
