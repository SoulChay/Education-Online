package com.soul.eduservice.service;

import com.soul.eduservice.entity.EduChapter;
import com.baomidou.mybatisplus.extension.service.IService;
import com.soul.eduservice.entity.chapter.ChapterVo;

import java.util.List;

/**
 * <p>
 * 课程 服务类
 * </p>
 *
 * @author testjava
 * @since 2022-03-21
 */
public interface EduChapterService extends IService<EduChapter> {

    List<ChapterVo> getChapterVideoByCourseId(String courseId);


    boolean deleteChapter(String chapterId);

    void removeChapterByCourseId(String courseId);
}
