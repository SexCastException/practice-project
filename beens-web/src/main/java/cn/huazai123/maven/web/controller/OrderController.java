package cn.huazai123.maven.web.controller;

import cn.huazai123.maven.web.config.AlipayConfig;
import cn.huazai123.maven.web.entity.*;
import cn.huazai123.maven.web.service.AddressService;
import cn.huazai123.maven.web.service.CartItemService;
import cn.huazai123.maven.web.service.OrderItemService;
import cn.huazai123.maven.web.service.OrderService;
import cn.huazai123.maven.web.utils.enumeration.OrderEnum;
import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;

@Controller
@RequestMapping("order")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private CartItemService cartItemService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private OrderItemService orderItemService;

    @RequestMapping("comfirm")
    public String detail(String ids, Model model) {
        try {
            List<String> idList = new ArrayList<String>(new HashSet<String>(Arrays.asList(ids.split(","))));
            List<CartItem> cartItemList = cartItemService.goodsComfirm(idList);
            Address address = new Address();
            address.setUser(((User) SecurityUtils.getSubject().getPrincipal()));
            List<Address> addressList = addressService.findList(address);

            model.addAttribute("cartItemList", cartItemList);
            model.addAttribute("addressList", addressList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "WEB-INF/page/order_confirmation";
    }

    /**
     * 查看订单列表
     *
     * @return
     */
    @RequestMapping(value = {"list", ""})
    public String list(Order order, HttpServletRequest request, Model model) {
        try {
            User user = (User) SecurityUtils.getSubject().getPrincipal();
            order.setUser(user);
            request.getSession().setAttribute("index", 3);
            model.addAttribute("orderList", orderService.findOrderList(order));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "WEB-INF/page/order";
    }

    @RequestMapping(value = {"orderDetail"})
    public String orderDetail(Order order, HttpServletRequest request, Model model) {
        try {
            Order orderDetail = orderService.get(order);
            OrderItem orderItem = new OrderItem();
            orderItem.setOrder(order);
            List<OrderItem> orderItemList = orderItemService.findList(orderItem);
            model.addAttribute("order", orderDetail);
            model.addAttribute("orderItemList", orderItemList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "WEB-INF/page/order_detail";
    }

    @RequestMapping("pay")
    public void pay(Pay pay, String ids, String addressId, HttpServletResponse response, HttpServletRequest request,
                    Model model) {
        try {
            // 初始化支付客户端
            AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
                    AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key,
                    AlipayConfig.sign_type);

            List<String> idList = new ArrayList<String>(new HashSet<String>(Arrays.asList(ids.split(","))));
            List<CartItem> cartItemList = cartItemService.goodsComfirm(idList);

            // 设置请求参数
            AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
            String returnUrl = AlipayConfig.return_url;
            returnUrl += ("?cartItemIds=" + ids + "&addressId=" + addressId);
            alipayRequest.setReturnUrl(returnUrl);
            alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
            alipayRequest.setBizContent(initPayMap(cartItemList, pay).toJSONString());

            response.setContentType("text/html");
            // 请求
            String result = alipayClient.pageExecute(alipayRequest).getBody();
            response.getWriter().println(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 初始化支付请求参数
     *
     * @param cartItemList
     * @param pay
     * @return
     */
    private JSONObject initPayMap(List<CartItem> cartItemList, Pay pay) {
        Double totalAmount = 0D;
        for (CartItem cartItem : cartItemList) {
            if (cartItem.getFood() != null) {
                totalAmount += (cartItem.getFood().getCurrentPrice() * cartItem.getNumber());
            }
        }

        Map<String, Object> map = new HashMap<>();
        map.put("out_trade_no", new Date().getTime()); // 必填
        map.put("total_amount", new BigDecimal(totalAmount).setScale(2, RoundingMode.HALF_UP).doubleValue()); // 必填
        map.put("subject", pay.getSubject()); // 必填
        map.put("body", pay.getBody());
        map.put("product_code", pay.getProductCode());
        JSONObject jsonObject = new JSONObject(map);
        return jsonObject;
    }

    /**
     * 支付成功后跳转的页面
     */
    @RequestMapping("payReturn")
    public String payReturn(String cartItemIds, String trade_no, double total_amount, String addressId) {
        try {
            // 根据购买的商品id批量查找
            List<String> idList = new ArrayList<String>(new HashSet<String>(Arrays.asList(cartItemIds.split(","))));
            List<CartItem> cartItemList = cartItemService.goodsComfirm(idList);
            // 下单时填写的地址
            Address address = addressService.get(new Address(addressId));

            // 初始化订单实体类参数
            Order order = new Order();
            order.preInsert();
            order.setOrderTime(new Date());
            order.setTradeNo(trade_no);
            order.setTotalAmount(total_amount);
            // 默认订单未完成
            order.setState(OrderEnum.UNFINISH.getCode());
            order.setAddress(address);
            order.setUser((User) SecurityUtils.getSubject().getPrincipal());

            List<OrderItem> orderItemList = new ArrayList<OrderItem>();
            for (CartItem cartItem : cartItemList) {
                OrderItem orderItem = new OrderItem();
                orderItem.preInsert();
                orderItem.setOrder(order);
                orderItem.setNumber(cartItem.getNumber());
                orderItem.setFood(cartItem.getFood());
                orderItemList.add(orderItem);
            }
            order.setOrderItemList(orderItemList);
            orderService.submitOrder(order, idList);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:list";
    }

    @RequestMapping("payNotify")
    public void payNotify() {
        System.out.println("payNotify");
    }

}
