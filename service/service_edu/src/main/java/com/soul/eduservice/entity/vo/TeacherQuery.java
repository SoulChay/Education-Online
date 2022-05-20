package com.soul.eduservice.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class TeacherQuery {

    @ApiModelProperty(value = "教师名称，模糊查询")
    private String name;

    @ApiModelProperty(value = "头衔 ----> 1:高级讲师 2:首席讲师")
    private Integer level;

    @ApiModelProperty(value = "查询开始时间",example = "2022-03-14-12:40:10")
    private String begin;

    @ApiModelProperty(value = "查询结束时间",example = "2022-12-01-12:40:10")
    private String end;

}
