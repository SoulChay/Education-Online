package com.soul.eduservice.controller.admin;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.soul.commonutils.response.R;
import com.soul.eduservice.entity.EduTeacher;
import com.soul.eduservice.entity.vo.TeacherQuery;
import com.soul.eduservice.service.EduTeacherService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * <p>
 * 讲师 前端控制器
 * </p>
 *
 * @author testjava
 * @since 2022-03-13
 */
@Api(description = "讲师管理")
@RestController
@RequestMapping("/eduservice/teacher")
public class EduTeacherController {

    @Autowired
    private EduTeacherService teacherService;

    //查询所有讲师数据
    @ApiOperation(value = "所有讲师列表")
    @GetMapping("/findAll")
    public R findAllTeacher() {
        List<EduTeacher> list = teacherService.list(null);
        return R.ok().data("items", list);
    }

    //删除某个教师
    @ApiOperation(value = "根据ID删除讲师")
    @DeleteMapping("{id}")
    public R removeById(@ApiParam(name = "id", value = "讲师ID", required = true)
                        @PathVariable String id) {
        boolean b = teacherService.removeById(id);
        return b ? R.ok() : R.error();
    }

    //分页查询讲师
    @ApiOperation(value = "分页查询讲师信息")
    @GetMapping("/pageTeacher/{current}/{limit}")
    public R pageListTeacher(@PathVariable long current,
                             @PathVariable long limit) {


        Page<EduTeacher> pageTeacher = new Page<>(current,limit);


        teacherService.page(pageTeacher, null);//分页查询的数据依然存在于pageTeacher

        long total = pageTeacher.getTotal();
        List<EduTeacher> records = pageTeacher.getRecords();


        return R.ok().data("total", total).data("rows", records);

    }

    //条件查询讲师(带分页)
    @PostMapping("/pageTeacherCondition/{current}/{limit}")
    public R pageTeacherCondition(@PathVariable long current,
                                  @PathVariable long limit,
                                  @RequestBody(required = false) TeacherQuery teacherQuery) {


        //创建page对象
        Page<EduTeacher> pageTeacher = new Page<>(current, limit);

        //添加条件
        QueryWrapper<EduTeacher> wrapper = new QueryWrapper();
        String begin = teacherQuery.getBegin();
        String end = teacherQuery.getEnd();
        Integer level = teacherQuery.getLevel();
        String name = teacherQuery.getName();

        if (!StringUtils.isEmpty(name)) {
            wrapper.like("name", name);
        }
        if (!StringUtils.isEmpty(level)) {
            wrapper.eq("level", level);
        }
        if (!StringUtils.isEmpty(begin)) {
            wrapper.ge("gmt_create", begin);
        }
        if (!StringUtils.isEmpty(end)) {
            wrapper.le("gmt_create", end);
        }

        //调用方法实现分页
        teacherService.page(pageTeacher, wrapper);

        long total = pageTeacher.getTotal();
        List<EduTeacher> records = pageTeacher.getRecords();

        return R.ok().data("total", total).data("rows", records);
    }

    //添加讲师
    @PostMapping("/addTeacher")
    public R addTeacher(@RequestBody EduTeacher teacher) {
        boolean save = teacherService.save(teacher);
        return save ? R.ok() : R.error();
    }

    //根据id查询讲师
    @GetMapping("/getTeacher/{id}")
    public R getTeacher(@PathVariable String id) {
        EduTeacher eduTeacher = teacherService.getById(id);
        return R.ok().data("teacher", eduTeacher);
    }

    //修改教师
    @ApiOperation(value = "修改教师")
    @PostMapping("/updateTeacher")
    public R updateTeacher(@RequestBody EduTeacher eduTeacher) {
        boolean b = teacherService.updateById(eduTeacher);
        return b ? R.ok() : R.error();
    }


}

