package com.soul.eduservice.client;

import com.soul.commonutils.response.R;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 熔断器实现类
 */
@Component
public class VodFileDegradeFeignClient  implements VodClient{
    @Override
    public R removeAlyVideo(String id) {
        return R.error().message("删除视频出错了");
    }

    @Override
    public R deleteBatch(List<String> videoList) {
        return R.error().message("批量删除视频出错了");
    }
}
