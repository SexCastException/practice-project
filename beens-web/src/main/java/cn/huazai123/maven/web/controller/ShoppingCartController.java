package cn.huazai123.maven.web.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.huazai123.maven.web.entity.CartItem;
import cn.huazai123.maven.web.entity.ShoppingCart;
import cn.huazai123.maven.web.entity.User;
import cn.huazai123.maven.web.exception.UnderstockException;
import cn.huazai123.maven.web.service.CartItemService;
import cn.huazai123.maven.web.service.ShoppingCartService;
import cn.huazai123.maven.web.utils.enumeration.CartResultEnum;
import cn.huazai123.maven.web.utils.enumeration.CommonResultEnum;
import cn.huazai123.maven.web.utils.json.BaseJsonResult;

@Controller
@RequestMapping("shoppingCart")
public class ShoppingCartController {
    @Autowired
    private ShoppingCartService shoppingCartService;

    @Autowired
    private CartItemService cartItemService;

    @RequestMapping("")
    public String shoppingCart(HttpServletRequest request, Model model) {
        try {
            ShoppingCart cart = shoppingCartService
                    .get(new ShoppingCart(((User) SecurityUtils.getSubject().getPrincipal()).getId()));
            request.getSession().setAttribute("index", 2);
            model.addAttribute("cart", cart);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "WEB-INF/page/shopping_cart";
    }

    /**
     * 加入购物车
     *
     * @param cartItem 获取加入的数量
     * @param foodId   食物id
     * @param model
     * @param response
     */
    @RequestMapping("addGoods")
    @ResponseBody
    public BaseJsonResult<Object> addGoods(CartItem cartItem, @RequestParam(required = true) String foodId, Model model,
                                           HttpServletResponse response) {
        try {
            if (cartItem.getNumber() > 0) {
                shoppingCartService.addGoods(cartItem, foodId);
                return BaseJsonResult.getInstance(CartResultEnum.SUCCESS.getCode(),
                        CartResultEnum.SUCCESS.getMessage());
            }
        } catch (UnderstockException e) {
            return BaseJsonResult.getInstance(CartResultEnum.UNDERSTOCK.getCode(),
                    CartResultEnum.UNDERSTOCK.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return BaseJsonResult.getInstance(CartResultEnum.DEFEATE.getCode(), CartResultEnum.DEFEATE.getMessage());

    }

    @RequestMapping("numChange")
    @ResponseBody
    public BaseJsonResult<ShoppingCart> numChange(CartItem cartItem, String foodId, HttpServletResponse response,
                                                  Model model) {
        try {
            if (cartItem.getNumber() > 0) {
                // 更新购物车同时获取购物车商品信息
                return cartItemService.updateShoppingCart(cartItem, foodId);
            }

        } catch (UnderstockException e) {
            return BaseJsonResult.getInstance(CartResultEnum.UNDERSTOCK.getCode(),
                    CartResultEnum.UNDERSTOCK.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return BaseJsonResult.getInstance(CartResultEnum.EXCEPTION.getCode(),
                    CartResultEnum.EXCEPTION.getMessage());
        }
        return BaseJsonResult.getInstance(CartResultEnum.DEFEATE.getCode(), CartResultEnum.DEFEATE.getMessage());
    }

    @RequestMapping("delete")
    @ResponseBody
    public BaseJsonResult<ShoppingCart> delete(CartItem cartItem) {
        try {
            cartItemService.deleteById(cartItem);
        } catch (Exception e) {
            e.printStackTrace();
            return BaseJsonResult.getInstance(CommonResultEnum.EXCEPTION.getCode(),
                    CommonResultEnum.EXCEPTION.getMessage());
        }
        return BaseJsonResult.getInstance(CommonResultEnum.SUCCESS.getCode(), "删除成功!");
    }

    @RequestMapping("batchDelete")
    @ResponseBody
    public BaseJsonResult<ShoppingCart> batchDelete(String ids) {
        try {
            List<String> idList = new ArrayList<String>(new HashSet<String>(Arrays.asList(ids.split(","))));
            cartItemService.batchDelete(idList);
        } catch (Exception e) {
            e.printStackTrace();
            return BaseJsonResult.getInstance(CommonResultEnum.EXCEPTION.getCode(),
                    CommonResultEnum.EXCEPTION.getMessage());
        }
        return BaseJsonResult.getInstance(CommonResultEnum.SUCCESS.getCode(), "删除成功!");
    }

}
