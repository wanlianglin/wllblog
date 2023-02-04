package com.wll.blog.service;

import com.wll.blog.dao.pojo.SysUser;
import com.wll.blog.dao.vo.Result;
import com.wll.blog.dao.vo.params.LoginParam;
import org.springframework.transaction.annotation.Transactional;

//@Transactional
public interface LoginService {
    /**
     * 登录功能
     * @param loginParam
     * @return
     */
    Result login(LoginParam loginParam);

    SysUser checkToken(String token);

    /**
     * 退出登录
     * @param token
     * @return
     */
    Result logout(String token);

    /**
     * 1.判断参数是否合法
     * 2．判断账户是否存在，存在返回账户已经被注册3．不存在，注册用户
     * 4．生成token
     * 5．存入redis并返回
     * 6．注意加上事务，一旦中间的任何过程出现问题，注册的用户需要回滚
     * @param loginParam
     * @return
     */
    Result register(LoginParam loginParam);
}
