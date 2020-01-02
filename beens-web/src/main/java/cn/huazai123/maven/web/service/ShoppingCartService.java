package cn.huazai123.maven.web.service;

import java.util.Date;
import java.util.List;
import java.util.Objects;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.huazai123.maven.web.base.AbstractService;
import cn.huazai123.maven.web.entity.CartItem;
import cn.huazai123.maven.web.entity.Food;
import cn.huazai123.maven.web.entity.ShoppingCart;
import cn.huazai123.maven.web.entity.User;
import cn.huazai123.maven.web.exception.UnderstockException;
import cn.huazai123.maven.web.mapper.CartItemMapper;
import cn.huazai123.maven.web.mapper.FoodMapper;
import cn.huazai123.maven.web.mapper.ShoppingCartMapper;

@Service
@Transactional(readOnly = true)
public class ShoppingCartService extends AbstractService<ShoppingCartMapper, ShoppingCart> {

	@Autowired
	private FoodMapper foodMapper;

	@Autowired
	private CartItemMapper cartItemMapper;

	/**
	 * 判断该用户是否存在购物车（即第一次使用），不存在则创建购物车
	 * 
	 * @return
	 * @throws Exception
	 */

	@Transactional(readOnly = false)
	public ShoppingCart getShoppingCart() throws Exception {
		ShoppingCart shoppingCart = null;
		// 查询是否存在该购物车
		shoppingCart = new ShoppingCart(((User) SecurityUtils.getSubject().getPrincipal()).getId());
		ShoppingCart cart = super.get(shoppingCart);
		if (Objects.isNull(cart)) {
			// 不存在则创建
			shoppingCart.setCreateDate(new Date());
			shoppingCart.setUpdateDate(new Date());
			super.insert(shoppingCart);
			return shoppingCart;
		}
		return cart;
	}

	/**
	 * 将商品加入购物车
	 * 
	 * @param cartItem
	 * @param foodId
	 * @return
	 * @throws Exception
	 */
	@Transactional(readOnly = false)
	public void addGoods(CartItem cartItem, String foodId) throws Exception {
		Food f = new Food(foodId);

		// 获取购物车
		ShoppingCart shoppingCart = getShoppingCart();

		// 根据食物ID获取食物，如果不为空则继续
		Food food = foodMapper.get(f);
		if (Objects.isNull(food)) {
			throw new Exception("该商品已下架！");
		}

		// 查询当前用户的购物车是否存在该商品，如果存在更新数量，如果不存在则向购物车加入该商品
		cartItem.setFood(food);
		cartItem.setShoppingCart(shoppingCart);
		List<CartItem> cartItemsList = cartItemMapper.findList(cartItem);
		if (!Objects.isNull(cartItemsList) && cartItemsList.size() > 0) {
			// 存在一个以上的结果则抛出异常
			if (cartItemsList.size() > 1) {
				throw new Exception("未知错误！");
			}
			// 如果存在则更新商品数量
			CartItem ci = cartItemsList.get(0);
			ci.setNumber(ci.getNumber() + cartItem.getNumber());

			// 判断商品库存是否充足
			if (ci.getNumber() > food.getRepertory()) {
				throw new UnderstockException("库存不足");
			}

			// 更新购物车数量
			cartItemMapper.update(ci);
		} else {
			// 判断商品库存是否充足
			if (cartItem.getNumber() > food.getRepertory()) {
				throw new UnderstockException("库存不足");
			}

			// 如果不存在则加入该商品
			cartItem.preInsert();
			cartItemMapper.insert(cartItem);
		}
	}

	/**
	 * 
	 * @param ids
	 * @return
	 */
	@Transactional(readOnly = true)
	List<CartItem> orderComfirm(List<String> ids) {
		return null;
	}

}
