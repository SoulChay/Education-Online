package com.soul.eduservice.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.soul.eduservice.entity.EduTeacher;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 * 讲师 服务类
 * </p>
 *
 * @author testjava
 * @since 2022-03-13
 */
public interface EduTeacherService extends IService<EduTeacher> {

    //分页查询讲师方法
    Map<String, Object> getTeacherFrontList(Page<EduTeacher> pageTeacher);
}
