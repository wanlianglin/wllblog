package com.wll.blog.common.cache;

import com.alibaba.fastjson.JSON;
import com.wll.blog.dao.vo.Result;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.time.Duration;
//aop 定义了一个切面，切面定义了切点和通知的关系
@Aspect
@Component
@Slf4j
public class CacheAspect {
    //注入redis
    @Autowired
    private RedisTemplate<String,String> redisTemplate;

    // 切点
    @Pointcut("@annotation(com.wll.blog.common.cache.Cache)")
    public void pt(){}

    //环绕通知
    @Around("pt()")
    public Object around(ProceedingJoinPoint pjp) {
        //获得类名
        String className = pjp.getTarget().getClass().getName();
        //获得调用的方法名
        Signature signature = pjp.getSignature();
        String methodName = signature.getName();

        //获得参数 参数类型
        Object[] args = pjp.getArgs();
        Class[] paramerterTypes = new Class[pjp.getArgs().length];
        String params = "";
        for (int i = 0; i < args.length; i++) {
            if (args[i] != null){
                params += JSON.toJSONString(args[i]);
                paramerterTypes[i] = args[i].getClass();
            } else {
                paramerterTypes[i] = null;
            }
        }
        if (StringUtils.isNotEmpty(params)){
            // 加密 以防出现key过长以及字符转义获取不到的情况
            params = DigestUtils.md5Hex(params);
        }
        try {
            Method method = pjp.getSignature().getDeclaringType().getMethod(methodName, paramerterTypes);
            //获得Cache注解
            Cache annotation = method.getAnnotation(Cache.class);
            //缓存过期时间
            long expire = annotation.expire();
            //缓存名称
            String name = annotation.name();
            //先从redis获取
            String redisKey = name + "::" + className + "::" + methodName + "::" +params;
            String redisValue = redisTemplate.opsForValue().get(redisKey);
//            System.out.println(redisKey);
            log.info(redisKey);
            log.info(redisValue);
//            System.out.println(redisValue);
            if (StringUtils.isNotEmpty(redisValue)){
                log.info("走了缓存~~~,{},{}",className,methodName);
                return JSON.parseObject(redisValue, Result.class);
            }
            //执行方法，返回执行结果process
            Object proceed = pjp.proceed();
            redisTemplate.opsForValue().set(redisKey,JSON.toJSONString(proceed), Duration.ofMillis(expire));
            log.info("存入缓存~~~,{},{}",className,methodName);
            return proceed;
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        return Result.fail(-999,"系统错误");
    }
}
