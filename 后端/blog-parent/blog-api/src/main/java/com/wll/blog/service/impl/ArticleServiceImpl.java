package com.wll.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wll.blog.dao.dos.Archives;
import com.wll.blog.dao.mapper.ArticleBodyMapper;
import com.wll.blog.dao.mapper.ArticleMapper;
import com.wll.blog.dao.mapper.ArticleTagMapper;
import com.wll.blog.dao.pojo.Article;
import com.wll.blog.dao.pojo.ArticleBody;
import com.wll.blog.dao.pojo.ArticleTag;
import com.wll.blog.dao.pojo.SysUser;
import com.wll.blog.dao.vo.*;
import com.wll.blog.dao.vo.params.ArticleMessage;
import com.wll.blog.dao.vo.params.ArticleParam;
import com.wll.blog.dao.vo.params.PageParams;
import com.wll.blog.service.*;
import com.wll.blog.utils.UserThreadLocal;
//import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.joda.time.DateTime;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Autowired
    private TagService tagService;

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private ArticleTagMapper articleTagMapper;

//    @Autowired
//    private RocketMQTemplate rocketMQTemplate;

    @Override
    public Result listArticle(PageParams pageParams) {
        /**
         * 分页查询 article数据库表
         */
        Page<Article> page = new Page<>(pageParams.getPage(), pageParams.getPageSize());
        IPage<Article> articleIPage = articleMapper.listArchive(page,
                pageParams.getCategoryId(),
                pageParams.getTagId(),
                pageParams.getYear(),
                pageParams.getMonth());
        List<Article> records = articleIPage.getRecords();
        return Result.success(copyList(records,true,true));
    }

    /*@Override
    public Result listArticle(PageParams pageParams) {
        Page<Article> page = new Page<>(pageParams.getPage(),pageParams.getPageSize());
        //查询条件
        LambdaQueryWrapper<Article> queryWrapper = new LambdaQueryWrapper<>();
        if (pageParams.getCategoryId() != null){
            // and category_id = #{categoryId}
            queryWrapper.eq(Article::getCategoryId,pageParams.getCategoryId());
        }
        if (pageParams.getTagId() != null){
            //article表中 并没有tag字段 一篇文章 有多个标签
            //article_tag article_id n:n tag_id
            LambdaQueryWrapper<ArticleTag> articleTagQueryWrapper = new LambdaQueryWrapper<>();
            articleTagQueryWrapper.eq(ArticleTag::getTagId,pageParams.getTagId());
            List<ArticleTag> articleTags = articleTagMapper.selectList(articleTagQueryWrapper);
            List<Long> tagIds = new ArrayList<>();
            for (ArticleTag articleTag : articleTags) {
                tagIds.add(articleTag.getArticleId());
            }
            if (tagIds.size() > 0){
                queryWrapper.in(Article::getId,tagIds);
            }
        }
        //按时间排序和是否置顶排序
        queryWrapper.orderByDesc(Article::getWeight,Article::getCreateDate);
        Page<Article> articlePage = articleMapper.selectPage(page, queryWrapper);
        List<Article> records = articlePage.getRecords();
        //将Article类型数据转换为ArticleVo
        List<ArticleVo> articleVoList = copyList(records,true,true);
        return Result.success(articleVoList);
    }*/

    @Override
    public Result hotArticle(int limit) {
        LambdaQueryWrapper<Article> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.orderByDesc(Article::getViewCounts);
        queryWrapper.select(Article::getId,Article::getTitle);
        queryWrapper.last("limit "+limit);
        //select id,title from article order by view_counts desc limit 5
        List<Article> articles = articleMapper.selectList(queryWrapper);
        return Result.success(copyList(articles,false,false));
    }

    @Override
    public Result newArticle(int limit) {
        LambdaQueryWrapper<Article> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.orderByDesc(Article::getCreateDate);
        queryWrapper.select(Article::getId,Article::getTitle);
        queryWrapper.last("limit "+limit);
        //select id,title from article order by create_date desc limit 5
        List<Article> articles = articleMapper.selectList(queryWrapper);
        return Result.success(copyList(articles,false,false));
    }

    /**
     * 文章归档
     * @return
     */
    @Override
    public Result listArchives() {
        List<Archives> archivesList = articleMapper.listArchives();
        return Result.success(archivesList);
    }

    @Autowired
    private ThreadService threadService;

    @Override
    public Result findAticleById(Long articleId) {
        /**
         * 1．根据id查询文章信息
         * 2．根据bodyId和categoryid去傲关联查询
         */
//        ArticleVo articleVo = ?;
        Article article = this.articleMapper.selectById(articleId);

        ArticleVo articleVo = copy(article,true,true,true,true);

        //查看完文章，新增阅读数
        //查看完文章之后，本应该直接返回数据了，这时候做了一个更新操作，更新时加写锁，阻塞其他的读操作，性能就会比较低
        //更新增加了此次接口的耗时 如果一旦更新出问题，不能影啊查看文章的操作
        //使用线程池 可以把更新操作扔到线程池中去执行，和主线程就不相关了
        threadService.updateAtricleViewCount(articleMapper,article);
        return Result.success(articleVo);
    }

    /**
     * 文章发布
     * @param articleParam
     * @return
     */
    @Override
    public Result publish(ArticleParam articleParam) {
        //要把这个接口加入到登录拦截中
        SysUser sysUser = UserThreadLocal.get();
        /**
         * 1.发布文章 ：要构建一个Article对象
         * 2.要把标签存入文章标签关联表
         * 3.body内容存入 文章 内容 关联表
         */
//        boolean isEdit = false;
        Article article = new Article();
        if (articleParam.getId() != null){
            article = new Article();
            article.setId(articleParam.getId());
            article.setTitle(articleParam.getTitle());
            article.setSummary(articleParam.getSummary());
            article.setCategoryId(Long.parseLong(articleParam.getCategory().getId()));
            articleMapper.updateById(article);
//            isEdit = true;
        }else {
            article = new Article();
            article.setCommentCounts(0);
            article.setCreateDate(System.currentTimeMillis());
            article.setSummary(articleParam.getSummary());
            article.setTitle(articleParam.getTitle());
            article.setViewCounts(0);
            article.setWeight(Article.Article_Common);
            article.setAuthorId(sysUser.getId());
            article.setCategoryId(Long.parseLong(articleParam.getCategory().getId()));
            //插入一个article，生成文章id
            articleMapper.insert(article);
        }
        //ArticleTag
        List<TagVo> tags = articleParam.getTags();
        if (tags != null){
            for (TagVo tag : tags) {
                ArticleTag articleTag = new ArticleTag();
                articleTag.setTagId(Long.parseLong(tag.getId()));
                articleTag.setArticleId(article.getId());
                articleTagMapper.insert(articleTag);
            }
        }
        //ArticleBody
        ArticleBody articleBody = new ArticleBody();
        articleBody.setArticleId(article.getId());
        articleBody.setContent(articleParam.getBody().getContent());
        articleBody.setContentHtml(articleParam.getBody().getContentHtml());
        articleBodyMapper.insert(articleBody);
        article.setBodyId(articleBody.getId());
        //更新，否则没有BodyId
        articleMapper.updateById(article);
        Map<String,String> map = new HashMap<>();
        map.put("id",article.getId().toString());

//        if(isEdit){
//            //发送一条消息给rocketmq,当前文章更新了，更新一下缓存
//            ArticleMessage articleMessage = new ArticleMessage();
//            articleMessage.setArticleId(article.getId());
//            rocketMQTemplate.convertAndSend("blog-update-article",articleMessage);
//        }
        return Result.success(map);
    }

    @Override
    public Result searchArticle(String search) {
        LambdaQueryWrapper<Article> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.orderByDesc(Article::getViewCounts);
        queryWrapper.select(Article::getId,Article::getTitle);
        queryWrapper.like(Article::getTitle,search);
        List<Article> articles = articleMapper.selectList(queryWrapper);

        return Result.success(copyList(articles,false,false));
    }

    /**
     * 将list集合records转换为ArticleVo类型的集合
     * @param records
     * @param isTag
     * @param isAuthor
     * @return
     */
    private List<ArticleVo> copyList(List<Article> records,boolean isTag,boolean isAuthor) {
        ArrayList<ArticleVo> articleVoList = new ArrayList<>();
        //通过遍历将record依次转换为ArticleVo类型
        for (Article record : records) {
            articleVoList.add(copy(record,isTag,isAuthor,false,false));
        }
        return articleVoList;
    }

    private List<ArticleVo> copyList(List<Article> records,boolean isTag,boolean isAuthor,boolean isBody,boolean isCategory) {
        ArrayList<ArticleVo> articleVoList = new ArrayList<>();
        //通过遍历将record依次转换为ArticleVo类型
        for (Article record : records) {
            articleVoList.add(copy(record,isTag,isAuthor,isBody,isCategory));
        }
        return articleVoList;
    }

    @Autowired
    private CategoryService categoryService;

    //将Article类型装换为ArticleVo
    private ArticleVo copy(Article article,boolean isTag,boolean isAuthor,boolean isBody,boolean isCategory){
        ArticleVo articleVo = new ArticleVo();
        articleVo.setId(String.valueOf(article.getId()));
        //将Article类型装换为ArticleVo
        BeanUtils.copyProperties(article,articleVo);

        //Article的Long类型的createDate转换为与articleVo匹配的String类型的createDate
        articleVo.setCreateDate(new DateTime(article.getCreateDate()).toString("yyyy-MM-dd HH:mm"));
        //判断是否需要标签，作者
        if (isTag){
            Long articleId = article.getId();
            articleVo.setTags(tagService.findTagsByArticleId(articleId));
        }
        if (isAuthor){
            Long authorId = article.getAuthorId();
            SysUser userById = sysUserService.findUserById(authorId);
            UserVo userVo = new UserVo();
            userVo.setAvatar(userById.getAvatar());
            userVo.setId(userById.getId().toString());
            userVo.setNickname(userById.getNickname());
            articleVo.setAuthor(userVo);
        }
        if (isBody){
            Long bodyId = article.getBodyId();
            articleVo.setBody(findAticleBodyById(bodyId));
        }
        if (isCategory){
            Long categoryId = article.getCategoryId();
            articleVo.setCategory(categoryService.findCategoryById(categoryId));
        }
        return articleVo;
    }

    @Autowired
    private ArticleBodyMapper articleBodyMapper;

    private ArticleBodyVo findAticleBodyById(Long bodyId) {
        ArticleBody articleBody = articleBodyMapper.selectById(bodyId);
        ArticleBodyVo articleBodyVo = new ArticleBodyVo();
        articleBodyVo.setContent(articleBody.getContent());
        return articleBodyVo;
    }
}
