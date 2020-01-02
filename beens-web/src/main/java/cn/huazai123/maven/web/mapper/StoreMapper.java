package cn.huazai123.maven.web.mapper;

import cn.huazai123.maven.web.base.IBaseMapper;
import cn.huazai123.maven.web.entity.Store;

import java.util.List;


public interface StoreMapper extends IBaseMapper<Store> {

    List<Store> storeComment(Store store);
}
