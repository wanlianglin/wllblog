package com.wll.blog.config;

import com.wll.blog.handler.LoginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer {

    //注入登录拦截器
    @Autowired
    private LoginInterceptor loginInterceptor;

    /**
     * 添加跨域配置
     * @param registry
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        //跨域配置
        registry.addMapping("/**")
                .allowedOrigins("http://localhost:8080");  //开发时的配置
//                .allowedOrigins("http://www.wllblog.top/","http://47.108.139.243:8080","http://47.108.139.243:80","http://47.108.139.243:8888","null")
//                .allowedMethods("POST","PUT","OPTIONS","DELETE")
//                .maxAge(3600)
//                .allowCredentials(true)
//                .allowedHeaders("*");
    }

    /**
     * 添加登录拦截器
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //拦截所有接口，除了/login和/register，后续实际遇到需要拦截的接口时，在配置为真正的拦截接口
        /*registry.addInterceptor(loginInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/login")
                .excludePathPatterns("/register");*/
        //写个test做下测试（测试当请求头带有token并验证成功后，能否访问test接口）
        registry.addInterceptor(loginInterceptor)
                .addPathPatterns("/test")
                .addPathPatterns("/comments/create/change")
                .addPathPatterns("/articles/publish");
    }
}
