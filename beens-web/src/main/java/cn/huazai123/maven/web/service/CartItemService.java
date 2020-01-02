package cn.huazai123.maven.web.service;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.huazai123.maven.web.base.AbstractService;
import cn.huazai123.maven.web.entity.CartItem;
import cn.huazai123.maven.web.entity.Food;
import cn.huazai123.maven.web.entity.ShoppingCart;
import cn.huazai123.maven.web.entity.User;
import cn.huazai123.maven.web.exception.UnderstockException;
import cn.huazai123.maven.web.mapper.CartItemMapper;
import cn.huazai123.maven.web.mapper.FoodMapper;
import cn.huazai123.maven.web.mapper.ShoppingCartMapper;
import cn.huazai123.maven.web.utils.enumeration.CartResultEnum;
import cn.huazai123.maven.web.utils.json.BaseJsonResult;

@Service
@Transactional(readOnly = true)
public class CartItemService extends AbstractService<CartItemMapper, CartItem> {

	@Autowired
	private ShoppingCartMapper shoppingCartMapper;

	@Autowired
	private FoodMapper foodMapper;

	/**
	 * 更新购物车商品并获取商品信息
	 * 
	 * @param cartItem
	 * @return
	 * @throws Exception
	 */
	@Transactional(readOnly = false)
	public @ResponseBody BaseJsonResult<ShoppingCart> updateShoppingCart(CartItem cartItem, String foodId)
			throws Exception {

		Food food = foodMapper.get(new Food(foodId));
		if (cartItem.getNumber() > food.getRepertory()) {
			throw new UnderstockException("库存不足");
		}

		// 更新购物车数量
		int rows = dao.updateNumber(cartItem);
		if (rows < 1) {
			throw new Exception("更新失败");
		}

		// 获取购物车商品信息
		ShoppingCart entity = shoppingCartMapper
				.get(new ShoppingCart(((User) SecurityUtils.getSubject().getPrincipal()).getId()));

		return BaseJsonResult.getInstance(CartResultEnum.SUCCESS.getCode(), CartResultEnum.SUCCESS.getMessage(),
				entity);
	}

	/**
	 * 通过id删除
	 * 
	 * @param cartItem
	 * @throws Exception
	 */
	@Transactional(readOnly = false)
	public void deleteById(CartItem cartItem) throws Exception {
		super.delete(cartItem);
	}

	/**
	 * 批量删除
	 * 
	 * @param ids
	 */
	@Transactional(readOnly = false)
	public void batchDelete(List<String> ids) {
		dao.batchDelete(ids);
	}

	/**
	 * 
	 * @param ids
	 * @return
	 */
	public List<CartItem> goodsComfirm(List<String> ids) {
		return dao.goodsComfirm(ids);
	}

}
