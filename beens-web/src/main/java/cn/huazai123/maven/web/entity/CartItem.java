package cn.huazai123.maven.web.entity;

import cn.huazai123.maven.web.base.BaseEntity;

public class CartItem extends BaseEntity<CartItem> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int number; // 商品数量
	private Food food; // 所关联的食物
	private ShoppingCart shoppingCart; // 所属购物车

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public Food getFood() {
		return food;
	}

	public void setFood(Food food) {
		this.food = food;
	}

	public ShoppingCart getShoppingCart() {
		return shoppingCart;
	}

	public void setShoppingCart(ShoppingCart shoppingCart) {
		this.shoppingCart = shoppingCart;
	}

}
