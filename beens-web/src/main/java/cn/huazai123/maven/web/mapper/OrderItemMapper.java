package cn.huazai123.maven.web.mapper;

import java.util.List;

import cn.huazai123.maven.web.base.IBaseMapper;
import cn.huazai123.maven.web.entity.OrderItem;

public interface OrderItemMapper extends IBaseMapper<OrderItem> {

	/**
	 * 批量插入
	 * 
	 * @param orderItemList
	 * @return
	 */
	int batchInsert(List<OrderItem> orderItemList);
}
