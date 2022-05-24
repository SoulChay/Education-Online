package com.soul.eduservice.controller.admin;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.soul.commonutils.response.R;
import com.soul.eduservice.entity.EduCourse;
import com.soul.eduservice.entity.EduTeacher;
import com.soul.eduservice.entity.vo.CourseInfoVo;
import com.soul.eduservice.entity.vo.CoursePublishVo;
import com.soul.eduservice.entity.vo.CourseQuery;
import com.soul.eduservice.entity.vo.TeacherQuery;
import com.soul.eduservice.service.EduCourseService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 课程 前端控制器
 * </p>
 *
 * @author testjava
 * @since 2022-03-21
 */
@RestController
@RequestMapping("/eduservice/course")
public class EduCourseController {

    @Autowired
    private EduCourseService courseService;

    //查询课程列表
    @GetMapping
    public R getCourseList(){
        List<EduCourse> list = courseService.list(null);
        return R.ok().data("list",list);
    }

    //删除某个课程
    @DeleteMapping("{id}")
    public R deleteCourse(@PathVariable String id){
        boolean b = courseService.removeCourse(id);
        return b ? R.ok() : R.error();
    }


    //分页查询课程
    @GetMapping("/pageCourse/{current}/{limit}")
    public R pageListCourse(@PathVariable long current,
                             @PathVariable long limit) {
        Page<EduCourse> pageCourse = new Page<>(current,limit);
        courseService.page(pageCourse, null);//分页查询的数据依然存在于pageTeacher
        long total = pageCourse.getTotal();
        List<EduCourse> records = pageCourse.getRecords();
        return R.ok().data("total", total).data("rows", records);
    }

    //条件查询课程(带分页)
    @PostMapping("/pageCourseCondition/{current}/{limit}")
    public R pageCourseCondition(@PathVariable long current,
                                  @PathVariable long limit,
                                  @RequestBody(required = false) CourseQuery courseQuery) {
        //创建page对象
        Page<EduCourse> pageCourse = new Page<>(current,limit);
        //添加条件
        QueryWrapper<EduCourse> wrapper = new QueryWrapper();
        String status = courseQuery.getStatus();
        String name = courseQuery.getTitle();

        if (!StringUtils.isEmpty(name)) {
            wrapper.like("title", name);
        }
        if (!StringUtils.isEmpty(status)) {
            wrapper.eq("status", status);
        }
        //调用方法实现分页
        courseService.page(pageCourse, wrapper);
        long total = pageCourse.getTotal();
        List<EduCourse> records = pageCourse.getRecords();
        return R.ok().data("total", total).data("rows", records);
    }


    //添加课程
    @PostMapping("/addCourseInfo")
    public R addCourseInfo(@RequestBody CourseInfoVo courseInfoVo) {
        //返回添加之后课程id，为了后面添加大纲使用
        String id = courseService.saveCourseInfo(courseInfoVo);
        return R.ok().data("courseId",id);
    }

    //根据课程id查询课程基本信息
    @GetMapping("getCourseInfo/{id}")
    public R getCourseInfo(@PathVariable String id) {
        CourseInfoVo courseInfoVo = courseService.getCourseInfo(id);
        return R.ok().data("courseInfoVo",courseInfoVo);
    }

    //修改课程信息
    @PostMapping("updateCourseInfo")
    public R updateCourseInfo(@RequestBody CourseInfoVo courseInfoVo) {
        courseService.updateCourseInfo(courseInfoVo);
        return R.ok();
    }



    //根据课程id查询课程确认信息
    @GetMapping("getPublishCourseInfo/{id}")
    public R getPublishCourseInfo(@PathVariable String id) {
        CoursePublishVo coursePublishVo = courseService.publishCourseInfo(id);
        return R.ok().data("publishCourse",coursePublishVo);
    }

    //课程最终发布
    //修改课程状态
    @PostMapping("/publishCourse/{id}")
    public R publishCourse(@PathVariable String id){
        EduCourse eduCourse = new EduCourse();
        eduCourse.setId(id);
        eduCourse.setStatus("Normal");//课程发布状态
        courseService.updateById(eduCourse);
        return R.ok();
    }



}


