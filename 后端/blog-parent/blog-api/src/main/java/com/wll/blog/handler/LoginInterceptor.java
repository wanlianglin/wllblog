package com.wll.blog.handler;

import com.alibaba.fastjson.JSON;
import com.wll.blog.dao.pojo.SysUser;
import com.wll.blog.dao.vo.ErrorCode;
import com.wll.blog.dao.vo.Result;
import com.wll.blog.service.LoginService;
import com.wll.blog.utils.UserThreadLocal;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
@Component
public class LoginInterceptor implements HandlerInterceptor {

    @Autowired
    private LoginService loginService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //在执行controller方法(Handler)之前进行执行
        /**
         * 1．需要判断请求的接口路径是否为 HandlerMethod (controller方法)
         * 2．判断token是否为空，如果为空未登录
         * 3.如果token不为空，登录验证loginservice checkToken
         * 4.如果认证成功放行即可
         */
        if (!(handler instanceof HandlerMethod)){
            //如果是handler方法，就放行。
            return true;
        }

        //使用slf4j做日志输出
        String token = request.getHeader("Authorization");
        log.info("=================request start===========================");
        String requestURI = request.getRequestURI();
        log.info("request uri:{}",requestURI);
        log.info("request method:{}",request.getMethod());
        log.info("token:{}", token);
        log.info("=================request end===========================");

        //如果token为空，不放行并提示未登录
        if (StringUtils.isBlank(token)){
            Result result = Result.fail(ErrorCode.NO_LOGIN.getCode(), "未登录");
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().print(JSON.toJSONString(result));
            return false;
        }

        //将token解析为sysUser实体类，如果实体类为空，提示不登录，并不放行。
        SysUser sysUser = loginService.checkToken(token);
        if (sysUser == null){
            Result result = Result.fail(ErrorCode.NO_LOGIN.getCode(), "未登录");
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().print(JSON.toJSONString(result));
            return false;
        }
        //登录验证成功 放行
        // 在controller中直接获取用户的信息
        UserThreadLocal.put(sysUser);
        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        //如果不删除ThreadLocal中用完的信息会有内存泄漏的风险
        UserThreadLocal.remove();
    }
}
