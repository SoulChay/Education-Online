package com.soul.eduservice.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.soul.eduservice.entity.EduCourse;
import com.baomidou.mybatisplus.extension.service.IService;
import com.soul.eduservice.entity.frontVo.CourseFrontVo;
import com.soul.eduservice.entity.frontVo.CourseWebVo;
import com.soul.eduservice.entity.vo.CourseInfoVo;
import com.soul.eduservice.entity.vo.CoursePublishVo;

import java.util.Map;

/**
 * <p>
 * 课程 服务类
 * </p>
 *
 * @author testjava
 * @since 2022-03-21
 */
public interface EduCourseService extends IService<EduCourse> {

    //添加课程基本信息的方法
    String saveCourseInfo(CourseInfoVo courseInfoVo);

    //根据课程id查询课程基本信息
    CourseInfoVo getCourseInfo(String courseId);

    //修改课程信息
    void updateCourseInfo(CourseInfoVo courseInfoVo);

    //根据课程id查询课程确认信息
    CoursePublishVo publishCourseInfo(String id);

    //删除课程
    void removeCourse(String courseId);

    //条件查询课程带分页功能
    Map<String, Object> getCourseFrontList(Page<EduCourse> pageCourse, CourseFrontVo courseFrontVo);

    CourseWebVo getBaseCourseInfo(String courseId);
}
