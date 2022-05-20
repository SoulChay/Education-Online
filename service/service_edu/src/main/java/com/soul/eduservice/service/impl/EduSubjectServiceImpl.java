package com.soul.eduservice.service.impl;

import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fasterxml.jackson.databind.util.BeanUtil;
import com.soul.eduservice.entity.EduSubject;
import com.soul.eduservice.entity.excel.SubjectData;
import com.soul.eduservice.entity.subject.OneSubject;
import com.soul.eduservice.entity.subject.TwoSubject;
import com.soul.eduservice.listener.SubjectExcelListener;
import com.soul.eduservice.mapper.EduSubjectMapper;
import com.soul.eduservice.service.EduSubjectService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 课程科目 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2022-03-21
 */
@Service
public class EduSubjectServiceImpl extends ServiceImpl<EduSubjectMapper, EduSubject> implements EduSubjectService {

    //添加课程分类
    @Override
    public void saveSubject(MultipartFile file, EduSubjectService eduSubjectService) {

        try {
            InputStream in = file.getInputStream();
            EasyExcel.read(in, SubjectData.class, new SubjectExcelListener(eduSubjectService)).sheet().doRead();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @Override
    public List<OneSubject> getAllOneTwoSubject() {

        //查询所有一级分类
        QueryWrapper<EduSubject> wrapperOne = new QueryWrapper<>();
        wrapperOne.eq("parent_id", "0");
        List<EduSubject> oneEduSubjectList = baseMapper.selectList(wrapperOne);

        //查询所有二级分类
        QueryWrapper<EduSubject> wrapperTwo = new QueryWrapper<>();
        wrapperOne.ne("parent_id", "0");
        List<EduSubject> twoEduSubjectList = baseMapper.selectList(wrapperTwo);

        List<OneSubject> resList = new ArrayList<>();

        //封装一级分类
        for (EduSubject eduSubject : oneEduSubjectList) {
            OneSubject oneSubject = new OneSubject();
            BeanUtils.copyProperties(eduSubject, oneSubject);

            List<TwoSubject> children = new ArrayList<>();
            for (EduSubject twoSubject : twoEduSubjectList) {
                if (twoSubject.getParentId().equals(oneSubject.getId())) {
                    TwoSubject tmpTwoSubject = new TwoSubject();
                    BeanUtils.copyProperties(twoSubject,tmpTwoSubject);
                    children.add(tmpTwoSubject);
                }
            }
            oneSubject.setChildren(children);

            resList.add(oneSubject);
        }
        return resList;
    }


}
