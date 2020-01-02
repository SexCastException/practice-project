package cn.huazai123.maven.web.entity;

import cn.huazai123.maven.web.base.BaseEntity;

public class OrderItem extends BaseEntity<OrderItem> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private double actualPrice; // 实际价格
	private double currentPrice; // 原来价格
	private int number; // 数量
	private Food food;
	private Order order;

	public double getActualPrice() {
		return actualPrice;
	}

	public void setActualPrice(double actualPrice) {
		this.actualPrice = actualPrice;
	}

	public double getCurrentPrice() {
		return currentPrice;
	}

	public void setCurrentPrice(double currentPrice) {
		this.currentPrice = currentPrice;
	}

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

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

}
