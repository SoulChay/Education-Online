package com.soul.eduservice.controller.front;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.soul.commonutils.response.R;
import com.soul.eduservice.entity.EduCourse;
import com.soul.eduservice.entity.EduTeacher;
import com.soul.eduservice.service.EduCourseService;
import com.soul.eduservice.service.EduTeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/eduservice/teacherfront")
public class TeacherFrontController {

    @Autowired
    private EduTeacherService teacherService;

    @Autowired
    private EduCourseService courseService;

    //分页查询讲师方法
    @PostMapping("getTeacherFrontList/{page}/{limit}")
    public R getTeacherFrontList(@PathVariable long page, @PathVariable long limit){
        Page<EduTeacher> pageTeacher = new Page<>(page, limit);
        Map<String,Object> map = teacherService.getTeacherFrontList(pageTeacher);
        //返回分页所有数据
        return  R.ok().data(map);
    }

    //讲师详情功能
    @GetMapping("getTeacherFrontInfo/{teacherId}")
    public R getTeacherFrontInfo(@PathVariable String teacherId){
        EduTeacher eduTeacher = teacherService.getById(teacherId);
        QueryWrapper<EduCourse> wrapper = new QueryWrapper<>();
        wrapper.eq("teacher_id",teacherId);
        List<EduCourse> courseList = courseService.list(wrapper);
        return R.ok().data("teacher",eduTeacher).data("courseList",courseList);
    }

}
