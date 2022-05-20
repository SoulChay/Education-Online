package com.soul.educenter.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.soul.commonutils.utils.JwtUtils;
import com.soul.commonutils.utils.MD5;
import com.soul.educenter.entity.UcenterMember;
import com.soul.educenter.entity.vo.LoginVo;
import com.soul.educenter.entity.vo.RegisterVo;
import com.soul.educenter.mapper.UcenterMemberMapper;
import com.soul.educenter.service.UcenterMemberService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soul.servicebase.exception.GuliException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 会员表 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2022-03-26
 */
@Service
public class UcenterMemberServiceImpl extends ServiceImpl<UcenterMemberMapper, UcenterMember> implements UcenterMemberService {

    @Autowired
    private RedisTemplate<String,String> redisTemplate;

    //登录方法
    @Override
    public String login(LoginVo loginVo) {

        String email = loginVo.getEmail();
        String password = loginVo.getPassword();

        //校验参数
        if (StringUtils.isEmpty(email) || StringUtils.isEmpty(password)) {
            throw new GuliException("登录失败", 20001);
        }

        //获取用户
        UcenterMember member = baseMapper.selectOne(
                new QueryWrapper<UcenterMember>().eq("email", email));

        if (null == member) {
            throw new GuliException("用户不存在", 20001);
        }

        //校验密码
        if (!MD5.encrypt(password).equals(member.getPassword())) {
            throw new GuliException("密码错误", 20001);
        }

        //校验是否被禁用
        if (member.getIsDisabled()) {
            throw new GuliException("用户已被禁用", 20001);
        }

        //使用JWT生成token字符串
        String jwtToken  = JwtUtils.getJwtToken(member.getId(), member.getNickname());

        return jwtToken ;

    }


    //注册方法
    @Override
    public void register(RegisterVo registerVo) {

        //获取注册信息，进行校验
        String nickname = registerVo.getNickname();
        String email = registerVo.getEmail();
        String password = registerVo.getPassword();
        String code = registerVo.getCode();
        //校验参数
        if (StringUtils.isEmpty(email) || StringUtils.isEmpty(password)
                || StringUtils.isEmpty(code) || StringUtils.isEmpty(nickname)) {
            throw new GuliException("注册信息不全", 20001);
        }
        //校验校验验证码
        //从redis获取发送的验证码
        String mobleCode = redisTemplate.opsForValue().get(email);
        if (!code.equals(mobleCode)) {
            throw new GuliException("验证码错误", 20001);
        }
        //查询数据库中是否存在
        Integer count = baseMapper.selectCount(
                new QueryWrapper<UcenterMember>().eq("email", email));
        if (count.intValue() > 0) {
            throw new GuliException("该邮箱已注册", 20001);
        }
        //添加注册信息到数据库
        UcenterMember member = new UcenterMember();
        member.setNickname(nickname);
        member.setEmail(email);
        member.setPassword(MD5.encrypt(password));
        member.setIsDisabled(false);
        member.setAvatar("http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132");


        baseMapper.insert(member);
    }

    //根据openid判断是否已存入数据库
    @Override
    public UcenterMember getOpenIdMember(String openid) {
        QueryWrapper<UcenterMember> wrapper = new QueryWrapper<>();
        wrapper.eq("openid",openid);
        UcenterMember member = baseMapper.selectOne(wrapper);
        return member;
    }

    //查询某一天注册人数
    @Override
    public Integer countRegisterDay(String day) {

        return baseMapper.countRegisterDay(day);
    }
}
