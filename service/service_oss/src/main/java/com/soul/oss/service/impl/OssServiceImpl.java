package com.soul.oss.service.impl;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.soul.oss.service.OssService;
import com.soul.oss.utils.ConstantPropertiesUtils;
import org.joda.time.DateTime;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.UUID;

@Service
public class OssServiceImpl implements OssService {

    /**
     * 上传头像到oss
     */
    @Override
    public String uploadFileAvatar(MultipartFile file) {
        //获取工具类中的值
        String endpoint = ConstantPropertiesUtils.END_POIND;
        String accesssKeyId = ConstantPropertiesUtils.ACCESSS_KEY_ID;
        String accesssKeySecret = ConstantPropertiesUtils.ACCESSS_KEY_SECRET;
        String bucketName = ConstantPropertiesUtils.BUCKET_NAME;

        InputStream inputStream = null;

        try {
            //创建OSS实例
            OSS ossClient = new OSSClientBuilder().build(endpoint, accesssKeyId, accesssKeySecret);

            //上传文件流
            inputStream = file.getInputStream();
            String originalFilename = file.getOriginalFilename();
            //在每个文件名前添加随机唯一数值 ---> 防止因文件名相同被覆盖
            String uuid = UUID.randomUUID().toString().replaceAll("-", "");
            //把文件按照日期分类
            String dateStr = new DateTime().toString("yyyy/MM/dd");

            originalFilename = dateStr + "/" +uuid + originalFilename;

            ossClient.putObject(bucketName, originalFilename, inputStream);

            inputStream.close();

            //把上传的文件路径进行拼接返回
            return "https://" + bucketName + "." + endpoint + "/" + originalFilename;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
