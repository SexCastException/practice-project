package cn.huazai123.maven.web.service;

import cn.huazai123.maven.web.base.AbstractService;
import cn.huazai123.maven.web.entity.Food;
import cn.huazai123.maven.web.entity.Order;
import cn.huazai123.maven.web.entity.OrderItem;
import cn.huazai123.maven.web.mapper.CartItemMapper;
import cn.huazai123.maven.web.mapper.FoodMapper;
import cn.huazai123.maven.web.mapper.OrderItemMapper;
import cn.huazai123.maven.web.mapper.OrderMapper;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class OrderService extends AbstractService<OrderMapper, Order> {
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private OrderItemMapper orderItemMapper;
    @Autowired
    private CartItemMapper cartItemMapper;
    @Autowired
    private FoodMapper foodMapper;

    public List<Order> findOrderList(Order order) throws Exception {
        PageHelper.startPage(order.getPageNum(), 5);
        List<Order> orderList = super.findList(order);

        //查询订单详情
        for (Order ord : orderList) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrder(ord);
            List<OrderItem> orderItemList = orderItemMapper.findList(orderItem);
            ord.setOrderItemList(orderItemList);
        }

        return orderList;
    }

    @Transactional(readOnly = false)
    public void submitOrder(Order order, List<String> idList) throws Exception {
        // 1.添加订单记录
        orderMapper.insert(order);
        // 2.批量添加订单项记录
        orderItemMapper.batchInsert(order.getOrderItemList());
        // 3.更新商品信息
        List<Food> foodList = new ArrayList<Food>();
        for (OrderItem orderItem : order.getOrderItemList()) {
            Food food = orderItem.getFood();
            // 3.1更新库存
            food.setRepertory(food.getRepertory() - orderItem.getNumber());
            // 3.2更新销量
            food.setSellNum(food.getSellNum() + orderItem.getNumber());
            foodList.add(food);
        }
        foodMapper.batchUpdateInfo(foodList);
        // 4.批量删除购物车已购买的商品
        cartItemMapper.batchDelete(idList);
    }

    public List<Order> getOrderList(Order order) throws Exception {
        try {
            PageHelper.startPage(order.getPageNum(), order.getPageSize());
        } catch (NullPointerException e) {
            order.setPageNum(1);
            order.setPageSize(8);
            PageHelper.startPage(1, 8);
        }
        PageHelper.orderBy(order.getOrderBy());
        return super.findList(order);
    }
}
