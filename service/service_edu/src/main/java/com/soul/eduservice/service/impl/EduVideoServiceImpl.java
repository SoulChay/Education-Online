package com.soul.eduservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.soul.eduservice.client.VodClient;
import com.soul.eduservice.entity.EduVideo;
import com.soul.eduservice.mapper.EduVideoMapper;
import com.soul.eduservice.service.EduVideoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 课程视频 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2022-03-21
 */
@Service
public class EduVideoServiceImpl extends ServiceImpl<EduVideoMapper, EduVideo> implements EduVideoService {


    @Autowired
    private VodClient vodClient;

    //根据课程id删除小节
    //根据课程id删除视频
    @Override
    public void removeVideoByCourseId(String courseId) {

        //根据课程id查询所有视频
        QueryWrapper<EduVideo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("course_id",courseId);
        queryWrapper.select("video_source_id");
        List<EduVideo> eduVideoList = baseMapper.selectList(queryWrapper);

        List<String> videoIds = new ArrayList<>();
        for (EduVideo video : eduVideoList) {
            String videoSourceId = video.getVideoSourceId();
            if (!StringUtils.isEmpty(videoSourceId)){
                videoIds.add(videoSourceId); //放到集合中
            }
        }

        if (videoIds.size() > 0){
            vodClient.deleteBatch(videoIds);//删除视频
        }
        //删除课程
        QueryWrapper<EduVideo> wrapper= new QueryWrapper<>();
        wrapper.eq("course_id",courseId);
        baseMapper.delete(wrapper);
    }
}
