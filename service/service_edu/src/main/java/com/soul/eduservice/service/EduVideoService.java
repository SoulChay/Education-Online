package com.soul.eduservice.service;

import com.soul.eduservice.entity.EduVideo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 课程视频 服务类
 * </p>
 *
 * @author testjava
 * @since 2022-03-21
 */
public interface EduVideoService extends IService<EduVideo> {
    //根据课程id删小节
    void removeVideoByCourseId(String courseId);
}
