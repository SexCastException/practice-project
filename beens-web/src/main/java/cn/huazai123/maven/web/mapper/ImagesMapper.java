package cn.huazai123.maven.web.mapper;

import cn.huazai123.maven.web.base.IBaseMapper;
import cn.huazai123.maven.web.entity.Images;

public interface ImagesMapper extends IBaseMapper<Images> {

    /**
     * 通过url删除图片
     *
     * @param images
     * @return
     */
    int deleteByUrl(Images images);
}
