package com.soul.staservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.soul.commonutils.comment.UcenterMember;
import com.soul.commonutils.response.R;
import com.soul.staservice.client.UcenterClient;
import com.soul.staservice.entity.StatisticsDaily;
import com.soul.staservice.mapper.StatisticsDailyMapper;
import com.soul.staservice.service.StatisticsDailyService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.management.Query;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 网站统计日数据 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2022-03-31
 */
@Service
public class StatisticsDailyServiceImpl extends ServiceImpl<StatisticsDailyMapper, StatisticsDaily> implements StatisticsDailyService {

    @Autowired
    private UcenterClient ucenterClient;

    @Override
    public void registerCount(String day) {
        //添加记录之前删除相同日期的数据
        QueryWrapper<StatisticsDaily> wrapper = new QueryWrapper<>();
        wrapper.eq("date_calculated",day);
        baseMapper.delete(wrapper);

        //远程调用得到某一天的注册人数
        R registerR = ucenterClient.countRegister(day);
        Integer countRegister = (Integer) registerR.getData().get("countRegister");
        //把获取到的数据添加进数据库，统计分析表里面
        StatisticsDaily sta = new StatisticsDaily();
        sta.setRegisterNum(countRegister);//注册人数
        sta.setDateCalculated(day);//统计日期
        sta.setVideoViewNum(RandomUtils.nextInt(100,200));
        sta.setRegisterNum(RandomUtils.nextInt(100,200));
        sta.setLoginNum(RandomUtils.nextInt(100,200));
        baseMapper.insert(sta);
    }

    //图表显示，返回两部分数据，日期json数据，数量json数据
    @Override
    public Map<String, Object> getShowData(String type, String begin, String end) {
        //根据条件查询对应数据
        QueryWrapper<StatisticsDaily> queryWrapper = new QueryWrapper<>();
        queryWrapper.between("date_calculated",begin,end);
        queryWrapper.select("date_calculated",type);
        List<StatisticsDaily> staList = baseMapper.selectList(queryWrapper);

        //返回日期 + 日期对应数量
        List<String> dateList = new ArrayList<>();
        List<Integer> numList = new ArrayList<>();

        //进行封装
        for (StatisticsDaily daily : staList) {
            dateList.add(daily.getDateCalculated());
            switch (type){
                case "login_num":
                    numList.add(daily.getLoginNum());
                    break;
                case "register_num":
                    numList.add(daily.getRegisterNum());
                    break;
                case "video_view_num":
                    numList.add(daily.getVideoViewNum());
                    break;
                case "course_num":
                    numList.add(daily.getCourseNum());
                    break;
                default:
                    break;
            }
        }

        Map<String,Object> map = new HashMap<>();
        map.put("date_calculatedList",dateList);
        map.put("numDataList",numList);

        return map;
    }
}
