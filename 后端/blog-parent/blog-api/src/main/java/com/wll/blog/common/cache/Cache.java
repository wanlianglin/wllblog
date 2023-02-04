package com.wll.blog.common.cache;

import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.METHOD})
@Documented
public @interface Cache {

    //缓存时间
    long expire() default 1*60*1000;
    //缓存标识key
    String name() default "";
}
