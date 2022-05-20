package com.soul.educenter.service;

import com.soul.educenter.entity.UcenterMember;
import com.baomidou.mybatisplus.extension.service.IService;
import com.soul.educenter.entity.vo.LoginVo;
import com.soul.educenter.entity.vo.RegisterVo;

/**
 * <p>
 * 会员表 服务类
 * </p>
 *
 * @author testjava
 * @since 2022-03-26
 */
public interface UcenterMemberService extends IService<UcenterMember> {

    //登录
    String login(LoginVo loginVo);

    //注册
    void register(RegisterVo registerVo);

    //根据openid判断是否已存入数据库
    UcenterMember getOpenIdMember(String openid);

    //查询某一天注册人数
    Integer countRegisterDay(String day);
}
