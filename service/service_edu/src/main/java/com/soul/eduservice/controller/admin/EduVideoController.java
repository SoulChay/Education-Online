package com.soul.eduservice.controller.admin;


import com.soul.commonutils.response.R;
import com.soul.eduservice.client.VodClient;
import com.soul.eduservice.entity.EduVideo;
import com.soul.eduservice.service.EduVideoService;
import com.soul.servicebase.exception.GuliException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 课程视频 前端控制器
 * </p>
 *
 * @author testjava
 * @since 2022-03-21
 */
@RestController
@RequestMapping("/eduservice/video")
public class EduVideoController {

    @Autowired
    private EduVideoService videoService;

    @Autowired
    private VodClient vodClient;

    //添加小节
    @PostMapping("addVideo")
    public R addVideo(@RequestBody EduVideo eduVideo) {
        videoService.save(eduVideo);
        return R.ok();
    }

    // 删除小节对应的阿里云视频 与 删除小节
    @DeleteMapping("{id}")
    public R deleteVideo(@PathVariable String id) {
        String videoSourceId = videoService.getById(id).getVideoSourceId();
        if (!StringUtils.isEmpty(videoSourceId)){
            R result = vodClient.removeAlyVideo(videoSourceId);//删除视频
            if (result.getCode() == 20001){
                throw new GuliException("视频删除失败，熔断器...",20001);
            }

        }

        videoService.removeById(id);//删除小节
        return R.ok();
    }

    //修改小节 TODO

}

