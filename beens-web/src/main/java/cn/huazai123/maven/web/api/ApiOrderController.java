package cn.huazai123.maven.web.api;

import cn.huazai123.maven.web.entity.Food;
import cn.huazai123.maven.web.entity.Order;
import cn.huazai123.maven.web.service.OrderService;
import cn.huazai123.maven.web.utils.LayuiPageUtils;
import cn.huazai123.maven.web.utils.StringUtil;
import cn.huazai123.maven.web.utils.enumeration.CommonResultEnum;
import cn.huazai123.maven.web.utils.json.BaseJsonResult;
import cn.huazai123.maven.web.utils.json.LayuiJsonResult;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 订单接口
 *
 * @author pyh
 */
@Controller
@RequestMapping(value = {"api/order"})
public class ApiOrderController {
    @Autowired
    private OrderService orderService;

    @ModelAttribute
    public Order get(String id, Model model) throws Exception {
        Order order;
        if (StringUtil.isNotBlank(id)) {
            order = orderService.get(new Order(id));
        } else {
            order = new Order();
        }
        return order;
    }

    @RequestMapping(value = "getOrderList")
    @ResponseBody
    public LayuiJsonResult<List<Order>> getOrderList(Order order) {
        try {
            List<Order> orderList = orderService.getOrderList(order);
            LayuiJsonResult<List<Order>> layuiJsonResult = LayuiJsonResult
                    .getInstance(CommonResultEnum.SUCCESS.getCode(), CommonResultEnum.SUCCESS.getMessage(), orderList);
            LayuiPageUtils.parsePage(layuiJsonResult, (Page<Order>) orderList);
            return layuiJsonResult;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return LayuiJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), CommonResultEnum.DEFEATE.getMessage());
    }

    @RequestMapping(value = "orderFinish")
    @ResponseBody
    public BaseJsonResult<Object> orderFinish(Order order) {
        try {
            if (order.getState() != 0) {
                return BaseJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), "该订单已处理");
            }
            order.setState(1);
            orderService.update(order);
            return BaseJsonResult.getInstance(CommonResultEnum.SUCCESS.getCode(), CommonResultEnum.SUCCESS.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return BaseJsonResult.getInstance(CommonResultEnum.DEFEATE.getCode(), "修改失败");
    }
}
