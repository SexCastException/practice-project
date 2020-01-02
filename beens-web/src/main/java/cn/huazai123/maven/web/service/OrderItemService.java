package cn.huazai123.maven.web.service;

import cn.huazai123.maven.web.base.AbstractService;
import cn.huazai123.maven.web.entity.OrderItem;
import cn.huazai123.maven.web.mapper.OrderItemMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class OrderItemService extends AbstractService<OrderItemMapper, OrderItem> {

}
