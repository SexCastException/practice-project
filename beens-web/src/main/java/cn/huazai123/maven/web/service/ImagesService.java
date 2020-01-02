package cn.huazai123.maven.web.service;

import cn.huazai123.maven.web.base.AbstractService;
import cn.huazai123.maven.web.entity.Images;
import cn.huazai123.maven.web.mapper.ImagesMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 图片service
 */
@Service
@Transactional(readOnly = true)
public class ImagesService extends AbstractService<ImagesMapper, Images> {

    @Transactional(readOnly = false)
    public boolean deleteByUrl(Images images) {
        if (dao.deleteByUrl(images) > 0) {
            return true;
        }
        return false;
    }
}
