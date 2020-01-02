package cn.huazai123.maven.web.entity;

import java.util.List;

import cn.huazai123.maven.web.base.BaseEntity;

public class ShoppingCart extends BaseEntity<ShoppingCart> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private User user;

	private List<CartItem> cartItemList;

	public ShoppingCart() {
	}

	public ShoppingCart(String id) {
		this.id = id;
	}

	public List<CartItem> getCartItemList() {
		return cartItemList;
	}

	public void setCartItemList(List<CartItem> cartItemList) {
		this.cartItemList = cartItemList;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
