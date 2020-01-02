package cn.huazai123.maven.web.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;

import cn.huazai123.maven.web.base.AbstractService;
import cn.huazai123.maven.web.entity.Store;
import cn.huazai123.maven.web.mapper.StoreMapper;

@Service
@Transactional(readOnly = true)
public class StoreService extends AbstractService<StoreMapper, Store> {

    /**
     * 获取店铺列表
     *
     * @param store
     * @return
     * @throws Exception
     */
    public List<Store> getStoreList(Store store) throws Exception {
        try {
            PageHelper.startPage(store.getPageNum(), store.getPageSize());
        } catch (NullPointerException e) {
            store.setPageNum(1);
            store.setPageSize(8);
            PageHelper.startPage(1, 8);
        }

        PageHelper.orderBy(store.getOrderBy());
        return super.findList(store);
    }

    /**
     * 店铺详情
     *
     * @param store
     * @return
     * @throws Exception
     */
    public Store getStoreDetail(Store store) throws Exception {
        try {
            PageHelper.startPage(store.getPageNum(), store.getPageSize());
        } catch (NullPointerException e) {
            store.setPageNum(1);
            store.setPageSize(8);
            PageHelper.startPage(1, 8);
        }
        return super.get(store);
    }

    public List<Store> storeComment(Store store) throws Exception {
        return dao.storeComment(store);
    }
}
